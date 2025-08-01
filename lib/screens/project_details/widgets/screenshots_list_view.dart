import 'package:flutter/material.dart';

class ScreenshotsListView extends StatelessWidget {
  final bool isMobile;
  final List<String> screenshots;
  final int selectedIndex;
  final Function(int) onTap;

  const ScreenshotsListView({
    super.key,
    required this.isMobile,
    required this.screenshots,
    required this.onTap,
    required this.selectedIndex,
  });

  @override
  Widget build(BuildContext context) {
    final ScrollController scrollController = ScrollController();

    return SizedBox(
      height: isMobile ? 95 : null,
      child: ScrollConfiguration(
        behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
        child: Scrollbar(
          controller: scrollController,
          thumbVisibility: true,
          interactive: true,
          thickness: 8,
          scrollbarOrientation: isMobile
              ? ScrollbarOrientation.bottom
              : ScrollbarOrientation.right,
          child: Padding(
            padding: isMobile
                ? const EdgeInsets.only(bottom: 11)
                : const EdgeInsets.only(right: 11),
            child: ListView.builder(
              controller: scrollController,
              scrollDirection: isMobile ? Axis.horizontal : Axis.vertical,
              itemCount: screenshots.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(
                    right: isMobile ? 8.0 : 0,
                    bottom: isMobile ? 0 : 8.0,
                  ),
                  child: InkWell(
                    onTap: () => onTap(index),
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: selectedIndex == index
                              ? Colors.blue
                              : Colors.transparent,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                          screenshots[index],
                          width: 150,
                          height: 86,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
