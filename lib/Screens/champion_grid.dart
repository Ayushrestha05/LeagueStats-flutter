import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:league_stats_flutter/Screens/champion_detail.dart';

class ChampionGrid extends StatefulWidget {
  static final String id = 'champion_grid';
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
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Image(
              image: NetworkImage(
                'http://ddragon.leagueoflegends.com/cdn/img/champion/splash/Aatrox_0.jpg',
              ),
              fit: BoxFit.fill,
            ),
          ],
        ),
      ),
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
