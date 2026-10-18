import 'package:flutter/material.dart';
import 'package:quiz_app/Pages/quiz_page.dart';

const Color primaryColor = Color(0xFF5B5CEB);
const Color backgroundColor = Color(0xFFF8F7FF);
const Color lightPurple = Color(0xFFF1EFFF);
const Color darkColor = Color(0xFF202038);
const Color greenColor = Color(0xFF00A878);

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();

  static Widget _smallIcon(IconData icon, Color color) {
    return Container(
      width: 44,
      height: 44,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.10),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Icon(icon, color: color, size: 25),
    );
  }
}

class _HomeScreenState extends State<HomeScreen> {
  final timer =Stopwatch() ;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: lightPurple,
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Row(
                  children: [
                    Container(
                      width: 54,
                      height: 54,
                      decoration: BoxDecoration(
                        color: primaryColor,
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: const Icon(
                        Icons.lightbulb_outline,
                        color: Colors.white,
                        size: 32,
                      ),
                    ),
                    const SizedBox(width: 12),
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                'QuizUp',
                                style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  color: darkColor,
                                ),
                              ),
                              SizedBox(width: 8),
                              Text(
                                'v2.4',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: primaryColor,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 4),
                          Text(
                            'Flutter & Android Hub',
                            style: TextStyle(
                              fontSize: 14,
                              color: Color(0xFF656579),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Icon(Icons.local_fire_department, color: greenColor),
                    const SizedBox(width: 4),
                    const Text(
                      'Day 3',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: darkColor,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 28,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(26),
                  gradient: const LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [
                      Color(0xFFF1F0FF),
                      Colors.white,
                      Color(0xFFF7F5FF),
                    ],
                  ),
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 165,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            width: 142,
                            height: 142,
                            decoration: const BoxDecoration(
                              color: Color(0xFFEEECFF),
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.emoji_events,
                              color: primaryColor,
                              size: 70,
                            ),
                          ),
                          Positioned(
                            top: 8,
                            right: 65,
                            child: HomeScreen._smallIcon(
                              Icons.bolt,
                              const Color(0xFFB52D50),
                            ),
                          ),
                          Positioned(
                            bottom: 8,
                            left: 58,
                            child: HomeScreen._smallIcon(
                              Icons.settings,
                              const Color(0xFF16845D),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Build Your\nFlutter Skills',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 34,
                        height: 1.3,
                        fontWeight: FontWeight.bold,
                        color: darkColor,
                      ),
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      'Practice layout basics, one question at a time.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,
                        height: 1.5,
                        color: Color(0xFF777586),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                        color: lightPurple,
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.grid_view_rounded,
                            color: primaryColor,
                            size: 19,
                          ),
                          SizedBox(width: 8),
                          Text(
                            'Topic: Flutter Layout',
                            style: TextStyle(
                              color: primaryColor,
                              fontWeight: FontWeight.w600,
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: StatCard(
                        icon: Icons.help_outline,
                        number: '5',
                        title: 'Questions',
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: StatCard(
                        icon: Icons.checklist,
                        number: 'Single',
                        title: 'Choice Format',
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: StatCard(
                        icon: Icons.star,
                        number: 'Beginner',
                        title: 'Level',
                        isGreen: true,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              Container(
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  color: lightPurple,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    Container(
                      width: 52,
                      height: 52,
                      decoration: BoxDecoration(
                        color: const Color(0xFF83F0C2),
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: const Icon(
                        Icons.verified_user_outlined,
                        color: Color(0xFF075D47),
                        size: 28,
                      ),
                    ),
                    const SizedBox(width: 14),
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Practical Layout Tips',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: darkColor,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            'Earn badges and build your layout skills with daily practice',
                            style: TextStyle(
                              fontSize: 14,
                              height: 1.4,
                              color: Color(0xFF656579),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                height: 72,
                child: ElevatedButton(
                  onPressed: () {
                    timer.reset();
                    timer.start();
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>  QuizPage(timer:timer)),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryColor,
                    foregroundColor: Colors.white,
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Start Quiz',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(width: 12),
                      Icon(Icons.arrow_forward, size: 24),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 14),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.access_time, size: 18, color: Color(0xFF656579)),
                  SizedBox(width: 8),
                  Flexible(
                    child: Text(
                      'Takes about 2–3 minutes • 100% Free',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF656579),
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class StatCard extends StatelessWidget {
  final IconData icon;
  final String number;
  final String title;
  final bool isGreen;
  const StatCard({
    super.key,
    required this.icon,
    required this.number,
    required this.title,
    this.isGreen = false,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(minHeight: 162),
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 14),
      decoration: BoxDecoration(
        color: lightPurple,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: isGreen
                  ? const Color(0xFF83F0C2)
                  : const Color(0xFFE1DEFF),
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon,
              color: isGreen ? const Color(0xFF087451) : primaryColor,
              size: 25,
            ),
          ),
          const SizedBox(height: 12),
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              number,
              style: TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.w600,
                color: isGreen ? const Color(0xFF087451) : darkColor,
              ),
            ),
          ),
          const SizedBox(height: 2),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 13, color: Color(0xFF555466)),
          ),
        ],
      ),
    );
  }
}
