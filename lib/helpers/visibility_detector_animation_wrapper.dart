import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:visibility_detector/visibility_detector.dart';

class VisibilityDetectorAnimationWrapper extends StatefulWidget {
  final Widget child;
  const VisibilityDetectorAnimationWrapper({super.key, required this.child});

  @override
  State<VisibilityDetectorAnimationWrapper> createState() =>
      _VisibilityDetectorAnimationWrapperState();
}

class _VisibilityDetectorAnimationWrapperState
    extends State<VisibilityDetectorAnimationWrapper> {
  bool _isVisible = false;

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: ValueKey(widget.child.hashCode),
      onVisibilityChanged: (info) {
        if (!_isVisible && info.visibleFraction > 0.01) {
          setState(() {
            _isVisible = true;
          });
        }
      },
      child: _isVisible
          ? widget.child
                .animate()
                .slideY(
                  begin: 0.2,
                  end: 0,
                  duration: Duration(milliseconds: 800),
                  curve: Curves.fastOutSlowIn,
                )
                .fade(duration: Duration(milliseconds: 800))
          : Opacity(opacity: 0, child: widget.child),
    );
  }
}
