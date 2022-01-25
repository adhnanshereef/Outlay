import 'package:flutter/material.dart';

class About extends StatelessWidget {
  const About({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: ListView(
                children: [
                  Column(
                    children: const [
                      SizedBox(
                        height: 50,
                      ),
                      ImageIcon(
                        AssetImage('assets/logo_.png'),
                        color: Colors.white,
                        size: 75,
                      ),
                      Center(
                        child: Text(
                          'Outlay',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 55,
                            letterSpacing: 5,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Indroduction',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: Text(
                          'The Outlay is a Money Management Application developed by a little boy study in 8th standard.',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w100,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Features',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              '1) Simple to set up.',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.w100,
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              '2) Easy to use.',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.w100,
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              "3) Don't want to download.",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.w100,
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              '4) It works on all devices.',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.w100,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
