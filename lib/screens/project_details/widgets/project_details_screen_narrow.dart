import 'package:flutter/material.dart';
import 'package:my_portfolio/helpers/animated_widget_wrapper.dart';
import 'package:my_portfolio/models/project.dart';
import 'package:my_portfolio/screens/home/widgets/contact_section.dart';
import 'package:my_portfolio/screens/project_details/widgets/project_description_section.dart';
import 'package:my_portfolio/screens/project_details/widgets/project_features_section.dart';
import 'package:my_portfolio/screens/project_details/widgets/project_screenshots_section.dart';
import 'package:my_portfolio/screens/project_details/widgets/project_technologies_section.dart';

class ProjectDetailsScreenNarrow extends StatefulWidget {
  final Project project;
  const ProjectDetailsScreenNarrow({super.key, required this.project});

  @override
  State<ProjectDetailsScreenNarrow> createState() =>
      _ProjectDetailsScreenNarrowState();
}

class _ProjectDetailsScreenNarrowState
    extends State<ProjectDetailsScreenNarrow> {
  late final children =
      <Widget>[
        ProjectDescriptionSection(
          projectTitle: widget.project.title,
          projectDescription: widget.project.fullDescription,
        ),
        SizedBox(height: 24),
        ProjectScreenshotsSection(screenshots: widget.project.screenshots),
        SizedBox(height: 24),
        ProjectTechnologiesSection(technologies: widget.project.technologies),
        SizedBox(height: 24),
        ProjectFeaturesSection(features: widget.project.features),
        SizedBox(height: 24),
        ContactSection(),
      ].map((e) {
        if (e is ContactSection || e is SizedBox) {
          return e;
        }
        return AnimatedWidgetWrapper(child: e);
      }).toList();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      cacheExtent: 0,
      itemCount: children.length,
      itemBuilder: (context, index) => children[index],
    );
  }
}
