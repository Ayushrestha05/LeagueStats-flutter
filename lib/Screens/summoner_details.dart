import 'package:flutter/material.dart';

class Summoner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(),
        ],
      ),
    );
  }
}
