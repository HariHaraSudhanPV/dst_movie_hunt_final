import 'package:flutter/material.dart';
import 'package:dst_movie_hunt/components/networking.dart';
import 'package:dst_movie_hunt/components/movie_card.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
class Cards extends StatelessWidget {
  const Cards({
    required this.isLoading,
    required this.results,
    required ScrollController scrollController,
    required this.displayedItemCount,
    required this.imageUrl,
    required this.isMoreLoading,

  }) : _scrollController = scrollController;

  final bool isLoading;
  final List results;
  final ScrollController _scrollController;
  final double displayedItemCount;
  final String imageUrl;
  final bool isMoreLoading;


  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: isLoading
            ? Center(child: CircularProgressIndicator())
            : results.isNotEmpty
            ? ListView.builder(
          controller: _scrollController,
          itemBuilder: (context, index) {
            if (index < displayedItemCount && index<results.length) {
              return Padding(
                padding:
                const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Column(
                  children: <Widget>[
                    MovieCard(
                      movieName: results[index]['original_title'],
                      rating: results[index]['vote_average'],
                      year: results[index]['release_date'],
                      imageUrl: results[index]['backdrop_path']!=null ? (imageUrl +  results[index]['backdrop_path']):"",
                      overView: results[index]['overview'],
                    ),
                  ],
                ),
              );
            } else if (isMoreLoading) {
              return Padding(
                padding:
                const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Center(child: CircularProgressIndicator()),
              );
            }
            else {
              return Container(); // Return an empty container or some other widget
            }

          },
          itemCount: displayedItemCount.toInt(),
        )
            : Center(
          child: Text('No data available'),
        ),
      ),
    );
  }
}