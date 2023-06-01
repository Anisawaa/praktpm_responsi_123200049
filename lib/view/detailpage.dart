import 'package:flutter/material.dart';
import '../model/detail_matches_model.dart';

class DetailPage extends StatelessWidget {
  final DetailMatchesModel detail;
  const DetailPage({super.key, required this.detail});

  @override
  Widget build(BuildContext context) {
    String homeCode = detail.homeTeam!.country ?? '';
    String homeIso = homeCode.substring(0, 2).toLowerCase();
    String awayCode = detail.awayTeam!.country ?? '';
    String awayIso = awayCode.substring(0, 2).toLowerCase();

    int? home_passesCompleted = detail.homeTeam!.statistics!.passesCompleted;
    int? home_passess = detail.homeTeam!.statistics!.passes;
    int? away_passesCompleted = detail.awayTeam!.statistics!.passesCompleted;
    int? away_passess = detail.awayTeam!.statistics!.passes;
    int home_passAccuracy = (home_passesCompleted! / home_passess! * 100).ceil().toInt();
    int away_passAccuracy = (away_passesCompleted! / away_passess! * 100).ceil().toInt();

    return Scaffold(
      appBar: AppBar(
        title: Text('Match ID: ${detail.id}'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.network(
                  'https://flagcdn.com/w320/$homeIso.png',
                  height: 150,
                  width: 200,
                ),
                Text("-"),
                Image.network(
                  'https://flagcdn.com/w320/$awayIso.png',
                  height: 150,
                  width: 200,
                ),
              ],
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('${detail.homeTeam!.country}',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 25),
                      child: Text('${detail.homeTeam!.goals}', style: TextStyle(fontSize: 20),),
                    ),
                  ],
                ),
                Text("-"),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('${detail.awayTeam!.country}',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 25),
                      child: Text('${detail.awayTeam!.goals}', style: TextStyle(fontSize: 20),),
                    ),
                  ],
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(6.0),
              child: Text('Stadium : ${detail.venue}'),
            ),
            Padding(
              padding: const EdgeInsets.all(6.0),
              child: Text('Location : ${detail.location}'),
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
                              child: Text('${detail.homeTeam!.statistics!.ballPossession ?? 0}'),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text('${detail.homeTeam!.statistics!.attemptsOnGoal ?? 0}'),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text('${detail.homeTeam!.statistics!.kicksOnTarget ?? 0}'),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text('${detail.homeTeam!.statistics!.corners ?? 0}'),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text('${detail.homeTeam!.statistics!.offsides ?? 0}'),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text('${detail.homeTeam!.statistics!.foulsCommited ?? 0}'),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text('${home_passAccuracy}%'),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("Ball Possesion"),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("Shot"),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("Shot on Goal"),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("Corners"),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("Offside"),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("Fouls"),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("Pass Accuracy"),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text('${detail.awayTeam!.statistics!.ballPossession ?? 0}'),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text('${detail.awayTeam!.statistics!.attemptsOnGoal ?? 0}'),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text('${detail.awayTeam!.statistics!.kicksOnTarget ?? 0}'),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text('${detail.awayTeam!.statistics!.corners ?? 0}'),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text('${detail.awayTeam!.statistics!.offsides ?? 0}'),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text('${detail.awayTeam!.statistics!.foulsCommited ?? 0}'),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text('${away_passAccuracy}%'),
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
            if (detail.officials != null)
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  crossAxisSpacing: 8.0,
                  mainAxisSpacing: 8.0,
                  childAspectRatio: 1 / 1,
                ),
                itemCount: detail.officials!.length,
                itemBuilder: (context, index) {
                  Officials official = detail.officials![index];
                  return Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 0.5)
                    ),
                    child: Column(
                      children: [
                        Image.network(
                          "assets/fifa.png",
                          width: 100,
                        ),
                        Text(official.name ?? '', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12), textAlign: TextAlign.center,),
                        Text(official.role ?? '', style: TextStyle(fontSize: 12), textAlign: TextAlign.center,),
                      ],
                    ),
                  );
                  // return ListTile(
                  //   title: Text(official.name ?? ''),
                  //   subtitle: Text(official.role ?? ''),
                  //
                  // );
                },
              ),
          ],
        ),
      ),
    );
  }
}
