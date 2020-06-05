import 'dart:ui';

import 'package:ecronh/models/question.dart';
import 'package:flutter/material.dart';

class RedFlags extends StatelessWidget {
  const RedFlags({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Text(
                    'Score Calculation',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              Table(
                defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                columnWidths: {
                  0: FractionColumnWidth(0.78),
                },
                border: TableBorder.all(
                  color: Colors.blue[200],
                  width: 1.0,
                ),
                children: <TableRow>[
                      TableRow(
                        decoration: BoxDecoration(
                          color: Colors.blue[600],
                        ),
                        children: <Widget>[
                          Center(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Item',
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                          Center(
                            child: Text(
                              'Coefficient',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 14.0,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ] +
                    questions
                        .map(
                          (question) => TableRow(
                            decoration: BoxDecoration(
                              color: question.order.isOdd
                                  ? Colors.blue[50]
                                  : Colors.white,
                            ),
                            children: <Widget>[
                              Container(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  question.title,
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(10),
                                child: Center(
                                  child: Text(
                                    '${question.coefficient}',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 18.0,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                        .toList(),
              ),
              SizedBox(
                height: 12,
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 16, horizontal: 12),
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(5),
                  ),
                  color: Colors.blueGrey[500],
                ),
                child: Text(
                  'The score ranges from 0 to 24 points. Score ≥ 08 is highly predictive of Crohn\'s disease',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: 24.0,
              ),
              Text(
                'Next tab to compute score',
                style: TextStyle(
                  color: Colors.grey,
                  fontStyle: FontStyle.italic,
                ),
              )
            ],
          ),
        ));
  }
}
