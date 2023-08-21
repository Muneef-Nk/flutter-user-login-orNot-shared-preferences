import 'package:bank_application/screens/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../register/register_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: size.width,
        height: size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // SizedBox(height: 300,),

              Lottie.asset('asset/animation_ll915uzo.json'),
        GestureDetector(
          onTap: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>LoginScreen()));
          },
          child: Container(
          width: size.width*0.8,
            height: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.deepPurple,
            ),
            child: Center(
              child: Text('Login', style: TextStyle(
                  fontSize: 19, color: Colors.white,
                  fontWeight: FontWeight.bold
              ),),
            ),
          ),
        ),
            SizedBox(height: 20,),
        GestureDetector(
          onTap: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>RegisterScreen()));

          },
          child: Container(
            width: size.width*0.8,
            height: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.deepPurple,
            ),
            child: Center(
              child: Text('Register', style: TextStyle(
                  fontSize: 19, color: Colors.white,
                  fontWeight: FontWeight.bold
              ),),
            ),
          ),
        ),
          ],
        ),
      )
    );
  }


}
