import 'package:flutter/material.dart';
import 'package:outlay/main.dart';
import 'package:outlay/screens/get_started/get_started.dart';
import 'package:outlay/screens/home/home.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    splash();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          stops: [
            0.10,
            0.90,
          ],
          begin: Alignment.centerLeft,
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(),
              Column(
                children: const [
                  ImageIcon(
                    AssetImage('assets/logo_.png'),
                    color: Colors.white,
                    size: 100,
                  ),
                  Center(
                    child: Text(
                      'Outlay',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 65,
                        letterSpacing: 5,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              const Center(
                child: Text(
                  'Loading...',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> splash() async {
    final _sharedPreference = await SharedPreferences.getInstance();
    final _user = _sharedPreference.getBool(user);
    if (_user == null || _user == false) {
      await Future.delayed(const Duration(seconds: 3));
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (ctx) => GetStarted(),
        ),
        (route) => false,
      );
    } else {
      await Future.delayed(const Duration(seconds: 3));
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (ctx) => const Home(),
        ),
        (route) => false,
      );
    }
  }
}
