import 'package:flutter/material.dart';
import 'package:outlay/db/basic_information/basic_information_db.dart';
import 'package:outlay/db/basic_information/basic_information_model.dart';
import 'package:outlay/screens/home/home.dart';

class GetStarted extends StatelessWidget {
  GetStarted({Key? key}) : super(key: key);
  final _nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
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
        child: SafeArea(
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
                        'The Outlay is a Money Management Application developed by a boy study in 8th standard. An application to easily and securely record your income and expenses.',
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
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            '5) More Secure.',
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
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  height: 75,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.white,
                    ),
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                  ),
                  child: Center(
                    child: TextFormField(
                      controller: _nameController,
                      style: const TextStyle(color: Colors.white),
                      decoration: const InputDecoration(
                        hintText: 'Your Name...',
                        hintStyle: TextStyle(color: Colors.white),
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        focusColor: Colors.white,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 60,
                ),
                Container(
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      stops: [
                        0.10,
                        0.90,
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.centerRight,
                      colors: [
                        Color(0xFF09102a),
                        Color(0xFF003157),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                      minimumSize:
                          MaterialStateProperty.all(const Size(234, 70)),
                      backgroundColor:
                          MaterialStateProperty.all(Colors.transparent),
                      shadowColor:
                          MaterialStateProperty.all(Colors.transparent),
                    ),
                    onPressed: () {
                      getStarted(context);
                    },
                    child: const Text(
                      'Get Started',
                      style: TextStyle(
                        fontSize: 18,
                        // fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void getStarted(BuildContext context) {
    final _name = _nameController.text;
    if (_name.isEmpty) {
      return;
    }
    userName = _name;
    final _model = BasicInformationModel(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      name: _name,
    );
    BasicInformationDB.instance.getStared(_model);
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (ctx) => const Home()));
  }
}
