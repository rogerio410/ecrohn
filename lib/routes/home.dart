import 'package:flutter/material.dart';
import 'package:ecronh/widgets/tabs_content.dart';

class HomeRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      elevation: 0.0,
      title: Text(
        'e-Crohn',
        style: TextStyle(
          fontSize: 24.0,
          color: Colors.blue[50],
        ),
        textAlign: TextAlign.left,
      ),
      bottom: TabBar(
        // unselectedLabelColor: Colors.white,
        // labelColor: Colors.cyanAccent,
        isScrollable: false,
        tabs: choices.map((Choice choice) {
          return Tab(
            text: choice.title,
            icon: Icon(
              choice.icon,
              size: 30,
            ),
          );
        }).toList(),
      ),
    );

    final body = TabBarView(
      children: <Widget>[
        Icon(Icons.hourglass_empty),
        Icon(Icons.hourglass_full),
        RedFlagScore(),
      ],
    );

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: appBar,
        body: body,
        // floatingActionButton: FloatingActionButton(
        //   tooltip: 'Info',
        //   child: Icon(Icons.info),
        //   onPressed: null,
        // ),
      ),
    );
  }
}

class Choice {
  const Choice({this.title, this.icon});

  final IconData icon;
  final String title;
}

const List<Choice> choices = const <Choice>[
  const Choice(title: 'Info', icon: Icons.info_outline),
  const Choice(title: 'Red Flags', icon: Icons.flag),
  const Choice(title: 'Score', icon: Icons.find_in_page),
];
