import 'package:flutter/material.dart';
import 'package:login_signin/homescreen2.dart';
//import 'const.dart';
//import 'login_screen.dart';
import 'package:login_signin/login_screen.dart';
import 'package:http/http.dart' as http;

//import 'package:dio/dio.dart';


//import 'package: form_validation/login_screen.dart';

//const String baseUrl = "https://your-base-url.com";


void main(){
  runApp(InitialScreen());
  
}
const String baseUrl = "https://demo.trainingzone.in";


class InitialScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch:  Colors.indigo,
       ),
      home: Homescreen2(),
    title: "Oxy Food",
    
    debugShowCheckedModeBanner: false,
    );
    
    
  }
}