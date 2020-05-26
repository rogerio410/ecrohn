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
          fontSize: 26.0,
          color: Colors.white,
          fontFamily: 'Helvetica Hune',
        ),
        textAlign: TextAlign.left,
      ),
      actions: <Widget>[
        IconButton(
          padding: EdgeInsets.only(
            right: 12,
          ),
          icon: Icon(
            Icons.info_outline,
            size: 28,
          ),
          onPressed: () {
            Navigator.pushNamed(context, '/about');
          },
        )
      ],
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
  const Choice(title: 'Presentation', icon: Icons.book),
  const Choice(title: 'Red Flags', icon: Icons.flag),
  const Choice(title: 'Evaluation', icon: Icons.find_in_page),
];
