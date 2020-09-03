import 'package:flutter/material.dart';
import 'package:league_stats_flutter/Components/RoleWidget.dart';
import 'package:league_stats_flutter/Components/networking.dart';

class Stats extends StatefulWidget {
  final summonerRegion;
  final summonerData;
  Stats({this.summonerRegion, this.summonerData});
  @override
  _StatsState createState() => _StatsState();
}

class _StatsState extends State<Stats> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            color: Color(0xFF2C5C94), borderRadius: BorderRadius.circular(10)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'STATS',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            Container(
              color: Color(0xFF2C5282),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  RoleWidget(
                    wins: 1,
                    loss: 1,
                    icon: 'top',
                  ),
                  RoleWidget(
                    wins: 2,
                    loss: 2,
                    icon: 'jungle',
                  ),
                  RoleWidget(
                    wins: 2,
                    loss: 0,
                    icon: 'mid',
                  ),
                  RoleWidget(
                    wins: 18,
                    loss: 20,
                    icon: 'bot',
                  ),
                  RoleWidget(
                    wins: 4,
                    loss: 6,
                    icon: 'supp',
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
