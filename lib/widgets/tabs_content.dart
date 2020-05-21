import 'dart:ffi';

import 'package:flutter/material.dart';

class RedFlagScore extends StatefulWidget {
  RedFlagScore({Key key}) : super(key: key);

  @override
  RedFlagScoreState createState() => RedFlagScoreState();
}

class RedFlagScoreState extends State<RedFlagScore> {
  var _resultColor;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(8.0),
        // color: Colors.pink[50],
        child: Center(
          child: Column(
            children: <Widget>[
              // Text(
              //   'Red Flag Score Questions',
              //   style: TextStyle(
              //     color: Colors.red,
              //     fontSize: 18,
              //   ),
              // ),
              SizedBox(
                height: 6,
              ),
              Column(
                children: questions.map((question) {
                  return CheckboxListTile(
                    value: question.checked,
                    onChanged: (value) {
                      setState(() {
                        question.checked = value;
                      });
                    },
                    title: Text(
                      question.title,
                      style: TextStyle(
                        fontSize: 15.0,
                      ),
                    ),
                  );
                }).toList(),
              ),
              SizedBox(
                height: 6,
              ),
              SizedBox(
                width: double.infinity,
                child: RaisedButton(
                  onPressed: () {
                    var score = Question.score(questions);
                    _resultColor = score >= 8 ? Colors.red : Colors.green;
                    showBottomSheet(
                        context: context,
                        builder: (context) {
                          return GestureDetector(
                            onTap: () => Navigator.of(context).pop(),
                            child: Container(
                              height: 400,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: _resultColor,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15)),
                                  boxShadow: [
                                    BoxShadow(
                                        blurRadius: 10,
                                        color: Colors.grey[300],
                                        spreadRadius: 5)
                                  ]),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    'Red Flag Score',
                                    style: TextStyle(
                                        fontSize: 30, color: Colors.white),
                                  ),
                                  Text(
                                    score.toString(),
                                    style: TextStyle(
                                      fontSize: 50,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        });
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.check_circle,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: Text(
                          'Compute Score',
                          style: TextStyle(fontSize: 20.0),
                        ),
                      ),
                    ],
                  ),
                  textColor: Colors.white,
                  color: Colors.blue,
                  padding: EdgeInsets.all(12),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Question {
  Question({this.title, this.weight, this.checked = false});

  final title;
  final weight;
  bool checked;

  static double score(List<Question> questions) {
    var value = 0.0;

    questions.forEach((question) {
      if (question.checked) {
        value += question.weight;
      }
    });

    return value;
  }
}

List<Question> questions = <Question>[
  Question(
    title:
        'Non-healing or complex perianal fistula or abscess or perianal lesions (apart from haemorrhoids)',
    weight: 5,
    checked: true,
  ),
  Question(
    title: 'First-degree relative with confirmed inflammatory bowel disease',
    weight: 4,
  ),
  Question(
    title: 'Weight loss (5% of usual body weight) in the last 3 months',
    weight: 3,
  ),
  Question(
    title: 'Chronic abdominal pain (>3 months)',
    weight: 3,
  ),
  Question(
    title: 'Nocturnal diarrhoea',
    weight: 3,
  ),
  Question(
    title: 'Mild fever in the last 3 months',
    weight: 2,
  ),
  Question(
    title:
        'No abdominal pain 30–45min after meals, predominantly after vegetables',
    weight: 2,
  ),
  Question(
    title: 'No rectal urgency',
    weight: 2,
  ),
];
