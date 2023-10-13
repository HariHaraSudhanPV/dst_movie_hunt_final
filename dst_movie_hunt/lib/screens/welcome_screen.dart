import 'package:dst_movie_hunt/screens/login_screen.dart';
import 'package:dst_movie_hunt/screens/registration_screen.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:dst_movie_hunt/components/RoundedButton.dart';
class WelcomeScreen extends StatelessWidget {
  static const String id = 'welcome_screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      body: SafeArea(
        child: SingleChildScrollView( // Wrap with SingleChildScrollView
          child: Padding(
            padding: EdgeInsets.only(top:60.0,left: 40.0,bottom: 20.0,right: 40.0),
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Hero(tag:'movieLogo',child: Image.asset('images/movie_icon.png',width: 100.0,height: 100.0,)),
                    SizedBox(width: 20.0,),
                    Expanded(
                      child:AnimatedTextKit(
                        animatedTexts: [
                          ColorizeAnimatedText(
                            'DST Movie Hunt',
                            textStyle: TextStyle(fontSize: 50.0),
                            colors: [
                              Colors.white,
                              Colors.purple,
                              Colors.blue,
                              Colors.yellow,
                              Colors.red,
                            ],
                          ),
                        ],
                        isRepeatingAnimation: false,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 150.0,),
                RoundedButton(title: 'Register',onpressed: (){Navigator.pushNamed(context, RegistrationScreen.id);},),
                SizedBox(height: 30.0,),
                RoundedButton(title: 'Login',onpressed: (){Navigator.pushNamed(context, LoginScreen.id);},)
              ],
            ),
          ),
        ),
      ),
    );
  }
  }
