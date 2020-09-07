import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:league_stats_flutter/Screens/item_detail.dart';

class ItemGrid extends StatefulWidget {
  final data;
  ItemGrid({this.data});

  @override
  _ItemGridState createState() => _ItemGridState();
}

class _ItemGridState extends State<ItemGrid> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 20,
            ),
          ),
          SliverGrid.count(
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            crossAxisCount: 4,
            children: itemGrid(),
          )
        ],
      ),
    );
  }

  List<Widget> itemGrid() {
    var decodeData = jsonDecode(widget.data);
    List<Widget> itemList = [];
    for (var i in decodeData['data'].keys) {
      itemList.add(
        RawMaterialButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ItemDetails(
                          data: widget.data,
                          selectedItem: i,
                        )));
          },
          child: Column(
            children: [
              Container(
                child: Image(
                  image: AssetImage('resources/images/item/$i.png'),
                ),
              ),
              Expanded(
                child: Text(
                  decodeData['data'][i]['name'],
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      );
    }
    return itemList;
  }
}
