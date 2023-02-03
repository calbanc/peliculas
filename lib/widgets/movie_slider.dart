

import 'package:flutter/material.dart';
import 'package:peliculas/models/models.dart';



class MovieSlider extends StatelessWidget{
  final List<Movie>populares;
  final String? title;
  const MovieSlider({Key? key, required this.populares, this.title, }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Container(
      width: double.infinity,
      height: 300,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:  [
        if(this.title!=null)
           Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child:Text(this.title!,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold))
        ),
          const SizedBox(height: 5),
        Expanded(
          child: ListView.builder(
          itemCount: populares.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (_,int index){
            return  MoviePoster(movie: populares[index],);
          }
        ),)
        ])
        
    );
  }

}

class MoviePoster extends StatelessWidget {
  final Movie movie;
  const MoviePoster({ Key? key,required this.movie,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
              width: 130,
              height: 190,
              
              margin:const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
              child: Column(
                children:  [
                  GestureDetector(
                    onTap: ()=>Navigator.pushNamed(context, 'details',arguments: 'movie-instance'),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: FadeInImage(
                            placeholder:  NetworkImage(movie.fullPosterImg),
                      image: NetworkImage(movie.fullPosterImg),
                      fit:BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(height: 5,),
                  Text(movie.originalTitle,maxLines: 2,overflow: TextOverflow.ellipsis,textAlign: TextAlign.center,),
                
                ],),
            );
          }
  
}