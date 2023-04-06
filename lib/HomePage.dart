import 'package:flutter/material.dart';
import 'package:login_auth/auth_controler.dart';
class HomePageScreen extends StatelessWidget {
  String email;
   HomePageScreen({Key? key, required this.email}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double w=MediaQuery.of(context).size.width;
    double h=MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
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
          SizedBox(height: h*0.03),

          Container(
            margin: const EdgeInsets.symmetric(horizontal: 15),
            width: w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Welcome',style: TextStyle(fontSize: 50,color: Colors.blue,fontWeight: FontWeight.bold),),
                    Text(email,style: TextStyle(fontSize: 20,color: Colors.blue,fontWeight: FontWeight.bold),),
                  ],
                ),
                SizedBox(height: h*0.25),
                GestureDetector(
                  onTap: (){
                    AuthController.instance.LogOut();
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
                      child:  Center(child: Text('Sign Out',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black),)),


                    ),
                  ),
                ),



              ],
            ),
          )
        ],
      ),

    );
  }
}
