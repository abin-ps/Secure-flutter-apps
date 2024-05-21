import 'dart:async';

import 'package:choice/inline.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:secure_flutter_apps/examples/store_user_credentials_using_fss/secure_storage.dart';

class StoreUserCredentialsExample extends StatefulWidget {
  const StoreUserCredentialsExample({super.key});

  @override
  State<StoreUserCredentialsExample> createState() => _StoreUserCredentialsExampleState();
}

class _StoreUserCredentialsExampleState extends State<StoreUserCredentialsExample> {
  //sizing widgets
  final SizedBox _height16 = const SizedBox(height: 16);
  final SizedBox _width4 = const SizedBox(width: 4);

  //field controllers
  late final TextEditingController _userNameController;
  final List<String> _interestsList = [
    "Travel",
    "Blogging",
    "Writing",
    "Reading",
    "Coding",
    "Teaching",
    "Consulting",
  ];

  List<String> _userInterests = [];

  //validations
  bool _isValidUserName = true;
  bool _isValidUserInterest = true;

  //secure storage instance
  final SecureStorage _secureStorage = SecureStorage();

  //initData
  Future<(String, List<String>)> getData() async {
    final String userName = await _secureStorage.retreiveUserName();
    final List<String> interests = await _secureStorage.retreiveInterests();

    return (userName, interests);
  }

  @override
  void initState() {
    super.initState();
    _userNameController = TextEditingController();

    getData().then((value) {
      _userNameController.text = value.$1;
      _userInterests = value.$2;
      if (mounted) {
        setState(() {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Secure Storage Example",
            overflow: TextOverflow.ellipsis,
          ),
          actions: [
            //undo button
            IconButton(
                onPressed: () {
                  // retrieve the data from secure storage
                  getData().then((value) {
                    setState(() {
                      _userNameController.text = value.$1;
                      _userInterests = value.$2;
                    });
                    _showMaterialBanner(message: "Credentials restored.", bgColor: Colors.blue);
                  });
                },
                icon: Icon(
                  Icons.refresh,
                  size: 24,
                  color: theme.primaryColor,
                )),
            _width4,
            IconButton(
                onPressed: () {
                  // delete all the data's from secure storage
                  _secureStorage.deleteAllData().then((value) {
                    _showMaterialBanner(message: "User credentials deleted successfully");
                  });
                },
                icon: const Icon(
                  Icons.delete_forever,
                  size: 24,
                  color: Colors.red,
                )),
          ],
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.shield_outlined, color: theme.primaryColor, size: 148),
                  _height16,
                  Text(
                    "Flutter Secure Storage Example Tutorial",
                    maxLines: 3,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 32, color: theme.primaryColor),
                  ),
                  _height16,
                  //username textfield
                  TextFormField(
                    controller: _userNameController,
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                        label: const Text("Username"),
                        labelStyle: TextStyle(
                          fontSize: 18,
                          color: theme.primaryColor,
                        ),
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(16))),
                  ),
                  errorText(error: !_isValidUserName, message: "This field is required"),
                  _height16,
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Interested topic:",
                        style: TextStyle(fontSize: 18, color: theme.primaryColor),
                      )),
                  //interested areas - choice chips
                  InlineChoice<String>.multiple(
                    clearable: false,
                    itemCount: _interestsList.length,
                    value: _userInterests,
                    itemBuilder: (state, index) => ChoiceChip(
                        label: Text(_interestsList[index]),
                        selectedColor: theme.primaryColor,
                        selected: state.selected(_interestsList[index]),
                        onSelected: state.onSelected(_interestsList[index], onChanged: (updatedList) {
                          setState(() {
                            //update existing userInterestsList
                            _userInterests = updatedList;
                          });
                        })),
                  ),

                  errorText(error: !_isValidUserInterest, message: "Must select atleast one topic"),

                  _height16,
                  ElevatedButton(
                      onPressed: () async {
                        setState(() {
                          _isValidUserName = _userNameController.text.isNotEmpty;
                          _isValidUserInterest = _userInterests.isNotEmpty;
                        });
                        //validating inputs
                        if (_isValidUserName && _isValidUserInterest) {
                          // store username and interest on secure storage
                          if (await _secureStorage.storeUserName(_userNameController.text) && await _secureStorage.storeInterests(_userInterests)) {
                            _showMaterialBanner(message: "User credentials saved.", bgColor: Colors.blue);
                          } else {
                            _showMaterialBanner(message: "Delete previous credentials before saving new.", bgColor: Colors.orange);
                          }
                        }
                      },
                      child: const Text("Save"))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _userNameController.dispose();
    super.dispose();
  }

  Widget errorText({required bool error, required String message}) {
    return error
        ? Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Text(
                message,
                style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: Colors.red),
              ),
            ))
        : const SizedBox();
  }

  void _showMaterialBanner({required String message, MaterialColor? bgColor}) {
    // //clear all material banners
    // ScaffoldMessenger.of(context).clearMaterialBanners();
    //custom material banner
    final MaterialBanner materialBanner = MaterialBanner(
      backgroundColor: bgColor?.shade300 ?? Colors.red.shade300,
      content: Text(message),
      actions: const [Icon(Icons.done)],
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      elevation: 4,
      shadowColor: bgColor?.shade100 ?? Colors.redAccent.shade100,
      overflowAlignment: OverflowBarAlignment.center,
    );
    //show material banner
    ScaffoldMessenger.of(context).showMaterialBanner(materialBanner);
    //clear the banner after 3 seconds
    Timer(const Duration(seconds: 3), () {
      ScaffoldMessenger.of(context).clearMaterialBanners();
    });
  }
}
