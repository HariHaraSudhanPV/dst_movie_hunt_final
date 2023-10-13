import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';

import '../screens/search_screen.dart';
class MovieCard extends StatelessWidget {
  MovieCard({this.movieName="",this.rating=0.0,this.year="",this.imageUrl="",this.overView=""});
  String movieName = "";
  num rating = 0.0;
  String year = "";
  String imageUrl = "";
  String overView = "";
  var result = [];


  @override
  Widget build(BuildContext context) {
    return FlipCard(
      front: Card(
          elevation: 20.0,
          color: Color(0xff20232A),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Container(
            height: 350.0,
            child: Column(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(20.0)),
                  padding: EdgeInsets.only(top:3.0,right:5.0,left: 5.0),
                  width: 330.0,
                  child: ClipRRect(borderRadius:BorderRadius.circular(20.0),child: imageUrl.length>0 ? Image.network(imageUrl): SizedBox(height: 2.0,)),
                ),
                SizedBox(height: 7.0,),
                Text(overflow: TextOverflow.ellipsis,
                  maxLines: 1,movieName,style: TextStyle(fontSize:25.0,color:Colors.purpleAccent,fontFamily: 'AR_One_Sans'),),
                SizedBox(height: 7.0,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.star,color: Colors.purpleAccent,),
                    SizedBox(width: 5.0,),
                    Text(rating.toString(),style: TextStyle(fontSize: 20.0,color: Colors.white),),
                  ],
                ),
                SizedBox(height: 10.0,),
                Text(year,style: TextStyle(color: Colors.purpleAccent,fontSize:25.0),),
      ElevatedButton(
          onPressed: () {
            SearchScreen searchScreen = SearchScreen();
            searchScreen.addToFavourites(this);
          },
          child: Text('Add To Favourites')
      ),
              ],
            ),
          )
      ),
      back: Center(child:Text(overView,style:TextStyle(color: Colors.white))),
    );
  }
}
