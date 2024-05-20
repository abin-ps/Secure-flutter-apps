import 'package:choice/inline.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class StoreUserCredentialsExample extends StatefulWidget {
  const StoreUserCredentialsExample({super.key});

  @override
  State<StoreUserCredentialsExample> createState() => _StoreUserCredentialsExampleState();
}

class _StoreUserCredentialsExampleState extends State<StoreUserCredentialsExample> {
  final SizedBox _height16 = const SizedBox(height: 16);
  final SizedBox _width4 = const SizedBox(width: 4);
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

  bool _isValidUserName = true;
  bool _isValidUserInterest = true;

  @override
  void initState() {
    super.initState();

    _userNameController = TextEditingController();
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
                  //todo retrieve the data from secure storage
                },
                icon: Icon(
                  Icons.undo,
                  size: 24,
                  color: theme.primaryColor,
                )),
            _width4,
            IconButton(
                onPressed: () {
                  //todo delete all the data's from secure storage
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
                      onPressed: () {
                        setState(() {
                          _isValidUserName = _userNameController.text.isNotEmpty;
                          _isValidUserInterest = _userInterests.isNotEmpty;
                        });
                        //validating inputs
                        if (_isValidUserName && _isValidUserInterest) {
                          //todo store username and interest on secure storage
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
}
