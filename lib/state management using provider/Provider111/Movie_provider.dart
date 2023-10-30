import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_classwork/state%20management%20using%20provider/Model/movies.dart';

final List<Movies> movieList = List.generate(100, (index) => Movies(
    title: 'Movie$index', time: '${Random().nextInt(100)+ 60} minutes'));

class MovieProvider extends ChangeNotifier{

  //list for main screen
  final List<Movies> _movie = movieList;
  List<Movies> get movies => _movie;//value from _movie is accessible through this get property

//list for wishlist
final List<Movies> _wishListMovies = [];
List<Movies> get moviesWishList => _wishListMovies;//value from _wishListMovie is accessible through this get property

void addtoWishList(Movies movieFromMainPage){
  _wishListMovies.add(movieFromMainPage);
  notifyListeners(); //to notify the provider that change is happened
}

  void removeFromWishList(Movies removedMovie){
    _wishListMovies.remove(removedMovie);
    notifyListeners(); //to notify the provider that change is happened
  }



}