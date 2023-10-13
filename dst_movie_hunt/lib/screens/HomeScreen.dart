import 'package:dst_movie_hunt/screens/favourites_screen.dart';
import 'package:dst_movie_hunt/screens/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:dst_movie_hunt/components/networking.dart';
import 'package:dst_movie_hunt/components/movie_card.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:dst_movie_hunt/components/cards.dart';

class HomeScreen extends StatefulWidget {
  static const String id = 'home_screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<MovieCard> favResults = [];
  void addToFavourites(MovieCard movieCard){
    setState(() {
      favResults.add(movieCard);
    });
  }

  String movieName = "";
  Image img = Image.network(
      'https://image.tmdb.org/t/p/original/h3uqFk7sZRJvLZDdLiFB9qwbL07.jpg');
  String rating = '9.8';
  String year = '2003';
  String API_KEY = '2645d3921a66007ef977e87579cf77f7';
  String imageUrl = 'https://image.tmdb.org/t/p/original';
  bool isLoading = true;
  bool isMoreLoading = false;
  var results = [];
  double displayedItemCount = 5;
  String dropDownValue = 'Top Rated';
  List<DropdownMenuItem<String>> dropDownItems = [
    DropdownMenuItem(value:'Top Rated',child: Text('Top Rated',style: TextStyle(color:Colors.white),)),
    DropdownMenuItem(value:'Popular',child: Text('Popularity',style: TextStyle(color:Colors.white))),
    DropdownMenuItem(value:'Now Playing',child: Text('Now Playing',style: TextStyle(color:Colors.white))),
  ];
  ScrollController _scrollController = ScrollController();

  void getTopRated20() async {

    String top20Url = dropDownValue == 'Top Rated' ?
        "https://api.themoviedb.org/3/movie/top_rated?api_key=$API_KEY" :
        dropDownValue == 'Popular'?
        "https://api.themoviedb.org/3/movie/popular?api_key=$API_KEY":
            "https://api.themoviedb.org/3/movie/now_playing?api_key=$API_KEY";
    NetworkHelper networkHelper = NetworkHelper(url: top20Url);
    var top20JsonData = await networkHelper.getData();
    setState(() {
      results = top20JsonData['results'];
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    getTopRated20();
    _scrollController.addListener(_scrollListener);
  }

  void _scrollListener() {
    if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
      loadMoreItems();
    }
  }

  void loadMoreItems() async {
    if (isMoreLoading) {
      return;
    }
    setState(() {
      isMoreLoading = true;
    });
    await Future.delayed(Duration(seconds: 2));
    setState(() {
      displayedItemCount += 5;
      isMoreLoading = false;
    });
  }
  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        resizeToAvoidBottomInset : false,
        backgroundColor: Color(0xff20232A),
        body: SafeArea(
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(
                  top: 20.0,
                  right: 20.0,
                  left: 20.0,
                  bottom: 20.0,
                ),
                child: Material(
                  color: Color(0xff20232A),
                  elevation: 7.0,
                  child: Container(
                    height: 60.0,
                    child: Row(
                      children: <Widget>[
                        Icon(Icons.movie, color: Colors.white, size: 40.0),
                        SizedBox(width: 70.0),
                        Text(
                          'Explore',
                          style: TextStyle(color: Colors.white, fontSize: 40.0),
                        ),
                        SizedBox(width: 50.0),
                        ElevatedButton(
                          child: Icon(
                            Icons.search,
                            color: Colors.white,
                            size: 40.0,
                          ),
                          onPressed: () {Navigator.pushNamed(context, SearchScreen.id);},
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              DropdownButton(
                focusColor: Colors.grey,
                dropdownColor: Colors.black,
                icon: Icon(Icons.keyboard_arrow_down),
                value: dropDownValue,
                  items: dropDownItems,
                onChanged: (String? newValue) {
                  setState(() {
                    dropDownValue = newValue!;
                    getTopRated20();
                  });
                },
              ),
              Cards(isLoading: isLoading, results: results, scrollController: _scrollController, displayedItemCount: displayedItemCount, imageUrl: imageUrl, isMoreLoading: isMoreLoading),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}