import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:login_auth/auth_controler.dart';
import 'package:login_auth/login_screen.dart';
class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
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
          Stack(
            children: [Container(
              width: w,
              height: h*0.39,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('img/signup.png'),
                  fit: BoxFit.cover,
                ),

              )

              ,),
            Positioned(
              left: w*0.34,
              top: h*0.25,
              child: CircleAvatar(
                backgroundImage: AssetImage('img/profile1.png'),
                radius: 55,

              ),
            ),
          ]
          ),


          Container(
            margin: const EdgeInsets.symmetric(horizontal: 15),
            width: w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
                      hintText: ' Create Password',
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
                SizedBox(height: 40),
                Center(
                  child: GestureDetector(
                    onTap: (){
                      AuthController.instance.register(emailController.text.trim(), passwordController.text.trim() );
                    },
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
                      child:  Center(child: Text('Sign Up',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black),)),


                    ),
                  ),
                ),
                SizedBox(height: 10),
                Center(child:InkWell(
                  onTap: (){
                    Get.to(()=>LoginScreen());
                  },
                    child: Text('Have an account',style: TextStyle(fontSize: 20,color: Colors.grey),)),
                ),
                SizedBox(height: w*0.1),
                Center(child:Text('Sign up using following method',style: TextStyle(fontSize: 20,color: Colors.grey),),),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    CircleAvatar(
                      radius: 23,
                      child: CircleAvatar(
                        backgroundImage: AssetImage('img/g.png'),

                      ),
                    ),
                    CircleAvatar(
                      radius: 23,
                      child: CircleAvatar(
                        backgroundImage: AssetImage('img/t.png'),
                      ),
                    ),
                    CircleAvatar(
                      radius: 23,
                      child: CircleAvatar(
                        backgroundImage: AssetImage('img/f.png'),
                      ),
                    ),
                  ],
                )


              ],
            ),
          )
        ],
      ),

    );
  }
}
