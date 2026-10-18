import 'package:flutter/material.dart';
import 'summary_page.dart';
import 'package:quiz_app/resources/questions.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({super.key, required this.timer});
  final Stopwatch timer;
  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  bool isSelected = false;
  List<String> userAnswer = [];
  List<int> answerIndex = [];
  int grade = 0;
  List<String> selectedChar = ["A", "B", "C", "D"];
  int currentQuestion = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
        ),
        title: Row(
          children: [
            Image.asset('assets/images/logo.jpg', width: 32, height: 32),
            Text(
              "Active Quiz",
              style: TextStyle(
                color: Color(0xff171A30),
                fontWeight: FontWeight.w600,
                fontSize: 18,
                fontFamily: "Plus Jakarta Sans",
              ),
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: CircleAvatar(
              backgroundColor: Color(0xff4143D5),
              child: IconButton(
                onPressed: () {},
                icon: Icon((Icons.person_outline), color: Color(0xffFFFFFF)),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: ClampingScrollPhysics(),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Icon(Icons.timer, color: Color(0xff4143D5), size: 20),
                      Text(
                        "Question ${currentQuestion + 1} of 5",
                        style: TextStyle(
                          color: Color(0xff171A30),
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                          fontFamily: "Plus Jakarta Sans",
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 15.0),
                  child: Container(
                    padding: EdgeInsets.only(
                      left: 8,
                      right: 8,
                      top: 3,
                      bottom: 3,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Color(0xffE6E6FF),
                    ),
                    child: Text(
                      "FLUTTER LAYOUT",
                      style: TextStyle(
                        color: Color(0xff4143D5),
                        fontWeight: FontWeight.w700,
                        fontSize: 11,
                        fontFamily: "Plus Jakarta Sans",
                      ),
                    ),
                  ),
                ),
              ],
            ),
            TweenAnimationBuilder(
              tween: Tween<double>(begin: 0, end: (currentQuestion + 1) / 5),
              duration: Duration(milliseconds: 500),
              builder: (context, value, child) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: LinearProgressIndicator(
                    minHeight: 8,
                    color: Color(0xff4143D5),
                    backgroundColor: Color(0xffE6E6FF),
                    borderRadius: BorderRadius.circular(15),
                    value: value,
                  ),
                );
              },
            ),
            Container(
              width: double.infinity,
              height: 300,
              margin: EdgeInsets.all(15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Color(0xffFFFFFF),
              ),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 12.0),
                        child: Row(
                          children: [
                            Text(
                              "•",
                              style: TextStyle(
                                color: Color(0xff006C47),
                                fontSize: 20,
                              ),
                            ),
                            Text(
                              "SINGLE CHOICE",
                              style: TextStyle(
                                color: Color(0xff464555),
                                fontWeight: FontWeight.w700,
                                fontSize: 11,
                                fontFamily: "Plus Jakarta Sans",
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 12.0),
                        child: Container(
                          padding: EdgeInsets.only(
                            left: 8,
                            right: 8,
                            top: 3,
                            bottom: 3,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Color(0xffE6E6FF),
                          ),
                          child: Text(
                            " 100 XP",
                            style: TextStyle(
                              color: Color(0xff464555),
                              fontWeight: FontWeight.w700,
                              fontSize: 11,
                              fontFamily: "Plus Jakarta Sans",
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Text(
                    questions[currentQuestion].questionText,
                    style: TextStyle(
                      color: Color(0xff171A30),
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                      fontFamily: "Plus Jakarta Sans",
                    ),
                  ),
                  SizedBox(height: 10),
                  Image.asset(
                    questions[currentQuestion].image,
                    width: double.infinity,
                    height: 160,
                  ),
                ],
              ),
            ),
            ListView.builder(
              itemBuilder: (context, index) {
                return Container(
                  width: double.infinity,
                  height: 50,
                  margin: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Color(0xffFFFFFF),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CircleAvatar(
                              backgroundColor: Color(0xffEDECFF),
                              child: Text(
                                selectedChar[index],
                                style: TextStyle(
                                  color: Color(0xff4143D5),
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                  fontFamily: "Plus Jakarta Sans",
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 12.0),
                            child: Text(
                              questions[currentQuestion].options[index],
                              style: TextStyle(
                                color: Color(0xff171A30),
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                                fontFamily: "Plus Jakarta Sans",
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 12.0),
                        child: IconButton(
                          icon:
                              userAnswer.length > currentQuestion &&
                                  userAnswer[currentQuestion] ==
                                      questions[currentQuestion].options[index]
                              ? Icon(Icons.check_circle_sharp)
                              : Icon(Icons.check_circle_outline_sharp),
                          color: Color(0xff4143D5),
                          onPressed: () {
                            setState(() {
                              if (userAnswer.length > currentQuestion) {
                                userAnswer[currentQuestion] =
                                    questions[currentQuestion].options[index];
                              } else {
                                userAnswer.add(
                                  questions[currentQuestion].options[index],
                                );
                              }
                            });
                            if (userAnswer[currentQuestion] ==
                                questions[currentQuestion].answer) {
                              grade++;
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                );
              },
              itemCount: 4,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 15.0),
              child: SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xff4143D5),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      if (userAnswer.length <= currentQuestion) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              "Please select an answer before proceeding.",
                            ),
                          ),
                        );
                      } else if (currentQuestion < questions.length - 1) {
                        currentQuestion++;
                      } else if (currentQuestion == questions.length - 1) {
                        widget.timer.stop();
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SummaryPage(
                              grade: grade,
                              userAnswer: userAnswer,
                              timer: widget.timer,
                            ),
                          ),
                        );
                      }
                    });
                  },
                  child: Text(
                    currentQuestion == questions.length - 1
                        ? "Finish Quiz"
                        : "Next Question",
                    style: TextStyle(
                      color: Color(0xffFFFFFF),
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      fontFamily: "Plus Jakarta Sans",
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
