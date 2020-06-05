class Question {
  Question(
      {this.order = 0, this.title, this.coefficient, this.checked = false});

  final title;
  final coefficient;
  final order;
  bool checked;

  static double score(List<Question> questions) {
    var value = 0.0;

    questions.forEach((question) {
      if (question.checked) {
        value += question.coefficient;
      }
    });

    return value;
  }
}

List<Question> questions = <Question>[
  Question(
    order: 1,
    title:
        'Non-healing or complex perianal fistula or abscess or perianal lesions (apart from haemorrhoids)',
    coefficient: 5,
  ),
  Question(
    order: 2,
    title: 'First-degree relative with confirmed inflammatory bowel disease',
    coefficient: 4,
  ),
  Question(
    order: 3,
    title: 'Weight loss (5% of usual body weight) in the last 3 months',
    coefficient: 3,
  ),
  Question(
    order: 4,
    title: 'Chronic abdominal pain (>3 months)',
    coefficient: 3,
  ),
  Question(
    order: 5,
    title: 'Nocturnal diarrhoea',
    coefficient: 3,
  ),
  Question(
    order: 6,
    title: 'Mild fever in the last 3 months',
    coefficient: 2,
  ),
  Question(
    order: 7,
    title:
        'No abdominal pain 30–45min after meals, predominantly after vegetables',
    coefficient: 2,
  ),
  Question(
    order: 8,
    title: 'No rectal urgency',
    coefficient: 2,
  ),
];
