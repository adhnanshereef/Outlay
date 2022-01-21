import 'package:flutter/material.dart';
import 'package:outlay/db/basic_information/basic_information_db.dart';
import 'package:outlay/screens/home/pages/views/add.dart';
import 'package:outlay/screens/home/pages/views/daily/daily.dart';
import 'package:outlay/screens/home/pages/views/monthly/monthly.dart';
import 'package:outlay/screens/home/pages/settings/settings.dart';

late String userName;

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentSelectedIndex = 0;
  final List tabs = const [
    Daily(),
    Monthly(),
    Settings(),
  ];

  @override
  Widget build(BuildContext context) {
    BasicInformationDB.instance.getBasicInformations();
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          stops: [
            0.10,
            0.90,
          ],
          begin: Alignment.topLeft,
          end: Alignment.centerRight,
          colors: [
            Color(0xFF003157),
            Color(0xFF09102a),
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: _currentSelectedIndex != 2
            ? PreferredSize(
                preferredSize: const Size(double.infinity, 77),
                child: Container(
                  // height: 100,
                  decoration: BoxDecoration(
                    // border: Border.all(color: Colors.white),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.grey,
                        offset: Offset(0.0, 1.0), //(x,y)
                        blurRadius: 5.0,
                      ),
                    ],

                    gradient: const LinearGradient(
                      stops: [
                        0.10,
                        0.90,
                      ],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [
                        Color(0xFF09102a),
                        Color(0xFF003157),
                      ],
                    ),
                    color: Colors.deepPurple.shade300,
                    borderRadius: const BorderRadius.vertical(
                        bottom: Radius.circular(25.0)),
                  ),
                  child: SafeArea(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Outlay',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 40,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "Hi' $userName",
                                style: const TextStyle(color: Colors.white),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            : null,
        body: SafeArea(
          child: tabs[_currentSelectedIndex],
        ),
        floatingActionButton: _currentSelectedIndex != 2
            ? FloatingActionButton(
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (ctx) => const Add()));
                },
                child: const Icon(Icons.add),
                backgroundColor: const Color(0xFF003157),
              )
            : null,
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.calendar_today,
              ),
              label: 'Daily',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.calendar_today,
              ),
              label: 'Monthly',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.calendar_today,
              ),
              label: 'Settings',
            ),
          ],
          onTap: (newIndex) {
            setState(() {
              _currentSelectedIndex = newIndex;
            });
          },
          currentIndex: _currentSelectedIndex,
          backgroundColor: Colors.transparent,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.blueGrey,
        ),
      ),
    );
  }
}
// getColor('050D18')