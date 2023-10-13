import 'package:dst_movie_hunt/screens/HomeScreen.dart';
import 'package:dst_movie_hunt/screens/favourites_screen.dart';
import 'package:dst_movie_hunt/screens/login_screen.dart';
import 'package:dst_movie_hunt/screens/registration_screen.dart';
import 'package:dst_movie_hunt/screens/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:dst_movie_hunt/screens/welcome_screen.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  // Ensure that Firebase is initialized
  WidgetsFlutterBinding.ensureInitialized();
  // Initialize Firebase
  await Firebase.initializeApp();
  //
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        initialRoute: 'welcome_screen',
        routes: {
          WelcomeScreen.id : (context) => WelcomeScreen(),
          LoginScreen.id : (context) => LoginScreen(),
          RegistrationScreen.id : (context) => RegistrationScreen(),
          HomeScreen.id : (context) => HomeScreen(),
          SearchScreen.id : (context) => SearchScreen(),
          FavouriteScreen.id : (context) => FavouriteScreen(),
        }
    );
  }
}
