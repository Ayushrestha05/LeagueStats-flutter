import 'dart:convert';

import 'package:flutter/material.dart';

class ChampionGrid extends StatefulWidget {
  final data;
  ChampionGrid({this.data});

  @override
  _ChampionGridState createState() => _ChampionGridState();
}

class _ChampionGridState extends State<ChampionGrid> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(),
          SliverGrid.count(
            crossAxisCount: 3,
            children: gridData(),
          )
        ],
      ),
    );
  }

  List<Widget> gridData() {
    var decodeData = jsonDecode(widget.data);
    print(decodeData['data'].keys);
    List<Widget> gridList = [];
    for (var i in decodeData['data'].keys) {
      gridList.add(
        Column(
          children: [Container(), Text(i)],
        ),
      );
    }
    return gridList;
  }
}
