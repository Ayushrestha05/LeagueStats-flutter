import 'package:flutter/material.dart';

class ChampDetail extends StatefulWidget {
  static final String id = 'champion_detail';
  @override
  _ChampDetailState createState() => _ChampDetailState();
}

class _ChampDetailState extends State<ChampDetail> {
  int currentLVL = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 20,
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              child: Row(
                children: [
                  Expanded(
                    child: Center(
                      child: Text(
                        'Aatrox',
                        style: TextStyle(fontSize: 50),
                      ),
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
                'Skins',
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
          SliverToBoxAdapter(
            child: SizedBox(
              height: 20,
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              decoration: BoxDecoration(
                //border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(10),
                color: Color(0xFF212438),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'Champion Lore',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 30,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                        'Once honored defenders of Shurima against the Void, Aatrox and his brethren would eventually become an even greater threat to Runeterra, and were defeated only by cunning mortal sorcery. But after centuries of imprisonment, Aatrox was the first to find freedom once more, corrupting and transforming those foolish enough to try and wield the magical weapon that contained his essence. Now, with stolen flesh, he walks Runeterra in a brutal approximation of his previous form, seeking an apocalyptic and long overdue vengeance.'),
                  ],
                ),
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
              decoration: BoxDecoration(
                //border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(10),
                color: Color(0xFF212438),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Champion Lvl $currentLVL Stats',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 30,
                      ),
                    ),
                    GridView.count(
                      padding: EdgeInsets.all(10),
                      primary: false,
                      shrinkWrap: true,
                      crossAxisCount: 2,
                      childAspectRatio: 10,
                      children: [
                        Text('HP : ${580 - 90 + currentLVL * 90}'),
                        Text('MP : ${0 + currentLVL * 0}'),
                        Text(
                            'HP Regen (Per Second): ${3 - 1 + currentLVL * 1}'),
                        Text('MP Regen (Per Second): ${0 + currentLVL * 0}'),
                        Text('Armor : ${38 - 3.25 + currentLVL * 3.25}'),
                        Text('Spell Block: ${32.1 - 1.25 + currentLVL * 1.25}'),
                        Text('ATK Dmg: ${60 - 5 + currentLVL * 5}'),
                        Text('ATK Speed: ${0.651 - 2.5 + currentLVL * 2.5}'),
                        Text('Move Speed: 345'),
                        Text('ATK Range: 175'),
                        Text('Critical Hit : 0'),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Level",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 30,
                          ),
                        ),
                        SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                            activeTrackColor: Color(0xDDF08080),
                            inactiveTrackColor: Color(0xFFE9E9EC),
                            overlayColor: Color(0x55F08080),
                            thumbColor: Color(0xFFF08080),
                          ),
                          child: Slider(
                            value: currentLVL.toDouble(),
                            min: 1.0,
                            max: 18.0,
                            //divisions: 18,
                            onChanged: (double newValue) {
                              setState(() {
                                currentLVL = newValue.toInt();
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Skills',
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 30),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Passive',
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 20),
                ),
                Column(
                  children: [
                    Text('Deathbringer Stance'),
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Image(
                            image: AssetImage(
                                'resources/images/champion/passive/Aatrox_Passive.png'),
                          ),
                        ),
                        Expanded(
                          flex: 4,
                          child: Text(
                              'Periodically, Aatrox\'s next basic attack deals bonus <physicalDamage>physical damage'),
                        )
                      ],
                    ),
                  ],
                ),
                Divider(
                  thickness: 2,
                  indent: 30,
                  endIndent: 30,
                ),
                Text(
                  'Spells',
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 20),
                ),
                Column(
                  children: [
                    Text('The Darkin Blade'),
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Image(
                            image: AssetImage(
                                'resources/images/champion/spell/AatroxQ.png'),
                          ),
                        ),
                        Expanded(
                          flex: 4,
                          child: Text(
                              "Aatrox slams his greatsword down, dealing physical damage. He can swing three times, each with a different area of effect."),
                        )
                      ],
                    ),
                  ],
                ),
                Divider(
                  thickness: 2,
                  indent: 30,
                  endIndent: 30,
                ),
                Column(
                  children: [
                    Text('Infernal Chains'),
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Image(
                            image: AssetImage(
                                'resources/images/champion/spell/AatroxW.png'),
                          ),
                        ),
                        Expanded(
                          flex: 4,
                          child: Text(
                              "Aatrox smashes the ground, dealing damage to the first enemy hit. Champions and large monsters have to leave the impact area quickly or they will be dragged to the center and take the damage again."),
                        )
                      ],
                    ),
                  ],
                ),
                Divider(
                  thickness: 2,
                  indent: 30,
                  endIndent: 30,
                ),
                Column(
                  children: [
                    Text('Umbral Dash'),
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Image(
                            image: AssetImage(
                                'resources/images/champion/spell/AatroxE.png'),
                          ),
                        ),
                        Expanded(
                          flex: 4,
                          child: Text(
                              "Passively, Aatrox heals when damaging enemy champions. On activation, he dashes in a direction."),
                        )
                      ],
                    ),
                  ],
                ),
                Divider(
                  thickness: 2,
                  indent: 30,
                  endIndent: 30,
                ),
                Column(
                  children: [
                    Text('World Ender'),
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Image(
                            image: AssetImage(
                                'resources/images/champion/spell/AatroxR.png'),
                          ),
                        ),
                        Expanded(
                          flex: 4,
                          child: Text(
                              "Aatrox unleashes his demonic form, fearing nearby enemy minions and gaining attack damage, increased healing, and movement speed. If he gets a takedown, this effect is extended."),
                        )
                      ],
                    ),
                  ],
                ),
                Divider(
                  thickness: 2,
                  indent: 30,
                  endIndent: 30,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
