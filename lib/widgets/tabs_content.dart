import 'package:flutter/material.dart';

class RedFlagScore extends StatefulWidget {
  RedFlagScore({Key key}) : super(key: key);

  @override
  RedFlagScoreState createState() => RedFlagScoreState();
}

class RedFlagScoreState extends State<RedFlagScore> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(8.0),
        // color: Colors.pink[50],
        child: Center(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 0,
              ),
              Column(
                children: questions.map((question) {
                  return CheckboxListTile(
                    value: question.checked,
                    onChanged: (value) {
                      setState(() {
                        question.checked = value;

                        if (question.order == 3 && question.checked) {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) =>
                                WeightLossDialog(),
                          ).then((percentual) {
                            final p = percentual.toStringAsFixed(1);
                            if (percentual < 5) {
                              setState(() {
                                question.checked = false;
                              });
                            }
                            final _msg = "Weight lost: $p %";
                            final _snack = SnackBar(
                              duration: Duration(seconds: 10),
                              content: Text(_msg),
                              action:
                                  SnackBarAction(label: "Ok", onPressed: () {}),
                            );
                            Scaffold.of(context).showSnackBar(_snack);
                          });
                        }
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
                height: 12,
              ),
              SizedBox(
                width: double.infinity,
                child: RaisedButton(
                  onPressed: () {
                    var score = Question.score(questions);
                    showModalBottomSheet(
                      context: context,
                      builder: (context) =>
                          ScoreResultBottomSheet(score: score),
                    );
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

class ScoreResultBottomSheet extends StatefulWidget {
  final double score;

  ScoreResultBottomSheet({Key key, this.score}) : super(key: key);

  @override
  _ScoreResultBottomSheetState createState() =>
      _ScoreResultBottomSheetState(this.score);
}

class _ScoreResultBottomSheetState extends State<ScoreResultBottomSheet> {
  final score;

  _ScoreResultBottomSheetState(this.score);

  @override
  Widget build(BuildContext context) {
    var _resultColor = Colors.green;
    var _resultText =
        'No need to refer patient to Specialist for Futher Examinations';

    if (score >= 8) {
      _resultColor = Colors.red;
      _resultText =
          'Refer the patient to Complementary Examinations Specialist';
    }

    return FractionallySizedBox(
      heightFactor: 0.8,
      child: GestureDetector(
        onTap: () => Navigator.of(context).pop(),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
              color: _resultColor,
              borderRadius: BorderRadius.all(Radius.circular(15)),
              boxShadow: [
                BoxShadow(
                    blurRadius: 10, color: Colors.grey[300], spreadRadius: 5)
              ]),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Red Flag Score',
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: 12.0,
              ),
              Text(
                score.toString(),
                style: TextStyle(
                  fontSize: 60,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 12.0,
              ),
              FractionallySizedBox(
                widthFactor: 0.8,
                child: Container(
                  padding: EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 10,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.25),
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 6, color: _resultColor, spreadRadius: 3)
                    ],
                  ),
                  child: Text(
                    _resultText,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              SizedBox(
                height: 24.0,
              ),
              Text(
                'Tap do close',
                style: TextStyle(
                  color: Colors.white,
                  fontStyle: FontStyle.italic,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class WeightLossDialog extends StatefulWidget {
  WeightLossDialog({Key key}) : super(key: key);

  @override
  _WeightLossDialogState createState() => _WeightLossDialogState();
}

class _WeightLossDialogState extends State<WeightLossDialog> {
  final startWeightController = TextEditingController();
  final endWeightController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    startWeightController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      titlePadding: EdgeInsets.all(10),
      contentPadding: EdgeInsets.all(16),
      title: Text(
        'Check Weight Loss',
        textAlign: TextAlign.center,
      ),
      children: <Widget>[
        TextField(
          autofocus: true,
          controller: startWeightController,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
              labelText: 'Starting weight (3 months ago)', hintText: 'eg. 80'),
        ),
        TextField(
          autofocus: true,
          controller: endWeightController,
          keyboardType: TextInputType.number,
          decoration:
              InputDecoration(labelText: 'Current weight', hintText: 'eg. 70'),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            RaisedButton(
              onPressed: () {
                Navigator.of(context).pop(0.0);
              },
              child: Text('Cancel'),
            ),
            SizedBox(
              width: 12,
            ),
            RaisedButton(
              onPressed: () {
                var startW = double.parse(startWeightController.text);
                var endW = double.parse(endWeightController.text);
                final lostPercent = (startW - endW) / startW;
                Navigator.of(context).pop(lostPercent * 100);
              },
              child: Text('Ok'),
            ),
          ],
        )
      ],
    );
  }
}

class Question {
  Question({this.order = 0, this.title, this.weight, this.checked = false});

  final title;
  final weight;
  final order;
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
  ),
  Question(
    title: 'First-degree relative with confirmed inflammatory bowel disease',
    weight: 4,
  ),
  Question(
    order: 3,
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
