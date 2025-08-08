import 'package:flutter/material.dart';
import 'package:my_portfolio/models/project.dart';
import 'package:my_portfolio/screens/project_details/widgets/project_details_app_bar.dart';
import 'package:my_portfolio/screens/project_details/widgets/project_details_screen_narrow.dart';
import 'package:my_portfolio/screens/project_details/widgets/project_details_screen_wide.dart';

class ProjectDetailScreen extends StatefulWidget {
  final Project project;

  const ProjectDetailScreen({super.key, required this.project});

  @override
  State<ProjectDetailScreen> createState() => _ProjectDetailScreenState();
}

class _ProjectDetailScreenState extends State<ProjectDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ProjectDetailsAppBar(
        projectTitle: widget.project.title,
        liveUrl: widget.project.liveUrl,
        githubUrl: widget.project.githubUrl,
      ),
      backgroundColor: Colors.grey.shade200,
      body: MediaQuery.sizeOf(context).width < 1000
          ? ProjectDetailsScreenNarrow(project: widget.project)
          : ProjectDetailsScreenWide(project: widget.project),
    );
  }
}
