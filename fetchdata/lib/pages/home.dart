import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Homepage extends StatelessWidget {
  // Replace this with your API endpoint
  final String apiUrl =
      'https://cricbuzz-cricket.p.rapidapi.com/matches/v1/recent';

  const Homepage({Key? key}) : super(key: key);

  void fetchData() async {
    final headers = {
      'X-RapidAPI-Key': 'd0ce67fd29msh53279f5b6f6bbabp1d081ejsna7a8dd32dd1d',
    };

    final response = await http.get(Uri.parse(apiUrl), headers: headers);

    final responseOne = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      print('API Response: ${response.body}');
    } else {
      print('Failed to fetch data. Status code: ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('API Data Fetcher'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            fetchData();
          },
          child: const Text('Fetch API Data'),
        ),
      ),
    );
  }
}
