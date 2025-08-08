import 'package:flutter/material.dart';

class CurrentImageLayout extends StatelessWidget {
  final String currentImage;

  final bool isMobile;

  const CurrentImageLayout({
    super.key,
    required this.currentImage,
    required this.isMobile,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showFullScreenImageDialog(context, currentImage);
      },
      child: Stack(
        children: [
          AnimatedSwitcher(
            duration: Duration(milliseconds: 400),
            switchInCurve: Curves.easeIn,
            switchOutCurve: Curves.easeOut,
            child: SizedBox(
              key: ValueKey(currentImage),
              width: double.infinity,
              height: isMobile ? null : double.infinity,
              child: Image.asset(currentImage, fit: BoxFit.fill),
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: IconButton(
              onPressed: () {
                showFullScreenImageDialog(context, currentImage);
              },
              icon: Icon(Icons.fullscreen, color: Colors.white, size: 28),
            ),
          ),
        ],
      ),
    );
  }

  void showFullScreenImageDialog(BuildContext context, String image) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (_) => Dialog(
        insetPadding: EdgeInsets.zero,
        backgroundColor: Colors.black,
        child: GestureDetector(
          onTap: () => Navigator.of(context).pop(),
          child: InteractiveViewer(
            child: Center(child: Image.asset(image, fit: BoxFit.contain)),
          ),
        ),
      ),
    );
  }
}
