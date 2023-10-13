import 'package:dst_movie_hunt/components/movie_card.dart';
import 'package:dst_movie_hunt/screens/favourites_screen.dart';
import 'package:flutter/material.dart';
import 'package:dst_movie_hunt/components/networking.dart';
import 'package:dst_movie_hunt/components/cards.dart';
class SearchScreen extends StatefulWidget {
  static const String id = 'search_screen';
  List<MovieCard> favResults = [];
  void addToFavourites(MovieCard movieCard){
    favResults.add(movieCard);
    print(favResults.length);
  }

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  bool isLoading = false;
  ScrollController _scrollController = ScrollController();
  double displayedItemCount = 5;
  String imageUrl = 'https://image.tmdb.org/t/p/original';
  bool isMoreLoading = false;
  String movieName = "avengers";
  String movieNameUrl = "https://api.themoviedb.org/3/search/movie?api_key=2645d3921a66007ef977e87579cf77f7&query=";
  var results = [];
  void getMovieUrl() async{
    NetworkHelper networkHelper = NetworkHelper(url:movieNameUrl+movieName);
    var top20JsonData = await networkHelper.getData();
    setState(() {
      results = top20JsonData['results'];
    });
  }
  void initState() {
    getMovieUrl();
  }
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Container(
            color: Colors.black,
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top:15.0,right: 8.0,left: 8.0,bottom: 8.0),
                      child: Text('Search',style: TextStyle(color: Colors.white,fontSize: 30.0),),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top:15.0,right: 8.0,left: 8.0,bottom: 8.0),
                      child: Icon(Icons.search,color: Colors.white,),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(top: 15.0,left: 8.0,right: 8.0,bottom: 8.0),
                  child: TextField(
                    onChanged: (value){
                      setState(() {
                        movieName = value;
                      });
                      getMovieUrl();
                    },
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white), // Set text color to white
                    decoration: InputDecoration(
                      hintText: 'Search', // Add a hint text
                      hintStyle: TextStyle(color: Colors.grey), // Set hint text color
                      fillColor: Colors.grey, // Background color
                      filled: true,
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                ),
                ElevatedButton(onPressed: (){Navigator.pushNamed(context, FavouriteScreen.id);}, child: Text('Favourite list')),
                results.length>0?
                Cards(isLoading:isLoading,results: results,scrollController: _scrollController,displayedItemCount: displayedItemCount,imageUrl: imageUrl,isMoreLoading: isMoreLoading):
                Padding(
                  padding: const EdgeInsets.all(28.0),
                  child: Center(child: Container(height:171.0,width: 171.0,child: ClipRRect(borderRadius: BorderRadius.circular(220.0),child: Image.asset('images/actionImage.jpg'))),),
                )
              ],
            ),
          ),
        )
    );
  }
}