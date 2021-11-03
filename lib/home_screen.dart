import 'package:flutter/material.dart';

import 'data.dart';
import 'movies_list_view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController _scrollController1 = ScrollController();
  final ScrollController _scrollController2 = ScrollController();
  final ScrollController _scrollController3 = ScrollController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      double minScrollExtent1 = _scrollController1.position.minScrollExtent;
      double maxScrollExtent1 = _scrollController1.position.maxScrollExtent;
      double minScrollExtent2 = _scrollController2.position.minScrollExtent;
      double maxScrollExtent2 = _scrollController2.position.maxScrollExtent;
      double minScrollExtent3 = _scrollController3.position.minScrollExtent;
      double maxScrollExtent3 = _scrollController3.position.maxScrollExtent;
      animateToMaxMin(maxScrollExtent1, minScrollExtent1, maxScrollExtent1, 25,
          _scrollController1);
      animateToMaxMin(maxScrollExtent2, minScrollExtent2, maxScrollExtent2, 15,
          _scrollController1);
      animateToMaxMin(maxScrollExtent3, minScrollExtent3, maxScrollExtent3, 20,
          _scrollController1);
    });
  }

  animateToMaxMin(double max, double min, double direction, int seconds,
      ScrollController scrollController) {
    scrollController
        .animateTo(direction,
            duration: Duration(seconds: seconds), curve: Curves.linear)
        .then((value) {
      direction = direction == max ? min : max;
      animateToMaxMin(max, min, direction, seconds, scrollController);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Hello"),
        ),
        backgroundColor: Colors.white,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                MoviesListView(
                  scrollController: _scrollController1,
                  images: movies1,
                ),
                MoviesListView(
                  scrollController: _scrollController2,
                  images: movies2,
                ),
                MoviesListView(
                  scrollController: _scrollController3,
                  images: movies3,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
