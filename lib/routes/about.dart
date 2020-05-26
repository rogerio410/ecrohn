import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      elevation: 0.0,
      title: Text(
        'About e-Crohn App',
        style: TextStyle(
          fontSize: 22.0,
          color: Colors.blue[50],
        ),
        textAlign: TextAlign.left,
      ),
    );

    return Scaffold(
      appBar: appBar,
      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Icon(
                Icons.smartphone,
                size: 120,
                color: Colors.blue[700],
              ),
            ),
            Text(
              'App e-Crohn',
              style: TextStyle(
                fontSize: 24,
                color: Colors.blueAccent,
              ),
            ),
            Text(
              'Red Flags Index for Suspected Crohn’s Disease',
              style: TextStyle(
                fontSize: 12,
                fontStyle: FontStyle.italic,
              ),
            ),
            SizedBox(
              height: 24,
            ),
            Card(
              child: Container(
                padding: EdgeInsets.all(15),
                height: 100,
                color: Colors.blue[50],
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Text('Pesquisadora'),
                        Text('Thaline Elias'),
                      ],
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 24,
            ),
            Image.asset(
              'assets/images/novafapi.png',
              height: 40,
            ),
            SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  Icons.school,
                  size: 25,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  '2020',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
