import 'dart:convert';
import 'package:flutter/material.dart';

class ItemDetails extends StatefulWidget {
  final data;
  final selectedItem;
  ItemDetails({this.data, this.selectedItem});

  @override
  _ItemDetailsState createState() => _ItemDetailsState();
}

class _ItemDetailsState extends State<ItemDetails> {
  @override
  Widget build(BuildContext context) {
    var decodeData = jsonDecode(widget.data);
    var kTextHeading = TextStyle(fontSize: 30);
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Expanded(
                flex: 1,
                child: Image(
                  image: AssetImage(
                      'resources/images/item/${widget.selectedItem}.png'),
                ),
              ),
              Expanded(
                flex: 2,
                child: Text(
                  decodeData['data'][widget.selectedItem]['name'],
                  style: TextStyle(fontSize: 30),
                ),
              )
            ],
          ),
          Text(
            'Description',
            textAlign: TextAlign.left,
            style: kTextHeading,
          ),
          SizedBox(
            height: 20,
          ),
          Text(decodeData['data'][widget.selectedItem]['description']),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Expanded(
                child: Text(
                  "Buying Price: ${decodeData['data'][widget.selectedItem]['gold']['total']}",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Expanded(
                child: Text(
                  "Selling Price: ${decodeData['data'][widget.selectedItem]['gold']['sell']}",
                  style: TextStyle(fontSize: 20),
                ),
              )
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "Can be Formed Into",
            style: kTextHeading,
          ),
          Container(
            height: 72,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: itemInto(),
            ),
          )
        ],
      ),
    );
  }

  List<Widget> itemInto() {
    var decodeData = jsonDecode(widget.data);
    List<Widget> intoList = [];
    try {
      for (var i in decodeData['data'][widget.selectedItem]['into']) {
        intoList.add(
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
            child: Image(
              image: AssetImage('resources/images/item/$i.png'),
            ),
          ),
        );
      }
    } catch (e) {
      intoList.add(Text('Nothing'));
    }
    return intoList;
  }
}
