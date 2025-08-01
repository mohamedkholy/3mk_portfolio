import 'package:flutter/material.dart';
import 'package:my_portfolio/screens/project_details/widgets/current_image_layout.dart';
import 'package:my_portfolio/screens/project_details/widgets/screenshots_list_view.dart';

class ProjectScreenshotsSection extends StatefulWidget {
  final List<String> screenshots;
  const ProjectScreenshotsSection({super.key, required this.screenshots});

  @override
  State<ProjectScreenshotsSection> createState() =>
      _ProjectScreenshotsSectionState();
}

class _ProjectScreenshotsSectionState extends State<ProjectScreenshotsSection> {
  late int _currentImageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = constraints.maxWidth < 600;

        return ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: constraints.maxWidth < 1000 ? 1000 : 800,
          ),
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: isMobile
                ? Column(
                    children: [
                      CurrentImageLayout(
                        widget.screenshots[_currentImageIndex],
                        isMobile,
                      ),
                      const SizedBox(height: 12),
                      ScreenshotsListView(
                        isMobile: isMobile,
                        screenshots: widget.screenshots,
                        onTap: (index) {
                          setState(() {
                            _currentImageIndex = index;
                          });
                        },
                        selectedIndex: _currentImageIndex,
                      ),
                    ],
                  )
                : AspectRatio(
                    aspectRatio: 800 / 460,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 1,
                          child: ScreenshotsListView(
                            isMobile: isMobile,
                            screenshots: widget.screenshots,
                            onTap: (index) {
                              setState(() {
                                _currentImageIndex = index;
                              });
                            },
                            selectedIndex: _currentImageIndex,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          flex: 4,
                          child: CurrentImageLayout(
                            widget.screenshots[_currentImageIndex],
                            isMobile,
                          ),
                        ),
                      ],
                    ),
                  ),
          ),
        );
      },
    );
  }
}
