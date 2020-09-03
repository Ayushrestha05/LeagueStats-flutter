import 'package:http/http.dart' as http;

class Networking {
  static const api_key = 'RGAPI-1cc97b13-c73f-41ae-845f-c35f3167a9d0';
  Future getSummonerDetails(selectedRegion, summonerName) async {
    var jsonData = await http.get(
        'https://${getRegionHTTP(selectedRegion)}/lol/summoner/v4/summoners/by-name/$summonerName?api_key=$api_key');
    return (jsonData.body);
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

  Future<String> getMatchData(selectedRegion, accountID) async {
    var matchData = await http.get(
        'https://${getRegionHTTP(selectedRegion)}/lol/match/v4/matchlists/by-account/$accountID?api_key=$api_key');

    return (matchData.body);
  }
}
