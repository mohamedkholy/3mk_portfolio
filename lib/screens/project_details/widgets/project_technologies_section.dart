import 'package:flutter/material.dart';

class ProjectTechnologiesSection extends StatelessWidget {
  final List<String> technologies;

  const ProjectTechnologiesSection({super.key, required this.technologies});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Technologies Used',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.grey[800],
            ),
          ),
          SizedBox(height: 12),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              ...technologies.map(
                (tech) => Container(
                  padding: EdgeInsets.symmetric(horizontal: 17, vertical: 10),
                  decoration: BoxDecoration(
                    color: Colors.blue[50],
                    borderRadius: BorderRadius.circular(25),
                    border: Border.all(color: Colors.blue[200]!, width: 1),
                  ),
                  child: Text(
                    tech,
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.blue[700],
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              Container(width: double.infinity),
            ],
          ),
        ],
      ),
    );
  }
}
