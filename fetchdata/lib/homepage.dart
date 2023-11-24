import 'package:flutter/material.dart';
import 'package:rest_api_example/pages/LiveMatches.dart';
import 'package:rest_api_example/pages/recentmatches.dart';
import 'package:rest_api_example/pages/upcomingmatches.dart';

class Home extends StatelessWidget {
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
            title: Text(
              'FORESAY',
            ),
            centerTitle: true),
        body: Column(
          children: [
            TabBar(
              tabs: [
                Tab(
                  icon: Icon(
                    Icons.home,
                    color: Colors.deepPurple,
                  ),
                ),
                Tab(
                  icon: Icon(
                    Icons.settings,
                    color: Colors.deepPurple,
                  ),
                ),
                Tab(
                  icon: Icon(
                    Icons.person,
                    color: Colors.deepPurple,
                  ),
                )
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  // 1st tab
                  Livematches(),
                  // 2nd tab
                  Recentmatches(),
                  // //3rd tab
                  Upcomingmatches()
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
