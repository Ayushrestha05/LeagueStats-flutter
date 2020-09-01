import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:league_stats_flutter/Screens/champion_detail.dart';

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
      drawer: Drawer(),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: true,
          ),
          SliverGrid.count(
            childAspectRatio: 0.9,
            crossAxisCount: 3,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
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
        RawMaterialButton(
          onPressed: () {
            print('i was pressed in $i');
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ChampDetail(
                  data: widget.data,
                  champion: i,
                ),
              ),
            );
          },
          child: Column(
            children: [
              Container(
                child: Image(
                  image: AssetImage('resources/images/champion/$i.png'),
                ),
              ),
              Text(i)
            ],
          ),
        ),
      );
    }
    return gridList;
  }
}
