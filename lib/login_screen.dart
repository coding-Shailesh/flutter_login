import 'dart:ui';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:login_auth/auth_controler.dart';
import 'package:login_auth/sign_upScreen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {

    var emailController=TextEditingController();
    var passwordController=TextEditingController();
    double w=MediaQuery.of(context).size.width;
    double h=MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(

          children: [
            Container(
                width: w,
                height: h*0.39,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('img/loginimg.png'),
                  fit: BoxFit.cover,
                ),

              )

              ,),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 15),
              width: w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Hello',style: TextStyle(fontSize: 70,fontWeight: FontWeight.bold),),
                  Text('Sign into your account',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.grey),),
                  SizedBox(height: 30),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow:[BoxShadow(
                          color: Colors.grey,
                         blurRadius: 15,

                      )] ,
                    ),
                    child: TextField(
                      controller: emailController,
                      decoration: InputDecoration(
                        hintText: 'Email',
                        prefixIcon: Icon(Icons.email_sharp,color: Colors.orangeAccent,),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.white
                      ) ,
                      borderRadius: BorderRadius.circular(20),
                    ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.white
                          ) ,
                          borderRadius: BorderRadius.circular(20),
                        ),

                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow:[BoxShadow(
                        color: Colors.grey,
                        blurRadius: 15,

                      )] ,
                    ),
                    child: TextField(
                      controller: passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: 'Password',
                        prefixIcon: Icon(Icons.password,color: Colors.orangeAccent,),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.white
                          ) ,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.white
                          ) ,
                          borderRadius: BorderRadius.circular(20),
                        ),

                      ),
                    ),
                  ),
                  SizedBox(height: 8),
                  Row(

                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text('Forgot Password?',style: TextStyle(fontSize: 13,fontWeight: FontWeight.bold,color: Colors.grey),),
                    ],
                  ),
                  SizedBox(height: 40),
                  GestureDetector(
                    onTap: (){
                      AuthController.instance.login(emailController.text.trim(), passwordController);
                    },
                    child: Center(
                      child: Container(
                          width: w*0.40,
                          height: h*0.06,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            image: DecorationImage(
                              image: AssetImage('img/loginbtn.png'),

                              fit: BoxFit.cover,
                            ),

                          ),
                        child:  Center(child: Text('Sign in',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black),)),


                          ),
                    ),
                  ),
                  SizedBox(height: w*0.16),
                  Center(
                    child: RichText(text: TextSpan(
                      text: 'Dont\'t have an account?',style: TextStyle(fontSize: 20,color: Colors.grey),
                      children: [
                        TextSpan(
                        text: 'Create',style: TextStyle(fontSize: 20,color: Colors.black),
                        recognizer: TapGestureRecognizer()..onTap=()=>Get.to(()=>SignUpScreen())
                        ),

                      ]
                    )),
                  )


                ],
              ),
            )
          ],
        ),

    );
  }
}
