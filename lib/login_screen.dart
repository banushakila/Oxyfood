// ignore_for_file: camel_case_types, duplicate_import
//import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
//import 'package:login_signin/homescreen.dart';
//import 'package:login_signin/homescreen2.dart';
//import 'package:login_signin/homescreen3.dart';
import 'package:login_signin/signup_screen.dart';
//import 'package:flutter_cors/flutter_cors.dart';
import 'dart:async';
import 'package:async_button/async_button.dart';
import 'package:flutter_appauth/flutter_appauth.dart';




import 'package:http/http.dart' as http;

import 'package:login_signin/utils/api_endpoints.dart';
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'utils/api_endpoints.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';





  





class Loginscreen extends StatefulWidget {
  const Loginscreen({super.key});
  

  @override
  State<Loginscreen> createState() => _LoginscreenState();
}  

    class _LoginscreenState extends State<Loginscreen>{

// final ApiClient _apiClient = ApiClient();
//final storage = new FlutterSecureStorage();

  
final _formKey = GlobalKey<FormState>();
  bool passToggle = true;
  late SharedPreferences prefs;
  final emailController = TextEditingController();
    final passController = TextEditingController();

    String email = '';
  String password = '';
  final token = '35|6rgCG3BygX8TH9OOpIk3xSItTeLWl5tfm3BbyUPH';


Future<dynamic> loginUsers() async {
  try{

    // if (_formKey.currentState!.validate()) 
    
    var headers = {
  'Content-Type': 'application/json',
  'Accept': 'application/json',
  'Authorization': 'Bearer $token'
};
var request = http.Request('POST', Uri.parse('https://demo.trainingzone.in/api/login'));
request.body = json.encode({
  "email": "ajay121@mail.com",
  "password": "Test@123"
  
});
request.headers.addAll(headers);

http.StreamedResponse response = await request.send();

if (response.statusCode == 200) {
  print(await response.stream.bytesToString());
  Navigator.pushAndRemoveUntil(
  context,
  MaterialPageRoute(builder: (context,) => WebViewPage(url: 'https://demo.trainingzone.in/api/user/me')),
  (Route<dynamic> route) => false,
);
}
else {
  print(response.reasonPhrase);
}
  
 }catch (e) {
   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
     content: Text('Error: $e'),
     backgroundColor: Colors.red.shade300,     ));   
     }
}


@override

 Widget build(BuildContext context) {
   
     return Scaffold(
      appBar: AppBar(
        title: Text("OXY FOOD"),
        centerTitle: true,
      ),
body: SingleChildScrollView(
  child: Padding(
padding: EdgeInsets.symmetric(horizontal: 20, vertical: 60),
     child : Form(
      key: _formKey,
  child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,

    children: [
  Image.asset(
"images/avatar.png",
height: 200,
width: 200,
  ),

  SizedBox(height: 50,),
  TextFormField(
 keyboardType: TextInputType.emailAddress,
 controller: emailController,
                          decoration: InputDecoration(
                           // focusedBorder: UnderlineInputBorder
                  labelText: 'EMAILADDRESS',
                  border: OutlineInputBorder(
                   // color: Colors.black
                  ),
                  prefixIcon:Icon(Icons.email),
                    ),

   validator: (email){
   if  (email!.isEmpty) {
                     return "Please enter your email";
                   }
                   bool emailValid = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email) ;
                   
                   if(!emailValid){
            return "Please enter a valid email address";

                    
                   }
                    
                   return null;
                          },
                          onSaved: (value) {
                  email = value!;
                },



                    ),
                   
                   SizedBox(height:20),
                    TextFormField(
 keyboardType: TextInputType.emailAddress,
 controller: passController,
 obscureText: passToggle,
                          decoration: InputDecoration(
                           // focusedBorder: UnderlineInputBorder
                  labelText: 'PASSWORD',
                  border: OutlineInputBorder(),
                  prefixIcon:Icon(Icons.lock),

                  suffix: InkWell(
                    onTap: () {
                      setState(() {
                        passToggle = !passToggle;


                      });
                    },
        child: Icon( passToggle ? Icons.visibility : Icons.visibility_off)

                      
                    
                  )
                    ),
 validator: (password){
                            
                     if (password!.isEmpty) {
                 
                       return 'Please enter your password';
                     }
                     if (password.length  <8) {
                       return 'Password must be at least 8 characters long';
                     }
                         return null;
                          },
                          onSaved: (value) {
                  password = value!;
                },


                    ),
      

      SizedBox(height: 60),
      
      
      AsyncElevatedBtn(
   onPressed:
   () async {
   if( _formKey.currentState!.validate()){
    loginUsers();

   } else {
  print("invalid login");
    }
   },
            
        child: Container(
          height: 50,
          decoration: BoxDecoration(
                      color: Color.fromARGB(255, 39, 187, 43),
                      borderRadius: BorderRadius.circular(25),


          ),
          child: Center(
            child : Text(
        'Login To Account',
        style: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
            )),
        )
       ),
       
        

 
Row( mainAxisAlignment: MainAxisAlignment.center,
children: [
  //mapResponse== null?
  Text( "Don't have an Account?",
  
  style : TextStyle(
    fontSize: 17,
  ),),

  TextButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SignupScreen()),
        );
        FocusScope.of(context).unfocus();
      },
       
       
        child: Text("Sign Up",
        style : TextStyle(
          fontSize: 19,
          fontWeight: FontWeight.bold,
        )),

)],


),
  ],
  )

)

)),

 

     );
     

 }
 
      } 
      
  
class WebViewPage extends StatelessWidget {
  final String url;

  const WebViewPage({Key? key, required this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Web View Page'),
      ),
      body: InAppWebView(
                initialFile: 'assets/login.php',


        initialUrlRequest: URLRequest(url: Uri.parse('https://demo.trainingzone.in' + url)),
      ),
    );
  }
}
