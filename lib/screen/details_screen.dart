import 'package:flutter/material.dart';
import 'package:peliculas/widgets/widgets.dart';

class DetailsScreen extends StatelessWidget {
   
  const DetailsScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    final String movie=ModalRoute.of(context)?.settings.arguments.toString() ?? 'no-movie';
     return  Scaffold(
      body: CustomScrollView(
        slivers: [
           
          _CustomAppBar(),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                _PosterAndTitle(),
                _Overview(),
                
                CastingCards()
              ]
            )
            )
        ],
      ),
     
    );
  }
}


class _CustomAppBar extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return   SliverAppBar(
      backgroundColor: Colors.indigo,
      expandedHeight: 200,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        titlePadding:const EdgeInsets.all(0),
        
        title:Container(
          width: double.infinity,
          alignment: Alignment.bottomCenter,
          color: Colors.black12,
          padding: EdgeInsets.only(bottom: 10),
          child:const Text(
          'movie.title',
          style: TextStyle(fontSize: 16),
        ),),
        background:const FadeInImage(placeholder:  NetworkImage('https://via.placeholder.com/300x400'), 
                      image: NetworkImage('https://via.placeholder.com/300x400'),
                      fit: BoxFit.cover),
      ),
    );
  }
}


class _PosterAndTitle extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme=Theme.of(context).textTheme;
    return Container(
      margin:const EdgeInsets.only(top: 20),
      padding:const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child:const FadeInImage(placeholder:  NetworkImage('https://via.placeholder.com/300x400'), 
                      image: NetworkImage('https://via.placeholder.com/300x400'),
                      height: 50,
            ),
        ),
        const SizedBox(width: 20,),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('movie.title',style:Theme.of(context).textTheme.headline5,overflow: TextOverflow.ellipsis,maxLines: 2,),
            Text('movie.originaltile',style:Theme.of(context).textTheme.subtitle1,overflow: TextOverflow.ellipsis,maxLines: 1,),
            Row(children: [
              const Icon(Icons.star_outline,size: 15,color: Colors.grey,),
              const SizedBox(width: 150 ),
              Text('moview.voteAverage',style:Theme.of(context).textTheme.caption),
              //_Overview(), 
            ],)
          ],
        )
      ]    
    ,),
      
    );
  }
}

class _Overview extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30,vertical: 10),
      child: Text('Sint mollit eiusmod enim est ipsum officia. Elit do aliquip irure minim velit irure non ad. Cupidatat incididunt fugiat velit commodo sint sunt nisi tempor elit do mollit do Lorem. In dolore magna excepteur ipsum velit deserunt proident. Laboris culpa consequat nulla esse ipsum labore proident officia exercitation. Veniam aliquip in excepteur culpa id consequat irure irure consectetur occaecat. Veniam aute et duis eu eiusmod enim ex labore dolor fugiat duis eiusmod labore.',textAlign: TextAlign.justify,style: Theme.of(context).textTheme.subtitle1,),
    );
  }
}
