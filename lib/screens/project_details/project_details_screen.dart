import 'package:flutter/material.dart';
import 'package:my_portfolio/models/project.dart';
import 'package:my_portfolio/screens/home/widgets/contact_section.dart';
import 'package:my_portfolio/screens/project_details/widgets/project_description_section.dart';
import 'package:my_portfolio/screens/project_details/widgets/project_details_app_bar.dart';
import 'package:my_portfolio/screens/project_details/widgets/project_features_section.dart';
import 'package:my_portfolio/screens/project_details/widgets/project_screenshots_section.dart';
import 'package:my_portfolio/screens/project_details/widgets/project_technologies_section.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:share_plus/share_plus.dart';

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
      backgroundColor: Colors.grey[300],
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 24),
              LayoutBuilder(
                builder: (context, constraints) {
                  final isWide = constraints.maxWidth > 1000;
                  final children = <Widget>[
                    Column(
                      mainAxisSize:  MainAxisSize.min,
                      children: [
                        ProjectDescriptionSection(
                          projectTitle: widget.project.title,
                          projectDescription: widget.project.fullDescription,
                        ),
                        SizedBox(height: 24),
                        ProjectScreenshotsSection(
                          screenshots: widget.project.screenshots,
                        ),
                      ],
                    ),
                    SizedBox(height: isWide ? 0 : 24, width: isWide ? 24 : 0),
                    isWide
                        ? Expanded(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ProjectTechnologiesSection(
                                  technologies: widget.project.technologies,
                                ),
                                SizedBox(height: 24),
                                ProjectFeaturesSection(
                                  features: widget.project.features,
                                ),
                              ],
                            ),
                          )
                        : Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ProjectTechnologiesSection(
                                technologies: widget.project.technologies,
                              ),
                              SizedBox(height: 24),
                              ProjectFeaturesSection(
                                features: widget.project.features,
                              ),
                            ],
                          ),
                  ];

                  return isWide
                      ? Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: children,
                        )
                      : Column(children: children);
                },
              ),
              SizedBox(height: 24),
              ContactSection(),
            ],
          ),
        ),
      ),
    );
  }
}
