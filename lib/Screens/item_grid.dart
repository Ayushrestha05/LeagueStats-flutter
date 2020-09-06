import 'dart:convert';
import 'package:flutter/material.dart';

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
          SliverGrid.count(
            crossAxisCount: 3,
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
      print(i);
    }
    return itemList;
  }
}
