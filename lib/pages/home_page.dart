import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:netflix_clone_latest/controller/widget_controller.dart';
import 'package:netflix_clone_latest/pages/row_movie.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  var widgetController = Get.put(WidgetController());
  int list = 0;
  ScrollController _myController = ScrollController();
  ScrollController? _scrollController;
  double _scrollOffset = 0.5;

  @override
  void initState() {
    _scrollController = ScrollController()
      ..addListener(() {
        setState(() {
          _scrollOffset = _scrollController!.offset;
        });
      });
    _myController = ScrollController()
      ..addListener(() {
        setState(() {});
      });
    super.initState();
  }

  @override
  void dispose() {
    _scrollController!.dispose();
    super.dispose();
  }

  @Deprecated('message')
  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(
          Icons.shuffle,
          color: Colors.purple,
        ),
        backgroundColor: Colors.white70,
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 5,
        color: Colors.black,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(child: widgetController.greyButton(Icons.home, () {})),
            Expanded(child: widgetController.greyButton(Icons.collections_bookmark, () {})),
            Expanded(child: widgetController.greyButton(Icons.adjust_outlined, () {})),
            Expanded(child: widgetController.greyButton(Icons.settings, () {})),
          ],
        ),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            controller: _myController,
            child: Container(
                color: Colors.black,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 3 / 5,
                      child: Stack(
                        children: [
                          SizedBox(
                            width: double.infinity,
                            child: Image.network(
                              'https://m.media-amazon.com/images/M/MV5BZmFkMzc2NTctN2U1Ni00MzE5LWJmMzMtYWQ4NjQyY2MzYmM1XkEyXkFqcGdeQXVyNTIzOTk5ODM@._V1_FMjpg_UX1000_.jpg',
                              fit: BoxFit.cover,
                            ),
                          ),
                          Positioned(
                            bottom: 0.0,
                            left: 0.0,
                            right: 0.0,
                            child: Container(
                              decoration: const BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black45,
                                  ),
                                  BoxShadow(
                                    color: Colors.black,
                                    spreadRadius: -20.0,
                                    blurRadius: 20.0,
                                  ),
                                ],
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  IconButton(
                                      onPressed: () {
                                        setState(() {
                                          list == 0 ? list = 1 : list = 0;
                                        });
                                      },
                                      icon: Icon(
                                        list == 0 ? Icons.add : Icons.done,
                                        color: Colors.white,
                                        size: 35,
                                      )),
                                  widgetController.iconTextButtonWhite(Icons.play_arrow, 'Play', (){}),
                                  IconButton(
                                      onPressed: () {},
                                      icon: const Icon(
                                        Icons.info_outline,
                                        color: Colors.white,
                                        size: 35,
                                      )),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    widgetController.headingText(text: 'Trending Now'),
                    const RowMovie(),
                    const SizedBox(height: 20,),
                    widgetController.headingText(text: 'Top 10 in india Today'),
                    const RowMovie(),
                  ],
                )),
          ),
          SizedBox(
            height: 200,
            child: NestedScrollView(
              controller: _myController,
              headerSliverBuilder: (context, innerBoxIsScrolled) {
                return [
                  SliverAppBar(
                    snap: true,
                    pinned: true,
                    floating: true,
                    expandedHeight: 130,
                    backgroundColor: Colors.black.withOpacity(_scrollOffset),
                    leading: Image.asset('assets/images/icon.png'),
                    actions: [
                      IconButton(
                        icon: const Icon(Icons.search_sharp),
                        tooltip: 'Comment Icon',
                        onPressed: () {},
                      ),
                      Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.purple,
                          ),
                          height: 10,
                          width: 20,
                        ),
                      ),
                    ],
                    bottom: PreferredSize(
                      preferredSize: Size(screenSize.width, 50.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          widgetController.textButton('TV Shows', (){}),
                          widgetController.textButton('Movies', (){}),
                          widgetController.textButton('Categories', (){}),
                        ],
                      ),
                    ),
                  ),
                ];
              },
              body: Container(
                height: 0.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
