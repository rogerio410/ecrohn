import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _teameStyle = TextStyle(
      color: Colors.white,
      fontSize: 18,
      fontWeight: FontWeight.w400,
    );
    return Container(
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
          Container(
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              color: Colors.blue[300],
            ),
            // color: Colors.blue[50],
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    SizedBox(
                      height: 12,
                    ),
                    Text(
                      'Researcher',
                      style: _teameStyle,
                    ),
                    Text(
                      'Thaline Alves Elias Veloso',
                      style: _teameStyle,
                    ),
                  ],
                ),
                SizedBox(
                  height: 12,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text(
                      'Advisor   ',
                      style: _teameStyle,
                    ),
                    Text(
                      'Fabrício Ibiapina Tapety',
                      style: _teameStyle,
                    ),
                  ],
                ),
                SizedBox(
                  height: 12,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 24,
          ),
          Image.asset(
            'assets/images/novafapi.png',
            height: 64,
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
    );
  }
}
