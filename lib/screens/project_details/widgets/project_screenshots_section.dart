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
    return Builder(
      builder: (context) {
        final isNarrow = MediaQuery.sizeOf(context).width < 1000;
        return Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: isNarrow
              ? Column(
                  children: [
                    CurrentImageLayout(
                      currentImage: widget.screenshots[_currentImageIndex],
                      isMobile: isNarrow,
                    ),
                    const SizedBox(height: 12),
                    ScreenshotsListView(
                      isMobile: isNarrow,
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
                  aspectRatio: 1000 / 500,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 1,
                        child: ScreenshotsListView(
                          isMobile: isNarrow,
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
                          currentImage: widget.screenshots[_currentImageIndex],
                          isMobile: isNarrow,
                        ),
                      ),
                    ],
                  ),
                ),
        );
      },
    );
  }
}
