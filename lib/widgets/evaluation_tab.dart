import 'package:flutter/material.dart';
import 'package:ecronh/models/question.dart';

class EvaluationRedFlagScore extends StatefulWidget {
  EvaluationRedFlagScore({Key key}) : super(key: key);

  @override
  EvaluationRedFlagScoreState createState() => EvaluationRedFlagScoreState();
}

class EvaluationRedFlagScoreState extends State<EvaluationRedFlagScore> {
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
                            var _msg = "Weight lost: $p%";
                            if (percentual < 5) {
                              _msg = "Weight lost ($p%) less then 5%";
                              setState(() {
                                question.checked = false;
                              });
                            }

                            final _snack = SnackBar(
                              duration: Duration(seconds: 6),
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
                          style: TextStyle(
                            fontSize: 18.0,
                          ),
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
                'Tap to close',
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
  bool _startWValid = true;
  bool _endWValid = true;

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
              labelText: 'Starting weight (3 months ago)',
              hintText: 'eg. 80',
              errorText: _startWValid ? null : 'Required'),
        ),
        TextField(
          autofocus: true,
          controller: endWeightController,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            labelText: 'Current weight',
            hintText: 'eg. 70',
            errorText: _endWValid ? null : 'Required',
          ),
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
                setState(() {
                  startWeightController.text.isEmpty
                      ? _startWValid = false
                      : _startWValid = true;

                  endWeightController.text.isEmpty
                      ? _endWValid = false
                      : _endWValid = true;

                  if (_startWValid && _endWValid) {
                    var startW = double.parse(startWeightController.text);
                    var endW = double.parse(endWeightController.text);
                    final lostPercent = (startW - endW) / startW;
                    Navigator.of(context).pop(lostPercent * 100);
                  }
                });
              },
              child: Text('Ok'),
            ),
          ],
        )
      ],
    );
  }
}
