import 'package:ecronh/widgets/red_flag_tab.dart';
import 'package:flutter/material.dart';
import 'package:ecronh/widgets/evalution_tab.dart';
import 'package:ecronh/widgets/about.dart';

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
      // actions: <Widget>[
      //   IconButton(
      //     padding: EdgeInsets.only(
      //       right: 12,
      //     ),
      //     icon: Icon(
      //       Icons.info_outline,
      //       size: 28,
      //     ),
      //     onPressed: () {
      //       Navigator.pushNamed(context, '/about');
      //     },
      //   )
      // ],
      bottom: TabBar(
        // unselectedLabelColor: Colors.white,
        // labelColor: Colors.cyanAccent,
        isScrollable: true,
        labelStyle: TextStyle(
            // fontSize: 11,
            ),
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
        RedFlags(),
        EvalutionRedFlagScore(),
        AboutScreen(),
      ],
    );

    return DefaultTabController(
      length: 4,
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
  const Choice(title: 'About', icon: Icons.info_outline),
];
