import 'package:bank_application/screens/home/home.dart';
import 'package:bank_application/screens/register/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController accountNumberController=  TextEditingController();
  TextEditingController passwordController=TextEditingController();

late String no;
late String pass;
  var _formKey = GlobalKey<FormState>();

  getData() async {
   final SharedPreferences sp = await SharedPreferences.getInstance();
    String accountNumber = sp.getString('accountNumber')!;
    String password = sp.getString('password')!;
    setState(() {
      no=accountNumber;
      pass=password;
    });

    if(accountNumberController.text == no && passwordController.text == pass){
      print(accountNumber);
      print(password);
      sp.setBool('loginStatus', true);
      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Home()));

    }else{
      showError(context);
    }


  }

  @override
  Widget build(BuildContext context) {


    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: EdgeInsets.all(20),
          width: MediaQuery.of(context).size.width,
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 20,),
                  Text('Login' , style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.deepPurple),),
                  // SizedBox(height: MediaQuery.of(context).size.height*0.3,),
                  Lottie.asset('asset/bank.json', height: 300),
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter a valid account number!';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.number,
                    controller: accountNumberController,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(width: 2, color: Colors.deepPurple),
                          borderRadius: BorderRadius.circular(20)
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.deepOrange, width: 3.0),
                          borderRadius: BorderRadius.circular(20)
                      ),
                      hintText: 'Account Number',

                      // border: InputBorder.none,
                    ),
                  ),
                  SizedBox(height: 10,),
                  TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Enter a valid name!';
                        }
                        return null;
                      },
                    controller: passwordController,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(width: 2, color: Colors.deepPurple),
                          borderRadius: BorderRadius.circular(20)
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.deepOrange, width: 3.0),
                          borderRadius: BorderRadius.circular(20)
                      ),
                      hintText: 'Password',
                      labelStyle: TextStyle(color: Colors.green),
                      border: InputBorder.none,
                    ),
                  ),

                  SizedBox(height: 10,),
                  GestureDetector(
                    onTap: (){
                      if(_formKey.currentState!.validate()){
                        getData();
                      }
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width*0.9,
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
                  SizedBox(height: 10,),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("If don't have account?", style: TextStyle(fontSize: 15, color: Colors.deepPurple),),
                      GestureDetector(
                          onTap: (){
                            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>RegisterScreen()));
                          },
                          child: Text('   Register', style: TextStyle(color: Colors.deepPurple, fontWeight: FontWeight.bold),))
                    ],
                  )

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
  showError(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        behavior: SnackBarBehavior.floating,
        margin: EdgeInsets.all(10),
        backgroundColor: Colors.white,

        content: Text("Invalid username and password", style: TextStyle(color: Colors.red),)));
  }
}
