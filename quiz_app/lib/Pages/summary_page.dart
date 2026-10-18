import 'package:flutter/material.dart';
import 'package:quiz_app/Pages/home_page.dart';
import 'package:quiz_app/Pages/quiz_page.dart';
import 'package:quiz_app/Pages/review_page.dart';

class SummaryPage extends StatefulWidget {
  const SummaryPage({super.key, required this.grade, required this.userAnswer});
  final int grade;
  final List<String> userAnswer;

  @override
  State<SummaryPage> createState() => _SummaryPageState();
}

class _SummaryPageState extends State<SummaryPage>
    with TickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        controller.forward();
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(251, 248, 255, 1),
      appBar: AppBar(
        elevation: 1,
        backgroundColor: const Color.fromRGBO(251, 248, 255, 0.85),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
        title: Row(
          children: [
            Image.asset('assets/images/logo.jpg', width: 32, height: 32),
            const SizedBox(width: 10),
            const Text(
              'Quiz Summary',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight(600)),
            ),
          ],
        ),
        actions: [
          CircleAvatar(
            backgroundColor: const Color.fromRGBO(65, 67, 213, 1),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.person_outlined,
                color: Color.fromRGBO(255, 255, 255, 1),
              ),
            ),
          ),
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SafeArea(
          child: ListView(
            children: [
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(255, 255, 255, 1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(25.0),
                          child: const CircleAvatar(
                            radius: 32,
                            backgroundColor: Color.fromRGBO(130, 249, 190, 1),
                            child: Icon(
                              Icons.emoji_events,
                              color: Color.fromRGBO(0, 108, 71, 1),
                              size: 30,
                            ),
                          ),
                        ),
                        Positioned(
                          right: 15,
                          top: 15,
                          child: const CircleAvatar(
                            radius: 15,
                            backgroundColor: Color.fromRGBO(230, 230, 255, 1),
                            child: Icon(
                              Icons.arrow_back_ios_new,
                              color: Color.fromRGBO(65, 67, 213, 1),
                              size: 20,
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 20,
                          left: 15,
                          child: const CircleAvatar(
                            backgroundColor: Color.fromRGBO(255, 217, 220, 1),
                            radius: 12,
                            child: Icon(
                              Icons.star,
                              color: Color.fromRGBO(164, 42, 69, 1),
                              size: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Text(
                      'Layout Quiz Completed!',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight(700),
                      ),
                    ),
                    const Text(
                      "Great job! Here's how you did.",
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight(400),
                      ),
                    ),
                    const SizedBox(height: 40),
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        const SizedBox(
                          width: 100,
                          height: 100,
                          child: CircularProgressIndicator(
                            value: 1,
                            color: Color.fromRGBO(237, 236, 255, 1),
                            strokeWidth: 10,
                          ),
                        ),
                        SizedBox(
                          width: 100,
                          height: 100,
                          child: TweenAnimationBuilder(
                            tween: Tween<double>(
                              begin: 0,
                              end: widget.grade / 5,
                            ),
                            duration: Duration(seconds: 1),
                            builder: (context, value, child) {
                              return CircularProgressIndicator(
                                value: value,
                                color: Color.fromRGBO(0, 108, 71, 1),
                                strokeWidth: 10,
                                strokeCap: StrokeCap.round,
                              );
                            },
                          ),
                        ),
                        Positioned(
                          top: 20,
                          child: Text(
                            '${widget.grade}/5',
                            style: TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight(1000),
                              letterSpacing: 5,
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 20,
                          child: TweenAnimationBuilder(
                            tween: Tween<double>(
                              begin: 0,
                              end: (widget.grade / 5) * 100,
                            ),
                            duration: Duration(seconds: 1),
                            builder: (context, value, child) {
                              return Text(
                                '${value.toInt()} % score',
                                style: TextStyle(
                                  color: const Color.fromRGBO(0, 108, 71, 1),
                                  fontSize: 11,
                                  fontWeight: FontWeight(700),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),

                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  ReviewPage(userAnswer: widget.userAnswer),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(double.infinity, 50),
                          backgroundColor: const Color.fromRGBO(
                            128,
                            246,
                            187,
                            1,
                          ),
                        ),
                        child: const Text(
                          'Review',
                          style: TextStyle(
                            color: Color.fromRGBO(0, 0, 0, 1),
                            fontSize: 17,
                            fontWeight: FontWeight(700),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(255, 255, 255, 1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Row(
                      children: [
                        summaryContainer(
                          icon: Icons.check,
                          number: widget.grade.toString(),
                          name: 'True',
                          color: const Color.fromRGBO(130, 249, 190, 1),
                          iconColor: const Color.fromRGBO(0, 108, 71, 1),
                        ),
                        const SizedBox(width: 10),
                        summaryContainer(
                          icon: Icons.close,
                          number: (5 - widget.grade).toString(),
                          name: 'Wrong',
                          color: const Color.fromRGBO(255, 218, 214, 1),
                          iconColor: const Color.fromRGBO(186, 26, 26, 1),
                        ),
                        const SizedBox(width: 10),
                        summaryContainer(
                          icon: Icons.timer_outlined,
                          number: '40S',
                          name: 'True',
                          color: const Color.fromRGBO(130, 249, 190, 1),
                          iconColor: const Color.fromRGBO(0, 108, 71, 1),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => QuizPage()),
                  );
                },
                label: const Text(
                  'Try Again',
                  style: TextStyle(color: Color.fromRGBO(255, 255, 255, 1)),
                ),
                icon: const Icon(
                  Icons.refresh,
                  color: Color.fromRGBO(255, 255, 255, 1),
                ),
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 50),
                  backgroundColor: const Color.fromRGBO(65, 67, 213, 1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),

              const SizedBox(height: 10),
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => HomeScreen()),
                  );
                },
                label: const Text(
                  'Back to Home',
                  style: TextStyle(color: Color.fromRGBO(0, 0, 0, 1)),
                ),
                icon: const Icon(
                  Icons.home_outlined,
                  color: Color.fromRGBO(0, 0, 0, 1),
                ),
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 50),
                  backgroundColor: const Color.fromRGBO(230, 230, 255, 1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget summaryContainer({
  required IconData icon,
  required String number,
  required String name,
  required Color color,
  required Color iconColor,
}) {
  return Expanded(
    child: Container(
      padding: EdgeInsets.symmetric(vertical: 15),
      decoration: BoxDecoration(
        color: const Color.fromRGBO(244, 242, 255, 1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          CircleAvatar(
            backgroundColor: color,
            radius: 14,
            child: Icon(icon, color: iconColor, size: 18),
          ),
          Text(
            number.toString(),
            style: TextStyle(fontSize: 18, fontWeight: FontWeight(600)),
          ),
          Text(
            name,
            style: TextStyle(fontSize: 11, fontWeight: FontWeight(700)),
          ),
        ],
      ),
    ),
  );
}
