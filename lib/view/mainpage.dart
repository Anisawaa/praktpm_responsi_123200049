import 'package:flutter/material.dart';
import '../model/base_network.dart';
import '../model/detail_matches_model.dart';
import '../model/matches_model.dart';
import 'detailpage.dart';

class ApiService {
  Future<List<MatchesModel>> getMatches() async {
    final response = await BaseNetwork.getList('matches');
    List<MatchesModel> matches = [];

    if (response.isNotEmpty) {
      for (var json in response) {
        matches.add(MatchesModel.fromJson(json));
      }
    }
    return matches;
  }

  Future<DetailMatchesModel?> getMatchDetail(String matchId) async {
    final response = await BaseNetwork.get('matches/$matchId');
    if (response.isNotEmpty) {
      return DetailMatchesModel.fromJson(response);
    }
    return null;
  }
}

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List<MatchesModel> matches = [];

  @override
  void initState() {
    super.initState();
    _fetchMatches();
  }

  void _fetchMatches() async {
    // Fetch matches from API
    List<MatchesModel> fetchedMatches = await ApiService().getMatches();

    setState(() {
      matches = fetchedMatches;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Piala Dunia 2022"),
      ),
      body: Card(
        child: ListView.builder(
          itemCount: matches.length,
          itemBuilder: (context, index) {
            String homeCode = matches[index].homeTeam?.country ?? '';
            String homeIso = homeCode.substring(0, 2).toLowerCase();
            String awayCode = matches[index].awayTeam?.country ?? '';
            String awayIso = awayCode.substring(0, 2).toLowerCase();

            return ListTile(
              title: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: 150,
                        width: 200,
                        child: Image.network(
                          'https://flagcdn.com/w320/$homeIso.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                      Text("-"),
                      Container(
                        height: 150,
                        width: 200,
                        child: Image.network(
                          'https://flagcdn.com/w320/$awayIso.png',
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text('${matches[index].homeTeam?.name}'),
                      Text("      "),
                      Text('${matches[index].awayTeam?.name}'),
                    ],
                  ),
                  SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text('${matches[index].homeTeam?.goals}'),
                      Text("      "),
                      Text('${matches[index].awayTeam?.goals}'),
                    ],
                  ),
                ],
              ),
              onTap: () {
                ApiService().getMatchDetail(matches[index].id as String).then((match) {
                  if (match != null) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailPage(detail: match),
                      ),
                    );
                  }
                });
              },
            );
          },
        ),
      ),
    );
  }
}
