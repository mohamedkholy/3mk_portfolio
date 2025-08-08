import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class AnimatedWidgetWrapper extends StatefulWidget {
  final Widget child;
  const AnimatedWidgetWrapper({super.key, required this.child});

  @override
  State<AnimatedWidgetWrapper> createState() => _AnimatedWidgetWrapperState();
}

class _AnimatedWidgetWrapperState extends State<AnimatedWidgetWrapper>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return widget.child
        .animate()
        .slideY(
          begin: 0.2,
          end: 0,
          duration: Duration(milliseconds: 800),
          curve: Curves.fastOutSlowIn,
        )
        .fade(duration: Duration(milliseconds: 800));
  }

  @override
  bool get wantKeepAlive => true;
}
