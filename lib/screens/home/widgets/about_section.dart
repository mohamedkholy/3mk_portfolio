import 'package:flutter/material.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(32),
      child: Column(
        children: [
          Text(
            'About Me',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.grey[800],
            ),
          ),
          SizedBox(height: 24),
          Text(
            'I\'m a passionate Flutter developer with expertise in creating beautiful, responsive mobile applications. With a keen eye for design and a love for clean code, I bring ideas to life through innovative mobile solutions.',
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[600],
              height: 1.6,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
