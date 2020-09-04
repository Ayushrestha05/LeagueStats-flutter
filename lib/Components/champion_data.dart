import 'package:flutter/services.dart';

class ChampionData {
  Future<String> data() async {
    var map = await rootBundle.loadString('lib/JSON/championFull.json');
    return map;
  }

  Future<String> item() async {
    var itemMap = await rootBundle.loadString('lib/JSON/item.json');
    return itemMap;
  }
}
