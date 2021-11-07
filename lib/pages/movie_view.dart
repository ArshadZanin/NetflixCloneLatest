import 'package:flutter/material.dart';
import 'package:netflix_clone_latest/models/content_info.dart';
import 'package:netflix_clone_latest/pages/row_movie.dart';


class MovieView extends StatefulWidget {
  final Result article;
  const MovieView({required this.article, Key? key}) : super(key: key);

  @override
  _MovieViewState createState() => _MovieViewState();
}

class _MovieViewState extends State<MovieView> {

  @Deprecated('message')
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(

      onRefresh: _refreshLocalGallery,
      child: Scaffold(
        backgroundColor: const Color(0xff181818),
        appBar: AppBar(
          backgroundColor: const Color(0xff181818),
          elevation: 0,
          actions: [
            IconButton(onPressed: (){}, icon: const Icon(Icons.cast,color: Colors.grey,)),
            IconButton(onPressed: (){}, icon: const Icon(Icons.search,color: Colors.white,)),
          ],
        ),
        body: ListView(
          children: [
            Card(
              clipBehavior: Clip.antiAlias,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)
              ),
              child: AspectRatio(
                aspectRatio: 2,
                child: Image.network(
                  'http://image.tmdb.org/t/p/original${widget.article.backdropPath}',
                  // /lNyLSOKMMeUPr1RsL4KcRuIXwHt.jpg
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("${widget.article.title ?? widget.article.name}",style: const TextStyle(color: Colors.white,fontSize: 20),),
                  // const Text("Only CAM version available.",style: TextStyle(color: Colors.white,fontSize: 15),),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("Science Fiction, Action",style: TextStyle(color: Colors.white60,fontSize: 15),),
                            Row(
                              children: [
                                Text((widget.article.firstAirDate ?? widget.article.releaseDate).toString().substring(0, 4),style: const TextStyle(color: Colors.white60,fontSize: 15),),
                                const SizedBox(width: 10,),
                                Text(widget.article.voteAverage.toString(),style: const TextStyle(color: Colors.white60,fontSize: 15),),
                                const SizedBox(width: 10,),
                                const Text("97 mins",style: TextStyle(color: Colors.white60,fontSize: 15),),
                              ],
                            ),
                          ],
                        ),
                      ),

                      FlatButton(onPressed: (){
                        // Navigator.push(context, MaterialPageRoute(builder: (_)=> const RowMovie()));
                      }, child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5)
                        ),
                        child: Row(
                          children: const [
                            Icon(Icons.play_arrow,color: Colors.black,),
                            Text("Watch now",style: TextStyle(color: Colors.black,fontSize: 18),),
                          ],
                        ),
                      )),

                    ],
                  ),

                  const SizedBox(height: 20,),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      FlatButton(onPressed: (){}, child: Row(
                        children: const [
                          Icon(Icons.live_tv,color: Colors.white,size: 20,),
                          Text(" Trailer",style: TextStyle(color: Colors.white),),
                        ],
                      )),
                      FlatButton(onPressed: (){}, child: Row(
                        children: const [
                          Icon(Icons.book,color: Colors.white,size: 20,),
                          Text(" Watchlist",style: TextStyle(color: Colors.white),),
                        ],
                      )),
                      FlatButton(onPressed: (){}, child: Row(
                        children: const [
                          Icon(Icons.assistant_rounded,color: Colors.white,size: 20,),
                          Text(" Collection",style: TextStyle(color: Colors.white),),
                        ],
                      )),
                    ],
                  ),

                  Text(widget.article.overview.toString(),
                    style: const TextStyle(color: Colors.white60,fontSize: 15,letterSpacing: 1),
                  ),

                  const SizedBox(height: 10,),
                  const Text("Similar movies",style: TextStyle(color: Colors.white,fontSize: 18),),

                  const RowMovie(),

                  const SizedBox(height: 10,),
                  const Text("Related movies",style: TextStyle(color: Colors.white,fontSize: 18),),
                  const RowMovie(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
  Future<void> _refreshLocalGallery() async{
    debugPrint('refreshing stocks...');
    setState(() {});
  }
}
