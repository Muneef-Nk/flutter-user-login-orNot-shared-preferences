import 'package:bank_application/screens/home/home.dart';
import 'package:bank_application/screens/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    timeForLoading(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            Lottie.asset('asset/animation_llc68yv3.json'),
            Text('WELCOME I BANK', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.green),),
            Lottie.asset('asset/animation_llc6e8fn.json', height: 320 ),

          ],
        ),
      ),
    );
  }

  Future<void> timeForLoading(BuildContext context) async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    bool loginStatus = sp.getBool('loginStatus')!;
    bool newLoginStatus = sp.getBool('newLoginStatus')!;
    print(loginStatus);
    Future.delayed(Duration(seconds: 5));
    if (loginStatus == true) {
      print('working........');
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) => Home()));
    } else {
      if (newLoginStatus == false) {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => LoginScreen()));
      }
    }


  }
}
