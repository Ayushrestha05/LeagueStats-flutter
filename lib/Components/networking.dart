import 'package:http/http.dart' as http;

class Networking {
  static const api_key = null;
  void getSummonerDetails(selectedRegion, summonerName) async {
    print("$selectedRegion,$summonerName");
    var jsonData = await http.get(
        'https://${getRegionHTTP(selectedRegion)}/lol/summoner/v4/summoners/by-name/$summonerName?api_key=$api_key');
    print(jsonData.body);
  }

  String getRegionHTTP(selectedRegion) {
    var regionHTTPS = {
      'NA': 'na1.api.riotgames.com',
      'EUN': 'eun1.api.riotgames.com',
      'EUW': 'euw1.api.riotgames.com',
      'JP': 'jp1.api.riotgames.com',
      'KR': 'kr.api.riotgames.com',
      'LAN': 'la1.api.riotgames.com',
      'LAS': 'la2.api.riotgames.com',
      'BRA': 'br1.api.riotgames.com',
      'OCE': 'oc1.api.riotgames.com',
      'TUR': 'tr1.api.riotgames.com',
      'RU': 'ru.api.riotgames.com'
    };
    return regionHTTPS[selectedRegion];
  }
}
