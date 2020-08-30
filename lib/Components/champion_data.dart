import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/services.dart';

class ChampionData {
  Future<String> data() async {
    var map = await rootBundle.loadString('lib/JSON/championFull.json');
    return map;
  }
}
