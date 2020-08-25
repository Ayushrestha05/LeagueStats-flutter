import 'package:flutter/material.dart';
import 'package:league_stats_flutter/Screens/search_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark().copyWith(),
      initialRoute: SearchPage.id,
      routes: {
        SearchPage.id: (context) => SearchPage(),
      },
    );
  }
}
