import 'package:flutter/material.dart';
import 'package:my_portfolio/helpers/animated_widget_wrapper.dart';
import 'package:my_portfolio/models/project.dart';
import 'package:my_portfolio/screens/home/widgets/contact_section.dart';
import 'package:my_portfolio/screens/project_details/widgets/project_description_section.dart';
import 'package:my_portfolio/screens/project_details/widgets/project_features_section.dart';
import 'package:my_portfolio/screens/project_details/widgets/project_screenshots_section.dart';
import 'package:my_portfolio/screens/project_details/widgets/project_technologies_section.dart';

class ProjectDetailsScreenWide extends StatefulWidget {
  final Project project;
  const ProjectDetailsScreenWide({super.key, required this.project});

  @override
  State<ProjectDetailsScreenWide> createState() =>
      _ProjectDetailsScreenWideState();
}

class _ProjectDetailsScreenWideState extends State<ProjectDetailsScreenWide> {
  late final children = <Widget>[
    Column(
      children: [
        ProjectDescriptionSection(
          projectTitle: widget.project.title,
          projectDescription: widget.project.fullDescription,
        ),
        SizedBox(height: 24),
        ProjectScreenshotsSection(screenshots: widget.project.screenshots),
      ].map((e) => AnimatedWidgetWrapper(child: e)).toList(),
    ),
    SizedBox(width: 24),
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ProjectTechnologiesSection(technologies: widget.project.technologies),
        SizedBox(height: 24),
        ProjectFeaturesSection(features: widget.project.features),
      ].map((e) => AnimatedWidgetWrapper(child: e)).toList(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Center(
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 1500),
              child: Container(
                padding: EdgeInsets.all(20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: children
                      .asMap()
                      .entries
                      .map(
                        (e) => e.key != 1
                            ? Expanded(flex: e.key == 0 ? 2 : 1, child: e.value)
                            : e.value,
                      )
                      .toList(),
                ),
              ),
            ),
          ),
          SizedBox(height: 50),
          ContactSection(),
        ],
      ),
    );
  }
}
