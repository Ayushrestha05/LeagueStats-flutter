import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:league_stats_flutter/Screens/champion_detail.dart';
import 'package:league_stats_flutter/Screens/champion_grid.dart';
import 'package:league_stats_flutter/Screens/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown
    ]); //Sets the screen to be only in portrait mode.
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Color(0xFF151723),
        primaryColor: Color(0xFFF08080),
      ),
      initialRoute: HomePage.id,
      routes: {
        HomePage.id: (context) => HomePage(),
        ChampDetail.id: (context) => ChampDetail(),
        ChampionGrid.id: (context) => ChampionGrid(),
      },
    );
  }
}

//Blue dongker #000080
//Maroon #800000
//Dark Red #8B0000
//Cyan #00FFFF
//Light Coral #F08080
//Tomato #FF6347
