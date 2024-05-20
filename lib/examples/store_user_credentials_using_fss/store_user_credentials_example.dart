import 'package:choice/inline.dart';
import 'package:flutter/material.dart';

class StoreUserCredentialsExample extends StatefulWidget {
  const StoreUserCredentialsExample({super.key});

  @override
  State<StoreUserCredentialsExample> createState() => _StoreUserCredentialsExampleState();
}

class _StoreUserCredentialsExampleState extends State<StoreUserCredentialsExample> {
  final SizedBox _height16 = const SizedBox(height: 16);
  final SizedBox _width4 = const SizedBox(width: 4);
  late final TextEditingController _userNameController;
  final List<String> interestsList = [
    "Travel",
    "Blogging",
    "Writing",
    "Reading",
    "Coding",
    "Teaching",
    "Consulting",
  ];

  List<String> userInterests = [];

  @override
  void initState() {
    super.initState();

    _userNameController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);
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
                  color: _theme.primaryColor,
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
                  Icon(Icons.shield_outlined, color: _theme.primaryColor, size: 48),
                  _height16,
                  Text(
                    "Flutter Secure Storage Example Tutorial",
                    maxLines: 3,
                    style: TextStyle(fontSize: 18, color: _theme.primaryColor),
                  ),
                  _height16,
                  //username textfield
                  TextFormField(
                    controller: _userNameController,
                    decoration: InputDecoration(
                        label: const Text("Username"),
                        labelStyle: TextStyle(
                          fontSize: 14,
                          color: _theme.secondaryHeaderColor,
                        ),
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(16))),
                  ),
                  //interested areas - choice chips
                  InlineChoice<String>.multiple(
                    clearable: true,
                    error: userInterests.isEmpty,
                    errorBuilder: (state) => const Padding(
                      padding: EdgeInsets.only(top: 4),
                      child: Text(
                        "Must Select atleast one!",
                        style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: Colors.red),
                      ),
                    ),
                    itemCount: interestsList.length,
                    itemBuilder: (state, index) => ChoiceChip(
                        label: Text(interestsList[index]),
                        selected: state.selected(interestsList[index]),
                        onSelected: state.onSelected(interestsList[index], onChanged: (updatedList) {
                          setState(() {
                            //update existing userInterestsList
                            userInterests = updatedList;
                          });
                        })),
                  ),

                  _height16,
                  ElevatedButton(
                      onPressed: () {
                        //validating inputs
                        if (_userNameController.text.isNotEmpty && userInterests.isNotEmpty) {
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
}
