import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  static final String id = 'homepage';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var selectedRegion = 'NA';
  List<DropdownMenuItem> getDropdownItems() {
    List regionList = [
      'NA',
      'EUNE',
      'EUW',
      'JP',
      'KR',
      'LAN',
      'LAS',
      'BR',
      'OCE',
      'TR',
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            margin: EdgeInsets.only(top: 20),
            height: 200,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('resources/images/LOL_logo.png'),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 20, right: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Color(0xFF2C5C94),
            ),
            height: 50,
            child: Center(
              child: Text(
                'Champions',
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 20, right: 20, top: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Color(0xFF2C5C94),
            ),
            height: 50,
            child: Center(
              child: Text(
                'Items',
                textAlign: TextAlign.center,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            child: Text('Search for Summoner Details in LeagueStats.gg'),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  value: selectedRegion,
                  items: getDropdownItems(),
                  onChanged: (value) {
                    setState(() {
                      selectedRegion = value;
                      print(value);
                    });
                  },
                ),
              ),
              Expanded(
                child: TextField(
                  onSubmitted: (value) {
                    print('${selectedRegion.toLowerCase()},$value');
                    _launchURL(
                        'https://leaguestats.gg/summoner/${selectedRegion.toLowerCase()}/$value');
                  },
                  decoration: InputDecoration(
                    labelText: 'Enter your Summoner\'s name',
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

_launchURL(String url) async {
  if (await canLaunch(url)) {
    await launch(url, forceWebView: false);
  } else {
    print('Could not launch $url');
  }
}
