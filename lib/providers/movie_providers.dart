import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:peliculas/models/models.dart';
class MovieProvider extends ChangeNotifier{
  String _apikey='24d664041e21fe9191cb60b85b9cbc98';
  String _baseurl='api.themoviedb.org';
  String _language='es-ES';

  List<Movie> onDisplayMovies=[];
  List<Movie> onDisplayPopular=[];
  
  MovieProvider(){
    this.getOnDisplayMovies();
    this.getOnPopularMovies();
  }

  getOnDisplayMovies() async{
     var url=Uri.https(this._baseurl, '3/movie/now_playing',{
      'api_key':this._apikey,
      'language':this._language,
      'page':'1'
    });
    final response=await http.get(url);
    final respuesta=nowPlayingResponseFromJson(response.body);
    onDisplayMovies=respuesta.results;
    notifyListeners();


    
  }
  getOnPopularMovies() async{
    print('populares');
    var url=Uri.https(this._baseurl, '/3/movie/popular',{
      'api_key':this._apikey,
      'language':this._language,
      'page':'1'
    });

    final response=await http.get(url);
    final respuesta=popularResponseFromJson(response.body);
    //onDisplayPopular=respuesta.results;
    print(respuesta);
    onDisplayPopular=[ ...onDisplayPopular, ...respuesta.results];
    notifyListeners();
  }
}