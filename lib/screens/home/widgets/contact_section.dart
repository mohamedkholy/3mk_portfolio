import 'package:flutter/material.dart';
import 'package:my_portfolio/screens/home/widgets/contact_button.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(32),
      color: Colors.grey[800],
      child: Column(
        children: [
          Text(
            'Get In Touch',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 24),
          Text(
            'Let\'s work together on your next project!',
            style: TextStyle(fontSize: 16, color: Colors.grey[300]),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 32),
          Wrap(
            spacing: 20,
            runSpacing: 10,
            alignment: WrapAlignment.center,
            children: [
              ContactButton(icon: Icons.email, label: 'Email'),
              ContactButton(icon: Icons.phone, label: 'Phone'),
              ContactButton(
                icon: const IconData(0xe806, fontFamily: 'Linked_in'),
                label: 'LinkedIn',
              ),
              ContactButton(
                icon: const IconData(0xe807, fontFamily: 'Whats_app'),
                label: 'WhatsApp',
              ),
            ],
          ),
          SizedBox(height: 32),
          Text(
            '© 2025 Mohamed El Kholy. All rights reserved.',
            style: TextStyle(color: Colors.grey[400], fontSize: 14),
          ),
        ],
      ),
    );
  }
}
