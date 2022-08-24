
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_client_1/Router.dart';
import 'package:flutter_client_1/User/userview.dart';
import 'package:string_validator/string_validator.dart';

import '../Helper/FireStoreHelper.dart';
import '../Helper/auth.dart';
import '../models/User.dart';



class AuthProvider extends ChangeNotifier{
  GlobalKey<FormState>login=GlobalKey();
   GlobalKey<FormState>signupkey=GlobalKey();
  TextEditingController emailcontroller=TextEditingController();
   TextEditingController passwordcontroller=TextEditingController();
   TextEditingController usernamecont=TextEditingController();
   TextEditingController phonecont=TextEditingController();
 nullcheck(String?v){
    if(v==null||v.isEmpty){
      return "This field required";
    }

   }
   Emailvalditon(String value){
    if(!isEmail(value)){
      return "Invalid Email syntax";
    }

   }Passwordvalditon(String value){
    if(value.length<6){
      return "Your password must be larger than that";
    }
   }
  //  signin ()async{
   
  //   if(login.currentState!.validate()){
  //   UserCredential?credentials= await AuthHelper.authHelper.
  //   signin(emailcontroller.text, passwordcontroller.text);
  //   if (emailcontroller.text == 're487840@gmail.com') {
  //     AppRouter.NavigateToWidget(FirstScrssn());
  //   } else {
  //     AppRouter.NavigateToWidget( UserView());
  //   }


  //   }

    
    

  //  }
   signin() async {
    UserCredential? credential = await AuthHelper.authHelper
        .signin(emailcontroller.text, passwordcontroller.text);

    if (emailcontroller.text == 're487840@gmail.com') {
      AppRouter.NavigateToWidget(UserView());
    } else {
      AppRouter.NavigateToWidget( UserView());
    }
    if (credential != null&&emailcontroller.text == 're487840@gmail.com') {
      AppRouter.NavigateWithReplacemtnToWidget(UserView());
    }
    else{
      
    }
  }
   singUp()async{
   if(signupkey.currentState!.validate()){
      UserCredential?credentials =await AuthHelper.authHelper.signup(emailcontroller.text, passwordcontroller.text);
      user appuser=user(name: usernamecont.text,
       email: emailcontroller.text, 
       password: passwordcontroller.text,
        phone: phonecont.text,
        id: credentials!.user!.uid
        );
        FirestoreHelper.firestoreHelper.addUserToFireStore(appuser);
      if(credentials!=null){
  AppRouter.NavigateWithReplacemtnToWidget(UserView());
}

    }
   }
   checkuser(){
    AuthHelper.authHelper.checkUser();
   }
   signOut(){
    AuthHelper.authHelper.signout();
   }
forgetPassword(){
  AuthHelper.authHelper.forgetPassword("re487840@gmail.com");
}

  
rigester(){}
}