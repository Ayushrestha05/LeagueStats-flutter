import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:league_stats_flutter/Components/StatsWidget.dart';

class Summoner extends StatefulWidget {
  final summonerData;
  final summonerRegion;
  Summoner({this.summonerData, this.summonerRegion});
  @override
  _SummonerState createState() => _SummonerState();
}

class _SummonerState extends State<Summoner> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var decode = jsonDecode(widget.summonerData);

    return Scaffold(
      drawer: Drawer(),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                child: Row(
                  children: [
                    Stack(
                      children: [
                        Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.lightBlue,
                            image: DecorationImage(
                              image: NetworkImage(
                                  'http://ddragon.leagueoflegends.com/cdn/10.16.1/img/profileicon/${decode['profileIconId']}.png'),
                            ),
                          ),
                        ),
                        Positioned(
                          right: 0,
                          bottom: 00,
                          child: Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.lightBlue,
                            ),
                            child: Center(
                                child: Text(
                              decode['summonerLevel'].toString(),
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            )),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      decode['name'],
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Stats(
              summonerRegion: widget.summonerRegion,
              summonerData: widget.summonerData,
            ),
          )
        ],
      ),
    );
  }
}
