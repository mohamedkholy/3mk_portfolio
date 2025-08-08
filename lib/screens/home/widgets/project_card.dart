import 'package:flutter/material.dart';
import 'package:my_portfolio/models/project.dart';
import 'package:my_portfolio/screens/project_details/project_details_screen.dart'
    deferred as project_details_screen;

class ProjectCard extends StatefulWidget {
  final Project _project;
  const ProjectCard(this._project, {super.key});

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  bool _isHovered = false;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Stack(
        children: [
          Image.asset(
            widget._project.screenshots[0],
            height: double.infinity,
            fit: BoxFit.cover,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              color: Colors.black54,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget._project.title,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    widget._project.description,
                    style: TextStyle(color: Colors.white70, height: 1.4),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: InkWell(
                      onHover: (value) {
                        setState(() {
                          _isHovered = value;
                        });
                      },
                      onTap: () async {
                        await project_details_screen.loadLibrary();
                        if (context.mounted) {
                          Navigator.push(
                            context,
                            PageRouteBuilder(
                              pageBuilder:
                                  (context, animation, secondaryAnimation) =>
                                      project_details_screen.ProjectDetailScreen(
                                        project: widget._project,
                                      ),
                              transitionsBuilder:
                                  (
                                    context,
                                    animation,
                                    secondaryAnimation,
                                    child,
                                  ) {
                                    return SlideTransition(
                                      position: Tween<Offset>(
                                        begin: Offset(1, 0),
                                        end: Offset.zero,
                                      ).animate(animation),
                                      child: child,
                                    );
                                  },
                            ),
                          );
                        }
                      },
                      child: Container(
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: !_isHovered
                            ? Icon(Icons.arrow_forward)
                            : Icon(Icons.arrow_outward),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
