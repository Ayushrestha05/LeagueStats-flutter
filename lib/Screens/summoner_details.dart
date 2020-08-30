import 'package:flutter/material.dart';
import 'package:league_stats_flutter/Components/champion_data.dart';
import 'package:league_stats_flutter/Components/networking.dart';

class Summoner extends StatefulWidget {
  final selectedRegion;
  final summonerName;
  Summoner({this.selectedRegion, this.summonerName});
  @override
  _SummonerState createState() => _SummonerState();
}

class _SummonerState extends State<Summoner> {
  @override
  void initState() {
    super.initState();
    Networking().getSummonerDetails(widget.selectedRegion, widget.summonerName);
  }

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
