import 'package:flutter/material.dart';
import 'package:login_signin/login_screen.dart';
class Homescreen2 extends StatefulWidget {

  @override
  State<Homescreen2> createState() => _Homescreen2State();
}

class _Homescreen2State extends State<Homescreen2> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      
      body: Stack(
  children: [
    Image.asset(
      "images/home4.png",
      height: height * 0.95,
      width: width,
      fit: BoxFit.cover,
    ),
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "Oxy Food",
          style: TextStyle(
            fontSize: 50,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          textAlign: TextAlign.center,
        ),

       TextButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Loginscreen()),
        );
        FocusScope.of(context).unfocus();
      },
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(builder: (context) => Homescreen()),
       
        child: Text("Login",
        style : TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
          color: Colors.red,
        ),
                  textAlign: TextAlign.center,
),

)
      ]
    )
  ]
      ));
  }}