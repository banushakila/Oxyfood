import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_signin/api/api_client.dart';
import 'package:login_signin/login_screen.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
class Homescreen extends StatefulWidget {


  
  
  // final String accessToken = "";
  


  @override
  State<Homescreen> createState() => _HomescreenState();
  
}

class _HomescreenState extends State<Homescreen> {
  

//   final ApiClient _apiClient = ApiClient();

//   Future<Map<String, dynamic>> getUserData() async {
//     dynamic userRes;
//     userRes = await _apiClient.getUserProfileData(widget.accessToken);
//     return userRes;
//   }

//   Future<void> logout() async {
//   final BuildContext context = this.context; // Store the BuildContext

//   await _apiClient.logout(widget.accessToken);
//   Navigator.pushReplacement(
//     context,
//     MaterialPageRoute(builder: (context) => const Loginscreen()),
//   );
// }
  
  @override
  
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
  children: [
    Image.asset(
      "images/home.png",
      height: height * 0.95,
      width: width,
      fit: BoxFit.cover,
    ),
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Welcome To",
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          textAlign: TextAlign.start,
        ),
        SizedBox(height: 20,),
        Text(
          "OXY FOOD",
          style: TextStyle(
            fontSize: 45,
            fontWeight: FontWeight.bold,
            color:  const Color.fromARGB(255, 247, 96, 96),
          ),
          textAlign: TextAlign.start,
        ),
        Text(
          "A FOOD DELIVERY APP",
          style: TextStyle(
            fontSize: 35,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          textAlign: TextAlign.start,
        ),
      ],
    ),
  ],
),
    );
  }
}


