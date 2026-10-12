import 'package:flutter/material.dart';

class SummaryPage extends StatelessWidget {
  const SummaryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(251, 248, 255, 1),
      appBar: AppBar(
        elevation: 1,
        backgroundColor: const Color.fromRGBO(251, 248, 255, 0.85),
        leading: IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back)),
        title: Row(
          children: [
            Image.asset('assets/images/logo.jpg', scale: 3),
            const SizedBox(width: 10),
            const Text(
              'Quiz Summary',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight(700)),
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

    );
  }
}
