import 'package:flutter/material.dart';

class Help extends StatelessWidget {
  const Help({Key? key}) : super(key: key);

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
                  children: [
                    const Text(
                      'How to Start ?',
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
                            '1) Open Outlay and wait for finish loading.',
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
                            '2) Scroll down your screen Maximum.',
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
                            '3) Enter your name in that text box.',
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
                            '4) And click Get Started.',
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
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'How to use it ?',
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
                            '1) Click the button on the right bottom of your screen.',
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
                            '2) Then Enter Title for your transaction.',
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
                            '3) Then enter the amount of your transaction.',
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
                            '4) Then select transaction type.',
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
                            '5) Then select the date of your transaction.',
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
                            '6) Finally, click add to add your transaction.',
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
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          backgroundColor: const Color(0xFF003157),
          child: const Icon(Icons.exit_to_app),
        ),
      ),
    );
  }
}
