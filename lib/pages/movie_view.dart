import 'package:flutter/material.dart';
import 'package:netflix_clone_latest/controller/widget_controller.dart';
import 'package:netflix_clone_latest/models/content_info.dart';
import 'package:netflix_clone_latest/pages/row_movie.dart';
import 'package:get/get.dart';

class MovieView extends StatefulWidget {
  final Result article;
  const MovieView({required this.article, Key? key}) : super(key: key);

  @override
  _MovieViewState createState() => _MovieViewState();
}

class _MovieViewState extends State<MovieView> {

  var widgetController = Get.put(WidgetController());

  @Deprecated('message')
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: _refreshLocalGallery,
      child: Scaffold(
        backgroundColor: Colors.grey[900],
        appBar: AppBar(
          backgroundColor: Colors.grey[900],
          elevation: 0,
          actions: [
            widgetController.greyButton(Icons.cast, () {}),
            widgetController.greyButton(Icons.search, () {}),
          ],
        ),
        body: ListView(
          children: [
            Card(
              clipBehavior: Clip.antiAlias,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)),
              child: AspectRatio(
                aspectRatio: 2,
                child: Image.network(
                  'http://image.tmdb.org/t/p/original${widget.article.backdropPath}',
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
                  Text(
                    "${widget.article.title ?? widget.article.name}",
                    style: const TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            widgetController.whiteText("Science Fiction, Action", 15),
                            Row(
                              children: [
                                widgetController.whiteText((widget.article.firstAirDate ??
                                          widget.article.releaseDate)
                                      .toString()
                                      .substring(0, 4), 15),
                                const SizedBox(
                                  width: 10
                                ),
                                widget.article.voteAverage == 0.0
                                    ? Container()
                                    : widgetController.whiteText(
                                        widget.article.voteAverage.toString(), 15),
                                const SizedBox(
                                  width: 10
                                ),
                                widgetController.whiteText("97 Min", 15),
                              ],
                            ),
                          ],
                        ),
                      ),
                      widgetController.iconTextButtonWhite(Icons.play_arrow, 'Watch now', (){}),
                    ],
                  ),
                  const SizedBox(
                    height: 20
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      widgetController.iconTextButton(Icons.live_tv, 'Trailer', (){}),
                      widgetController.iconTextButton(Icons.book, 'Watchlist', (){}),
                      widgetController.iconTextButton(Icons.assistant_rounded, 'Collection', (){}),
                    ],
                  ),
                  Text(
                    widget.article.overview.toString(),
                    style: const TextStyle(
                        color: Colors.white60, fontSize: 15, letterSpacing: 1),
                  ),
                  const SizedBox(
                    height: 20
                  ),
                  widgetController.whiteText('Similar movies', 18),
                  const RowMovie(),
                  const SizedBox(
                    height: 20
                  ),
                  widgetController.whiteText('Related movies', 18),
                  const RowMovie(),
                  const SizedBox(
                    height: 20
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<void> _refreshLocalGallery() async {
    debugPrint('refreshing stocks...');
    setState(() {});
  }
}
