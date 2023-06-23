import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_signin/api/api_client.dart';
import 'package:login_signin/homescreen.dart';
import 'package:login_signin/login_screen.dart';


class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});


  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
final _formKey = GlobalKey<FormState>();
  bool passToggle = true;
  String email = '';
  String password = '';
  final emailController = TextEditingController();
    final passController = TextEditingController();
        final nameController = TextEditingController();
        final ApiClient _apiClient = ApiClient();
  bool _showPassword = false;


  Future<void> registerUsers() async {
    if (_formKey.currentState!.validate()) {
          final BuildContext context = this.context; 

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: const Text('Processing Data'),
        backgroundColor: Colors.green.shade300,
      ));

      Map<String, dynamic> userData = {
        "email" : emailController.text,
        "password" : passController.text,
       'name' : nameController


      };
      dynamic res = await _apiClient.registerUser(userData);

      ScaffoldMessenger.of(context).hideCurrentSnackBar();

      if (res['ErrorCode'] == null) {
        
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const Loginscreen()));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Error: ${res['Message']}'),
          backgroundColor: Colors.red.shade300,
        ));
      }
    }
  }
    

  @override
  Widget build(BuildContext context) {
     return Scaffold(
      appBar: AppBar(
        title: Text("Oops!! You Are Missing"),
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
"images/avatar3.png",
height: 200,
width: 200,
  ),

  SizedBox(height:35),

  TextFormField(
 keyboardType: TextInputType.emailAddress,
 controller: nameController,
                          decoration: InputDecoration(
                           // focusedBorder: UnderlineInputBorder
                  labelText: 'Full Name',
                  //iconColor: Colors.green,
                  border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                  ),
                  prefixIcon:Icon(Icons.abc),
                    ),

   validator: (value){
   if  (value!.isEmpty) {
                     return "Please enter your name";
                   }
                   return null;
   }
  ),
                     SizedBox(height:20),

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

   validator: (Value){
   if  (Value!.isEmpty) {
                     return "Please enter your email";
                   }
                   bool emailValid = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(Value) ;
                   
                   if(!emailValid){
            return "Please enter a valid email address";

                    
                   }
                    
                   return null;
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
 validator: (Value){
                            
                     if (Value!.isEmpty) {
                 
                       return 'Please enter your password';
                     }
                     if (Value.length  <8) {
                       return 'Password must be at least 8 characters long';
                     }
                         return null;
                          },


                    ),
      

      SizedBox(height: 60),
      InkWell(
        onTap: (){
if(_formKey.currentState!.validate()){

  print("Data added Successfully");
  
   Navigator.push(
         context,
          MaterialPageRoute(
           builder: (context) => Homescreen(),
          ));
        
        FocusScope.of(context).unfocus();
      } else {
        print("Invalid login details");
      }
  
  
  
        },
        child: Container(
          height: 50,
          decoration: BoxDecoration(
                      color: Color.fromARGB(255, 46, 200, 51),
                      borderRadius: BorderRadius.circular(25),


          ),
          child: Center(
            child : Text(
        'SIGN UP',
        style: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
            )),
          
          

      
        ),
      ),

  ],
  )

)

)),


     );

  }
}
