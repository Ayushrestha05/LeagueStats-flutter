import 'package:flutter/material.dart';

class ChampDetail extends StatefulWidget {
  static final String id = 'champion_detail';
  @override
  _ChampDetailState createState() => _ChampDetailState();
}

class _ChampDetailState extends State<ChampDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(),
          SliverToBoxAdapter(
            child: Container(
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Text('Aatrox'),
                        Text('The Dark-Kin Blade'),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Image(
                      image: AssetImage(
                        'resources/images/champion/loading/Aatrox_0.jpg',
                      ),
                      height: 300,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 20,
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              child: Text(
                'Loading Splash Skins',
                style: TextStyle(fontSize: 30),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              height: 300,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Image(
                    image: AssetImage(
                        'resources/images/champion/loading/Aatrox_1.jpg'),
                  ),
                  Image(
                    image: AssetImage(
                        'resources/images/champion/loading/Aatrox_2.jpg'),
                  ),
                  Image(
                    image: AssetImage(
                        'resources/images/champion/loading/Aatrox_3.jpg'),
                  ),
                  Image(
                    image: AssetImage(
                        'resources/images/champion/loading/Aatrox_7.jpg'),
                  ),
                  Image(
                    image: AssetImage(
                        'resources/images/champion/loading/Aatrox_8.jpg'),
                  ),
                  Image(
                    image: AssetImage(
                        'resources/images/champion/loading/Aatrox_9.jpg'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
