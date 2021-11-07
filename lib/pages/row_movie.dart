import 'package:flutter/material.dart';
import 'package:netflix_clone_latest/models/content_info.dart';
import 'package:netflix_clone_latest/services/api_manager.dart';

import 'movie_view.dart';

class RowMovie extends StatefulWidget {
  const RowMovie({Key? key}) : super(key: key);

  @override
  _RowMovieState createState() => _RowMovieState();
}

class _RowMovieState extends State<RowMovie> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10)
      ),
      height: 200,
      width: MediaQuery.of(context).size.width,
      child: FutureBuilder(
        future: ApiManager().getMovies(),
        builder: (BuildContext context, AsyncSnapshot<Welcome?> snapshot) {
          if(snapshot.hasData){
            return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: snapshot.data!.results!.length,
              itemBuilder: (context, index){
                var article = snapshot.data!.results![index];
                String? name;
                String? year;
                if(article.releaseDate == null){
                  year = article.firstAirDate.toString().substring(0, 4);
                }else{
                  year = article.releaseDate.toString().substring(0, 4);
                }
                if(article.title == null){
                  name = article.name;
                }else{
                  name = article.title;
                }
                if(name!.length > 19){
                  name = name.substring(0, 18);
                  name = name + "..";
                }
                return SizedBox(
                  width: 130,
                  height: 200,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (_) => MovieView(article: article,)));
                        },
                        child: Card(
                          clipBehavior: Clip.antiAlias,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5)
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10)
                            ),
                            height: 150,
                            // width: 150,
                            child: Image.network(
                              'http://image.tmdb.org/t/p/original${article.backdropPath}',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      Row(
                        children:  [
                          Expanded(child: Text(name,style: const TextStyle(color: Colors.white,fontSize: 15),)),
                        ],
                      ),
                      Expanded(child: Text(year,style: const TextStyle(color: Colors.white,fontSize: 13),)),
                      // Image.network(article.urlToImage!)
                    ],
                  ),
                );
              },
            );
          }else{
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
