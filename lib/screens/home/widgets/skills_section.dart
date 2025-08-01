import 'package:flutter/material.dart';

class SkillsSection extends StatelessWidget {
  final skills = const [
    'Dart',
    'Kotlin',
    'Firebase',
    'OOP',
    'RESTful APIs',
    'Data Structures',
    'SQLite, Drift',
    'State Management (Bloc\\Cubit)',
    'Git, GitHub',
  ];

  final GlobalKey _key;
  const SkillsSection(this._key, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      key: _key,
      padding: EdgeInsets.all(32),
      child: Column(
        children: [
          Text(
            'Skills',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.grey[800],
            ),
          ),
          SizedBox(height: 32),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            alignment: WrapAlignment.center,
            children: skills
                .map(
                  (skill) => Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                    decoration: BoxDecoration(
                      color: Colors.blue[50],
                      borderRadius: BorderRadius.circular(25),
                      border: Border.all(color: Colors.blue[200]!, width: 1),
                    ),
                    child: Text(
                      skill,
                      style: TextStyle(
                        color: Colors.blue[700],
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}
