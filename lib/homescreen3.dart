// import 'package:flutter/material.dart';
// import 'package:login_signin/login_screen.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

// class Homescreen3 extends StatefulWidget {

//   @override
//   State<Homescreen3> createState() =>_Homescreen3State();
// }


// Map<String, dynamic> mapResponse = {};

// class _Homescreen3State extends State<Homescreen3> {
//  String _data = '';
//  final email = 'ajay121@gamil.com';
// final password = 'test@123';
// //Future<Map<String, dynamic>> authenticateUser(String email, String password) async {

//   Future<String> fetchData( String email, String password) async {
//   // try{
//     final response = await http.post(Uri.parse('https://demo.trainingzone.in/api/login'));
//     body: jsonEncode(<String, String>{
//       'email': email,
//       'password': password,
//     })
//     final jsonData = json.decode(response.body);
//     if (jsonData != null) {
//       setState(() {
//         _data = jsonData[response.body];
//       });
//       //print(response.body);
//       return _data;
//     } else {
//       setState(() {
//         _data = 'Error: JSON data is null';
//       });
//     }
//   //   setState(() {
//   //     _data = jsonData[{'email': email, 'password': password}];
//   //   });
//   //   print(response.body);
//   //  //}catch(er){}
//   }
//   @override
//   void initState() {
//    fetchData( email, password);
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
    
//     return MaterialApp(
//           debugShowCheckedModeBanner: false,

//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('API Integration'),
//         ),
//         body: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               ElevatedButton(
//                  // onPressed: fetchData(),

//   onPressed: () => fetchData(email, password),
//                 child: Text('Fetch Data'),
//               ),
//               SizedBox(height: 20),
//               Text(_data),
              
//             ],
//           ),

//         ),
//       ),
//     );











//   }}