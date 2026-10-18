import 'package:flutter/material.dart';
import 'package:quiz_app/resources/questions.dart';

class ReviewPage extends StatefulWidget {
  const ReviewPage({super.key, required this.userAnswer});
  final List<String> userAnswer;

  @override
  State<ReviewPage> createState() => _ReviewPageState();
}

class _ReviewPageState extends State<ReviewPage> {
  var currentQuestion = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F7FF),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF9F7FF),
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
        title: const Row(
          children: [
            Icon(Icons.quiz, color: Color(0xFF6254E8)),
            SizedBox(width: 8),
            Text(
              'Active Quiz',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        actions: const [
          CircleAvatar(
            radius: 16,
            backgroundColor: Color(0xFF6254E8),
            child: Icon(Icons.person_outline, color: Colors.white, size: 20),
          ),
          SizedBox(width: 16),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(Icons.bolt, color: Color(0xFF6254E8), size: 20),
                  SizedBox(width: 6),
                  Expanded(
                    child: Text(
                      'Layout Foundations',
                      style: TextStyle(fontSize: 13),
                    ),
                  ),
                  Text(
                    'QUESTION ${currentQuestion + 1} OF 5',
                    style: TextStyle(
                      color: Color(0xFF6254E8),
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 10),

              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: LinearProgressIndicator(
                  value: (currentQuestion + 1) / 5,
                  minHeight: 5,
                  backgroundColor: Color(0xFFE5DFFB),
                  color: Color(0xFF6254E8),
                ),
              ),

              const SizedBox(height: 24),

              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xFFEDE7FF),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: const Text(
                            'Flutter Layout',
                            style: TextStyle(
                              color: Color(0xFF6254E8),
                              fontSize: 11,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const Text('⏱ +10 pts', style: TextStyle(fontSize: 11)),
                      ],
                    ),

                    const SizedBox(height: 14),

                    Text(
                      questions[currentQuestion].questiontext,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 16),

                    Image.asset(
                      questions[currentQuestion].image,
                      width: double.infinity,
                      height: 160,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                height: 280,
                child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: questions[1].options.length,
                  itemBuilder: (context, index) {
                    final question = questions[currentQuestion];
                    final List<String> char = ['A', 'B', 'C', 'D'];
                    final rightAnswer =
                        question.options[index] ==
                                widget.userAnswer[currentQuestion] &&
                            widget.userAnswer[currentQuestion] ==
                                question.answer ||
                        question.answer == question.options[index];

                    final wrongAnswer =
                        question.options[index] ==
                            widget.userAnswer[currentQuestion] &&
                        widget.userAnswer[currentQuestion] != question.answer;
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: answerBox(
                        letter: char[index],
                        title: question.options[index],
                        subtitle: rightAnswer
                            ? 'Correct Answer'
                            : wrongAnswer
                            ? 'Your submission'
                            : '',
                        backgroundColor: rightAnswer
                            ? Color(0xFFE0F5ED)
                            : wrongAnswer
                            ? Color(0xFFF8E7EF)
                            : Color(0xFFFCFAFF),
                        letterColor: rightAnswer
                            ? Color(0xFF087B59)
                            : wrongAnswer
                            ? Color(0xFFA52C50)
                            : Color(0xFFEEEBF5),
                        textColor: rightAnswer
                            ? Color(0xFF087B59)
                            : wrongAnswer
                            ? Color(0xFFA52C50)
                            : Colors.grey,
                        icon: rightAnswer
                            ? Icons.check_circle
                            : wrongAnswer
                            ? Icons.cancel
                            : Icons.radio_button_unchecked,
                      ),
                    );
                  },
                ),
              ),

              const SizedBox(height: 14),

              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      if (widget.userAnswer.length <= currentQuestion) {
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
                        Navigator.pop(context);
                      }
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF6254E8),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        currentQuestion == questions.length - 1
                            ? "Finish Review"
                            : "Next Question",
                      ),
                      SizedBox(width: 8),
                      Icon(Icons.arrow_forward, size: 18),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget answerBox({
    required String letter,
    required String title,
    required String subtitle,
    required Color backgroundColor,
    required Color letterColor,
    required Color textColor,
    required IconData icon,
  }) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Container(
            width: 34,
            height: 34,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: letterColor,
              borderRadius: BorderRadius.circular(7),
            ),
            child: Text(
              letter,
              style: TextStyle(
                color: subtitle.isEmpty ? Colors.grey : Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 15,
                    color: subtitle.isEmpty ? Colors.grey : Colors.black87,
                  ),
                ),
                if (subtitle.isNotEmpty)
                  Text(
                    subtitle,
                    style: TextStyle(color: textColor, fontSize: 10),
                  ),
              ],
            ),
          ),
          Icon(icon, color: textColor, size: 22),
        ],
      ),
    );
  }
}
