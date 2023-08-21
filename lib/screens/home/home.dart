import 'package:bank_application/screens/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}



class _HomeState extends State<Home> {

  @override
  void initState() {
     getName();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: ()async{
              final SharedPreferences sp =
                  await SharedPreferences.getInstance();
              sp.setBool('newLoginStatus', false);
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => LoginScreen()));
          },icon: Icon(Icons.logout_rounded),)
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Text('home page')),

        ],
      ),
    );
  }
Future<void> getName()async{
  final SharedPreferences sp =
      await SharedPreferences.getInstance();
  String name= sp.getString('name')!;
  setState(() {
    String fullName=name;
    print(fullName);
  });

}
}
