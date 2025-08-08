import 'package:flutter/material.dart';

class ProjectDescriptionSection extends StatelessWidget {
  final String projectTitle;
  final String projectDescription;
  const ProjectDescriptionSection({
    super.key,
    required this.projectTitle,
    required this.projectDescription,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
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
                projectTitle,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[800],
                ),
              ),
              SizedBox(height: 12),
              Text(
                projectDescription,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[600],
                  height: 1.6,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
