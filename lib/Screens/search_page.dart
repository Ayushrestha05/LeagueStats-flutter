import 'package:flutter/material.dart';
import 'package:league_stats_flutter/Components/champion_data.dart';
import 'package:league_stats_flutter/Screens/champion_grid.dart';
import 'package:league_stats_flutter/Screens/summoner_details.dart';

class SearchPage extends StatefulWidget {
  static final String id = 'search_page';
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  var selectedRegion = 'NA';
  List<DropdownMenuItem> getDropdownItems() {
    List regionList = [
      'NA',
      'EUN',
      'EUW',
      'JP',
      'KR',
      'LAN',
      'LAS',
      'BRA',
      'OCE',
      'TUR',
      'RU',
    ];
    List<DropdownMenuItem<String>> dropdownItems = [];

    for (int i = 0; i < regionList.length; i++) {
      dropdownItems.add(
        DropdownMenuItem(
          child: Text(regionList[i]),
          value: regionList[i],
        ),
      );
    }

    return dropdownItems;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(child: Text("League")),
            ListTile(
              title: Text('Search Summoner'),
            ),
            ListTile(
                title: Text('Champions'),
                onTap: () async {
                  var data = await ChampionData().data();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ChampionGrid(
                        data: data,
                      ),
                    ),
                  );
                })
          ],
        ),
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 20,
            ),
            Container(
              width: double.maxFinite,
              height: 150,
              child: Image(
                image: AssetImage('resources/images/LOL_logo.png'),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                DropdownButton<String>(
                  value: selectedRegion,
                  items: getDropdownItems(),
                  onChanged: (value) {
                    setState(() {
                      selectedRegion = value;
                      print(value);
                    });
                  },
                ),
                Expanded(
                  child: TextField(
                    onSubmitted: (value) {
                      print(value);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Summoner(
                            selectedRegion: selectedRegion,
                            summonerName: value,
                          ),
                        ),
                      );
                    },
                    decoration: InputDecoration(
                      labelText: 'Enter your Summoner\'s name',
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
