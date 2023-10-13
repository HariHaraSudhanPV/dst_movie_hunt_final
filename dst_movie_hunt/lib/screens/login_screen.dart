import 'package:dst_movie_hunt/screens/HomeScreen.dart';
import 'package:dst_movie_hunt/screens/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:dst_movie_hunt/components/RoundedButton.dart';
import 'package:firebase_auth/firebase_auth.dart';
class LoginScreen extends StatelessWidget {
  static const String id = 'login_screen';
  String email = "";
  String password = "";
  FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      body: SingleChildScrollView( // Wrap with SingleChildScrollView
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Hero(tag:'movieLogo',child: Image.asset('images/movie_icon.png',width: 150.0,height: 150.0,)),
              SizedBox(height: 40.0,),
              Container(
                  decoration: BoxDecoration(color: Color(0xffFFFDD0),borderRadius: BorderRadius.circular(20.0)),
                  width: 290.0,
                  child: TextField(style:TextStyle(color:Colors.blue[900]),textAlign: TextAlign.center,
                    decoration: InputDecoration(hintText: 'Email'),
                    onChanged: (value){
                    email = value;
                    },
                  )
              ),
              SizedBox(height: 40.0,),
              Container(
                  decoration: BoxDecoration(color: Color(0xffFFFDD0),borderRadius: BorderRadius.circular(20.0)),
                  width: 290.0,
                  child: TextField(style:TextStyle(color:Colors.blue[900]),textAlign: TextAlign.center,
                    decoration: InputDecoration(hintText: 'Password'),
                    obscureText: true,
                    onChanged: (value){
                      password = value;
                    },
                  )
              ),
              SizedBox(height: 30.0,),
              RoundedButton(title:'Login',
                  onpressed: (){
                    try{
                      var currentUser = _auth.signInWithEmailAndPassword(email: email, password: password);
                      Navigator.pushNamed(context, HomeScreen.id);
                    }
                    catch(e){
                      print(e);
                    }
                  }
              )
            ],
          ),
        ),
      ),
    );
  }
}
