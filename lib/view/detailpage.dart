import 'package:flutter/material.dart';
import '../model/matches_model.dart';

class DetailPage extends StatelessWidget {
  final MatchesModel match;
  const DetailPage({super.key, required this.match});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Match ID: ${match.id}'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('${match.homeTeam!.country}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 25),
                      child: Text('${match.homeTeam!.goals}', style: TextStyle(fontSize: 20),),
                    ),
                  ],
                ),
                Text("-"),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('${match.awayTeam!.country}',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 25),
                      child: Text('${match.awayTeam!.goals}', style: TextStyle(fontSize: 20),),
                    ),
                  ],
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(6.0),
              child: Text('Stadium : ${match.venue}'),
            ),
            Padding(
              padding: const EdgeInsets.all(6.0),
              child: Text('Location : ${match.location}'),
            ),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(width: 0.5),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: Text("Statistic", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text('${match.homeTeam!.goals}'),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text('${match.homeTeam!.penalties}'),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("Goals"),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("Penalties"),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text('${match.awayTeam!.goals}'),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text('${match.awayTeam!.penalties}'),
                            ),
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Text("Referees", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
              ),
            ),
            if (match.officials != null)
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: match.officials!.length,
                itemBuilder: (context, index) {
                  Officials official = match.officials![index];
                  return ListTile(
                    title: Text(official.name ?? ''),
                    subtitle: Text(official.role ?? ''),
                    trailing: Text(official.country ?? ''),
                  );
                },
              ),
          ],
        ),
      ),
    );
  }
}
