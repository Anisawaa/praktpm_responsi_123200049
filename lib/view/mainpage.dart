import 'package:flutter/material.dart';
import 'package:praktpm_responsi_123200049/view/detailpage.dart';
import '../model/matches_model.dart';
import '../model/base_network.dart';

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

  Future<MatchesModel?> getMatchDetail(String matchId) async {
    final response = await BaseNetwork.get('matches/$matchId');
    if (response.isNotEmpty) {
      return MatchesModel.fromJson(response);
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
    ApiService apiService = ApiService();
    List<MatchesModel> fetchedMatches = await apiService.getMatches();

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
            return ListTile(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text('${matches[index].homeTeam?.name}'),
                  Text("      "),
                  Text('${matches[index].awayTeam?.name}'),
                ],
              ),
              subtitle: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text('${matches[index].homeTeam?.goals}'),
                  Text("-"),
                  Text('${matches[index].awayTeam?.goals}'),
                ],
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailPage(match: matches[index]),
                  ),
                );
              },
            );
          },
        ),
      )
    );
  }
}

// Widget _buildListWorldCup() {
//
//   return Container(
//     child: ListView.builder(
//       itemCount: matches.length,
//       itemBuilder: itemBuilder
//     ),
//   );
// }