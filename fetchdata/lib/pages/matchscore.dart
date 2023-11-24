// Future<List<MatchScore?>> fetchScore() async {
//   final headers = {
//     'X-RapidAPI-Key': 'f34add8855mshf4b90cd3962b3f2p1700bbjsn7d596a05fe4c',
//   };

//   final response = await http.get(Uri.parse(widget.apiUrl), headers: headers);

//   if (response.statusCode == 200) {
//     final parsedData = welcomeFromJson(response.body);
//     final Recentmatches = parsedData.typeMatches
//         .map((TypeMatch) => TypeMatch.seriesMatches
//             .map((SeriesMatch) {
//               if (SeriesMatch.seriesAdWrapper != null) {
//                 return SeriesMatch.seriesAdWrapper?.matches
//                         ?.map((match) => match.matchScore)
//                         .toList() ??
//                     [];
//               } else {
//                 return <MatchScore>[];
//               }
//             })
//             .expand((element) => element)
//             .toList())
//         .expand((element) => element)
//         .toList();
//     return Recentmatches;
//   } else {
//     throw Exception('failed to fetchdata.status code: ${response.statusCode}');
//   }
// }
// Future<List<MatchInfo>> fetchData() async {
//     final headers = {
//       'X-RapidAPI-Key': 'f34add8855mshf4b90cd3962b3f2p1700bbjsn7d596a05fe4c',
//     };

//     final response = await http.get(Uri.parse(widget.apiUrl), headers: headers);

//     if (response.statusCode == 200) {
//       final parsedData = welcomeFromJson(response.body);
//       final recentMatches = parsedData.typeMatches
//           .map((typeMatch) => typeMatch.seriesMatches
//               .map((seriesMatch) {
//                 if (seriesMatch.seriesAdWrapper != null) {
//                   return seriesMatch.seriesAdWrapper?.matches
//                           ?.map((match) => match.matchInfo)
//                           .toList() ??
//                       [];
//                 } else {
//                   return <MatchInfo>[];
//                 }
//               })
//               .expand((element) => element)
//               .toList())
//           .expand((element) => element)
//           .toList();
//       return recentMatches;
//     } else {
//       throw Exception(
//           'Failed to fetch data. Status code: ${response.statusCode}');
//     }
//   }

// Future<List<Match>> fetchData() async {
//   final headers = {
//     'X-RapidAPI-Key': 'f34add8855mshf4b90cd3962b3f2p1700bbjsn7d596a05fe4c',
//   };

//   final response = await http.get(Uri.parse(widget.apiUrl), headers: headers);

//   if (response.statusCode == 200) {
//     final parsedData = welcomeFromJson(response.body);
//     final recentMatches = parsedData.typeMatches
//         .map((typeMatch) => typeMatch.seriesMatches
//             .map((seriesMatch) {
//               if (seriesMatch.seriesAdWrapper != null) {
//                 return seriesMatch.seriesAdWrapper?.matches.toList() ?? [];
//               } else {
//                 return <Match>[];
//               }
//             })
//             .expand((element) => element)
//             .toList())
//         .expand((element) => element)
//         .toList();
//     return recentMatches;
//   }else {
//     throw Exception(
//       'Failed to fetch data. Status code: ${response.statusCode}');

//   }
// }

import 'package:flutter/material.dart';
import 'package:rest_api_example/model/modelforbattersscrore.dart';
import 'package:http/http.dart' as http;

class Scorecard extends StatefulWidget {
  final String apiCardUrl =
      'https://cricbuzz-cricket.p.rapidapi.com/mcenter/v1/75476/scard';
  Scorecard({Key? key}) : super(key: key);

  @override
  _ScoreCard createState() => _ScoreCard();
}

class _ScoreCard extends State<Scorecard> {
  late Future<List<ScoreCard>> _futureScoreCard;

  @override
  void initState() {
    super.initState();
    _futureScoreCard = fetchCard();
  }

  Future<List<ScoreCard>> fetchCard() async {
    final headers = {
      'X-RapidAPI-Key': 'f34add8855mshf4b90cd3962b3f2p1700bbjsn7d596a05fe4c',
    };
    final responseForCard =
        await http.get(Uri.parse(widget.apiCardUrl), headers: headers);
    if (responseForCard.statusCode == 200) {
      final parsedDataOfCard = welcomedFromJson(responseForCard.body);
      final scorecardWidget = parsedDataOfCard.scoreCard
          .map((ScoreCard scoreCard) => scoreCard)
          .toList();
      print(responseForCard.body);

      return scorecardWidget;
    } else {
      throw Exception(
          'Failed to Fetch Data. Status Code : ${responseForCard.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<ScoreCard>>(
        future: _futureScoreCard,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            // You can use the snapshot.data to display the scorecard data
            final scorecardData = snapshot.data; // Safely access snapshot.data
            if (scorecardData != null && scorecardData.isNotEmpty) {
              return buildScoreCardUI(scorecardData);
            } else {
              return Text('No data available');
            }
          }
        },
      ),
    );
  }

  Widget buildScoreCardUI(List<ScoreCard> scorecardData) {
    // Build and return your UI components using the scorecardData
    return Text(scorecardData[0].batTeamDetails.batTeamName);
  }
}
