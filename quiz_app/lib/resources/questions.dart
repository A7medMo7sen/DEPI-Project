import 'package:quiz_app/model/question.dart';

List<Question> questions = [
  Question(
    questiontext: "Which widget is used to arrange children vertically?",
    image: "assets/images/1.png",
    options: ["Row", "Column", "Stack", "Container"],
    answer: "Column",
  ),
  Question(
    questiontext: "Which widget allows the content to scroll vertically?",
    image: "assets/images/2.png",
    options: ["Center", "Expanded", "SingleChildScrollView", "AppBar"],
    answer: "SingleChildScrollView",
  ),
  Question(
    questiontext: "Which widget arranges children horizontally?",
    image: "assets/images/3.png",
    options: ["Row", "Column", "ListView", "Scaffold"],
    answer: "Row",
  ),
  Question(
    questiontext:
        "Which widget type supports changing its state with setState()?",
    image: "assets/images/4.png",
    options: ["StatefulWidget", "StatelessWidget", "Stack", "MaterialApp"],
    answer: "StatefulWidget",
  ),
  Question(
    questiontext: "Which widget efficiently builds a scrollable list?",
    image: "assets/images/5.png",
    options: ["Text", "SizedBox", "ListView.builder", "CircleAvatar"],
    answer: "ListView.builder",
  ),
];
