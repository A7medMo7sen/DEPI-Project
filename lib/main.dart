import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const QuizScreen(),
    );
  }
}

class QuizScreen extends StatelessWidget {
  const QuizScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F7FF),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF9F7FF),
        elevation: 0,
        leading: const Icon(Icons.arrow_back),
        title: const Row(
          children: [
            Icon(
              Icons.quiz,
              color: Color(0xFF6254E8),
            ),
            SizedBox(width: 8),
            Text(
              'Active Quiz',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        actions: const [
          CircleAvatar(
            radius: 16,
            backgroundColor: Color(0xFF6254E8),
            child: Icon(
              Icons.person_outline,
              color: Colors.white,
              size: 20,
            ),
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
              const Row(
                children: [
                  Icon(
                    Icons.bolt,
                    color: Color(0xFF6254E8),
                    size: 20,
                  ),
                  SizedBox(width: 6),
                  Expanded(
                    child: Text(
                      'Layout Foundations',
                      style: TextStyle(fontSize: 13),
                    ),
                  ),
                  Text(
                    'QUESTION 1 OF 5',
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
                child: const LinearProgressIndicator(
                  value: 0.2,
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
                        const Text(
                          '⏱ +10 pts',
                          style: TextStyle(fontSize: 11),
                        ),
                      ],
                    ),

                    const SizedBox(height: 14),

                    const Text(
                      'Which widget displays a string\n'
                      'of text in a Flutter interface?',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 16),

                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: const Color(0xFF2D2B42),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'lib/main.dart',
                                style: TextStyle(
                                  color: Colors.white54,
                                  fontSize: 10,
                                ),
                              ),
                              Text(
                                'StatelessWidget',
                                style: TextStyle(
                                  color: Colors.tealAccent,
                                  fontSize: 10,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Text(
                            "const ???('Welcome to Flutter!');",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 11,
                              fontFamily: 'monospace',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 18),

              answerBox(
                letter: 'A',
                title: 'Container',
                subtitle: 'Your submission',
                backgroundColor: const Color(0xFFF8E7EF),
                letterColor: const Color(0xFFA52C50),
                textColor: const Color(0xFFA52C50),
                icon: Icons.cancel,
              ),

              const SizedBox(height: 10),

              answerBox(
                letter: 'B',
                title: 'Text',
                subtitle: 'CORRECT ANSWER',
                backgroundColor: const Color(0xFFE0F5ED),
                letterColor: const Color(0xFF087B59),
                textColor: const Color(0xFF087B59),
                icon: Icons.check_circle,
              ),

              const SizedBox(height: 10),

              answerBox(
                letter: 'C',
                title: 'Column',
                subtitle: '',
                backgroundColor: const Color(0xFFFCFAFF),
                letterColor: const Color(0xFFEEEBF5),
                textColor: Colors.grey,
                icon: Icons.radio_button_unchecked,
              ),

              const SizedBox(height: 10),

              answerBox(
                letter: 'D',
                title: 'Scaffold',
                subtitle: '',
                backgroundColor: const Color(0xFFFCFAFF),
                letterColor: const Color(0xFFEEEBF5),
                textColor: Colors.grey,
                icon: Icons.radio_button_unchecked,
              ),

              const SizedBox(height: 24),

              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: const Border(
                    left: BorderSide(
                      color: Color(0xFFA52C50),
                      width: 4,
                    ),
                  ),
                ),
                child: const Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.info_outline,
                      color: Color(0xFFA52C50),
                      size: 20,
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Concept Clarification',
                            style: TextStyle(
                              color: Color(0xFFA52C50),
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                          SizedBox(height: 6),
                          Text(
                            'The Text widget shows a string with a '
                            'single style. Container handles layout, '
                            'decoration, and sizing for a child.',
                            style: TextStyle(
                              color: Colors.black54,
                              fontSize: 12,
                              height: 1.5,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                          'Next question will be added later.',
                        ),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF6254E8),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Next Question'),
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
                    color: subtitle.isEmpty
                        ? Colors.grey
                        : Colors.black87,
                  ),
                ),
                if (subtitle.isNotEmpty)
                  Text(
                    subtitle,
                    style: TextStyle(
                      color: textColor,
                      fontSize: 10,
                    ),
                  ),
              ],
            ),
          ),
          Icon(
            icon,
            color: textColor,
            size: 22,
          ),
        ],
      ),
    );
  }
}