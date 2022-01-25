import 'package:flutter/material.dart';
import 'package:outlay/db/basic_information/basic_information_db.dart';

import 'package:outlay/screens/home/home.dart';
import 'package:outlay/screens/home/pages/settings/pages/about.dart';
import 'package:outlay/screens/home/pages/settings/pages/help.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  final _userNameEditingController = TextEditingController();
  bool _userNameEditor = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Center(
        child: ListView(
          shrinkWrap: true,
          children: [
            Container(
              width: double.infinity,
              height: 75,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                border: Border.all(
                  color: Colors.white,
                ),
              ),
              child: Center(
                child: ListTile(
                  title: !_userNameEditor
                      ? Text(
                          userName,
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                        )
                      : Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Container(
                            decoration: const BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                              width: 2,
                              color: Colors.white,
                            ))),
                            child: Center(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: TextFormField(
                                  // initialValue: userName,
                                  controller: _userNameEditingController,
                                  style: const TextStyle(color: Colors.white),
                                  decoration: const InputDecoration(
                                    hintText: 'Your Name...',
                                    hintStyle: TextStyle(
                                      color: Colors.white,
                                    ),
                                    border: UnderlineInputBorder(
                                        borderSide: BorderSide.none),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                  trailing: IconButton(
                    onPressed: () {
                      if (!_userNameEditor) {
                        setState(() {
                          _userNameEditor = true;
                        });
                      } else {
                        renaming();
                        setState(() {
                          _userNameEditor = false;
                        });
                      }
                    },
                    icon: !_userNameEditor
                        ? const Icon(
                            Icons.edit,
                            color: Colors.white,
                          )
                        : const Icon(
                            Icons.check,
                            color: Colors.white,
                          ),
                  ),
                  leading: Container(
                    decoration: BoxDecoration(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(50.0)),
                      border: Border.all(
                        color: Colors.white,
                        width: 1.0,
                      ),
                    ),
                    child: const Icon(
                      Icons.account_circle_sharp,
                      color: Colors.white,
                      size: 40,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 32,
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const About()));
              },
              child: Container(
                width: double.infinity,
                height: 75,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                  border: Border.all(
                    color: Colors.white,
                  ),
                ),
                child: const Center(
                  child: ListTile(
                    title: Text(
                      'About',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    leading: Icon(
                      Icons.phone_android,
                      color: Colors.white,
                      size: 40,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 32,
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const Help()));
              },
              child: Container(
                width: double.infinity,
                height: 75,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                  border: Border.all(
                    color: Colors.white,
                  ),
                ),
                child: const Center(
                  child: ListTile(
                    title: Text(
                      'Help',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    leading: Icon(
                      Icons.help,
                      color: Colors.white,
                      size: 40,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 32,
            ),
          ],
        ),
      ),
    );
  }

  void renaming() {
    final _newName = _userNameEditingController.text;
    if (_newName.isEmpty) {
      return;
    }
    setState(() {
      userName = _newName;
    });
    BasicInformationDB.instance.updateBasicInformation(_newName);
  }
}
