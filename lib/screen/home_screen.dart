import 'package:flutter/material.dart';
import 'package:peliculas/providers/movie_providers.dart';
import 'package:peliculas/widgets/card_swiper.dart';
import 'package:peliculas/widgets/widgets.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
   
  const HomeScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    final moviesProvider=Provider.of<MovieProvider>(context);

    return  Scaffold(
      appBar: AppBar(
        title:const Text('WALMER'),
        
        elevation: 0,
        actions: [
          IconButton(onPressed: ()=>{}, icon:const Icon(Icons.home_filled))
        ],
      ),
      body: SingleChildScrollView(child: Column(children:[
        //listado horizonatal de peliculas
        CardSwiper(movies: moviesProvider.onDisplayMovies),
        MovieSlider(populares :moviesProvider.onDisplayPopular,title:'Populares'),
           
      ],),)
    );
  }
}