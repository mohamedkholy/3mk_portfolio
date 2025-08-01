import 'package:flutter/material.dart';

class CurrentImageLayout extends StatelessWidget {
  final String _currentImage;

  final bool _isMobile;

  const CurrentImageLayout(this._currentImage, this._isMobile, {super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
         showFullScreenImageDialog(context, _currentImage);
      },
      child: Stack(
        children: [
          SizedBox(
            height: _isMobile ? null : double.infinity,
            child: Image.asset(_currentImage, fit: BoxFit.cover),
          ),
          Align(
            alignment: Alignment.topRight,
            child: IconButton(
              onPressed: () {
                showFullScreenImageDialog(context, _currentImage);
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
