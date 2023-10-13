import 'package:flutter/material.dart';
import 'package:dst_movie_hunt/screens/search_screen.dart';
class FavouriteScreen extends StatelessWidget {
  static const String id = 'favourite_screen';
  @override
  Widget build(BuildContext context) {
    SearchScreen searchScreen = SearchScreen();
    var cardList = searchScreen.favResults;
    return Scaffold(
      backgroundColor: Color(0xff20232A),
      appBar: AppBar(
        elevation: 20.0,
        title: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Row(
            children: <Widget>[
              Icon(Icons.star,color: Colors.white,),
              SizedBox(width:5.0),
              Text('Favourites',style:TextStyle(color:Colors.white,)),
            ],
          ),
        ),
        backgroundColor: Color(0xff20232A),
      ),
      body: SafeArea(
        child:Container(),
      ));

  }
}
