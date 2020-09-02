import 'dart:convert';
import 'package:league_stats_flutter/Components/RawMaterial.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class ChampDetail extends StatefulWidget {
  static final String id = 'champion_detail';
  final data;
  final champion;
  ChampDetail({this.data, this.champion});

  @override
  _ChampDetailState createState() => _ChampDetailState();
}

class _ChampDetailState extends State<ChampDetail> {
  int currentLVL = 1;

  @override
  Widget build(BuildContext context) {
    var decodeData = jsonDecode(widget.data);
    String champ = widget.champion;
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
                        champ,
                        style: TextStyle(fontSize: 50),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Image(
                      image: AssetImage(
                        'resources/images/champion/loading/${champ}_0.jpg',
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
                children: getSkinImage(),
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
                    Text(decodeData['data']['$champ']['lore']),
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
                    getChampStats(),
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
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundIcon(
                                icon: Icon(AntDesign.minus),
                                onPressed: () {
                                  if (currentLVL > 1) {
                                    currentLVL--;
                                  }
                                  setState(() {});
                                },
                              ),
                              Text(
                                currentLVL.toString(),
                                style: TextStyle(fontSize: 20),
                              ),
                              RoundIcon(
                                icon: Icon(AntDesign.plus),
                                onPressed: () {
                                  if (currentLVL < 18) {
                                    currentLVL++;
                                  }
                                  setState(() {});
                                },
                              ),
                            ],
                          ),
                        )
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
                    Text('${decodeData['data'][champ]['passive']['name']}'),
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Image(
                            image: AssetImage(
                                'resources/images/champion/passive/${decodeData['data'][champ]['passive']['image']['full']}'),
                          ),
                        ),
                        Expanded(
                          flex: 4,
                          child: Text(
                              '${decodeData['data'][champ]['passive']['description']}'),
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
                AbilitySpells(
                  spellName: decodeData['data'][champ]['spells'][0]['name'],
                  spellImage: decodeData['data'][champ]['spells'][0]['image']
                      ['full'],
                  spellDesc: decodeData['data'][champ]['spells'][0]
                      ['description'],
                ),
                Divider(
                  thickness: 2,
                  indent: 30,
                  endIndent: 30,
                ),
                AbilitySpells(
                  spellName: decodeData['data'][champ]['spells'][1]['name'],
                  spellImage: decodeData['data'][champ]['spells'][1]['image']
                      ['full'],
                  spellDesc: decodeData['data'][champ]['spells'][1]
                      ['description'],
                ),
                Divider(
                  thickness: 2,
                  indent: 30,
                  endIndent: 30,
                ),
                AbilitySpells(
                  spellName: decodeData['data'][champ]['spells'][2]['name'],
                  spellImage: decodeData['data'][champ]['spells'][2]['image']
                      ['full'],
                  spellDesc: decodeData['data'][champ]['spells'][2]
                      ['description'],
                ),
                Divider(
                  thickness: 2,
                  indent: 30,
                  endIndent: 30,
                ),
                AbilitySpells(
                  spellName: decodeData['data'][champ]['spells'][3]['name'],
                  spellImage: decodeData['data'][champ]['spells'][3]['image']
                      ['full'],
                  spellDesc: decodeData['data'][champ]['spells'][3]
                      ['description'],
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

  List<Widget> getSkinImage() {
    String champ = widget.champion;
    List<Widget> imageSkinList = [];
    for (var i = 1; i <= 50; i++) {
      try {
        imageSkinList.add(
          Image(
            image:
                AssetImage('resources/images/champion/loading/${champ}_$i.jpg'),
          ),
        );
      } catch (e) {
        print("noooo");
      }
    }

    return imageSkinList;
  }

  Widget getChampStats() {
    var decodeData = jsonDecode(widget.data);
    String champ = widget.champion;

    var baseHP = decodeData['data']['$champ']['stats']['hp'];
    var hpPerLevel = decodeData['data']['$champ']['stats']['hpperlevel'];
    var baseMP = decodeData['data']['$champ']['stats']['mp'];
    var mpPerLevel = decodeData['data']['$champ']['stats']['mpperlevel'];
    var moveSpeed = decodeData['data']['$champ']['stats']['movespeed'];
    var armor = decodeData['data']['$champ']['stats']['armor'];
    var armorPerLevel = decodeData['data']['$champ']['stats']['armorperlevel'];
    var spellBlock = decodeData['data']['$champ']['stats']['spellblock'];
    var spellBlockPerLevel =
        decodeData['data']['$champ']['stats']['spellblockperlevel'];
    var atkRange = decodeData['data']['$champ']['stats']['attackrange'];
    var hpRegen = decodeData['data']['$champ']['stats']['hpregen'];
    var hpRegenPerLevel =
        decodeData['data']['$champ']['stats']['hpregenperlevel'];
    var mpRegen = decodeData['data']['$champ']['stats']['mpregen'];
    var mpRegenPerLevel =
        decodeData['data']['$champ']['stats']['mpregenperlevel'];
    var crit = decodeData['data']['$champ']['stats']['crit'];
    var critPerLevel = decodeData['data']['$champ']['stats']['critperlevel'];
    var atkDamage = decodeData['data']['$champ']['stats']['attackdamage'];
    var atkDamagePerLevel =
        decodeData['data']['$champ']['stats']['attackdamageperlevel'];
    var atkSpeed = decodeData['data']['$champ']['stats']['attackspeed'];
    var atkSpeedPerLevel =
        decodeData['data']['$champ']['stats']['attackspeedperlevel'];

    return GridView.count(
      padding: EdgeInsets.all(10),
      primary: false,
      shrinkWrap: true,
      crossAxisCount: 2,
      childAspectRatio: 10,
      children: [
        Text('HP : ${baseHP + (currentLVL - 1) * hpPerLevel}'),
        Text('MP : ${baseMP + (currentLVL - 1) * mpPerLevel}'),
        Text(
            'HP Regen (Per Second): ${hpRegen + (currentLVL - 1) * hpRegenPerLevel}'),
        Text(
            'MP Regen (Per Second): ${mpRegen + (currentLVL - 1) * mpRegenPerLevel}'),
        Text('Armor : ${armor + (currentLVL - 1) * armorPerLevel}'),
        Text(
            'Spell Block: ${spellBlock + (currentLVL - 1) * spellBlockPerLevel}'),
        Text('ATK Dmg: ${atkDamage + (currentLVL - 1) * atkDamagePerLevel}'),
        Text('ATK Speed: ${atkSpeed + (currentLVL - 1) * atkSpeedPerLevel}'),
        Text('Move Speed: $moveSpeed'),
        Text('ATK Range: $atkRange'),
        Text('Critical Hit : ${crit + (currentLVL - 1) * critPerLevel}'),
      ],
    );
  }
}
