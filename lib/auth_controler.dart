import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_auth/HomePage.dart';
import 'package:login_auth/login_screen.dart';

class AuthController extends GetxController{
  static AuthController instance= Get.find();
  late Rx<User?> _user;
  FirebaseAuth auth=FirebaseAuth.instance;

  @override
  void onReady(){
    super.onReady();
    _user=Rx<User?>(auth.currentUser);
    _user.bindStream(auth.userChanges());
    // _user is bound to the userChanges stream of FirebaseAuth using the bindStream method.
    // This means that whenever there is a change in the user's authentication status,
    // _user will be updated with the new value.
    ever(_user,_initialScreen);
    //the ever method is called with _user and _initialScreen as parameters. The ever method is used to react to changes in _user.
    // Whenever _user changes, _initialScreen method is called with the updated value of _user.
  }

  _initialScreen(User? user){
   // print('$user gfjgh');
    if(user==null){
      print('login page');
      Get.offAll(()=>LoginScreen());
      //Get.offAll is a method from the GetX library that
      // is used to navigate to a new screen and remove all previously existing screens in the navigation stack.
    }
    else{
      Get.offAll(()=> HomePageScreen(email: user.email.toString() ));
    }
  }
  void register(String email,password) async {
    try {
      await auth.createUserWithEmailAndPassword(email: email, password: password);
    }
    catch (e) {
      Get.snackbar('About user', 'User Message',
          borderColor: Colors.blue,
          snackPosition: SnackPosition.BOTTOM,
          titleText: Text('Account creation faild',style: TextStyle(color: Colors.white),) ,
          messageText: Text(e.toString(),style: TextStyle(color:Colors.white ),)


      );

    }
  }
  void login(String email,password) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
    }
    catch (e) {
      Get.snackbar('About login', 'login Message',
          borderColor: Colors.blue,
          snackPosition: SnackPosition.BOTTOM,
          titleText: Text('login faild',style: TextStyle(color: Colors.white),) ,
          messageText: Text(e.toString(),style: TextStyle(color: Colors.white ),)


      );

    }
  }
  void LogOut() async{
    await auth.signOut();
  }
}