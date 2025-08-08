import 'package:flutter/material.dart';
import 'package:my_portfolio/helpers/animated_widget_wrapper.dart';
import 'package:my_portfolio/helpers/visibility_detector_animation_wrapper.dart';
import 'package:my_portfolio/screens/home/widgets/about_section.dart';
import 'package:my_portfolio/screens/home/widgets/contact_section.dart';
import 'package:my_portfolio/screens/home/widgets/hero_section.dart';
import 'package:my_portfolio/screens/home/widgets/projects_section.dart';
import 'package:my_portfolio/screens/home/widgets/skills_section.dart';

class PortfolioHome extends StatefulWidget {
  const PortfolioHome({super.key});

  @override
  State<PortfolioHome> createState() => _PortfolioHomeState();
}

class _PortfolioHomeState extends State<PortfolioHome> {
  final GlobalKey _aboutKey = GlobalKey();
  final GlobalKey _skillsKey = GlobalKey();
  final GlobalKey _projectsKey = GlobalKey();
  final GlobalKey _contactKey = GlobalKey();

  late final children =
      [
        SizedBox(height: 24),
        HeroSection(onPressed: () => _scrollToSection(_projectsKey)),
        AboutSection(key: _aboutKey),
        VisibilityDetectorAnimationWrapper(
          key: _skillsKey,
          child: SkillsSection(),
        ),
        VisibilityDetectorAnimationWrapper(
          key: _projectsKey,
          child: ProjectsSection(),
        ),
      ].map((e) {
        if (e is VisibilityDetectorAnimationWrapper) {
          return e;
        }
        return AnimatedWidgetWrapper(child: e);
      }).toList();

  void _scrollToSection(GlobalKey key) {
    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: Duration(milliseconds: 800),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 2,
        title: Text(
          '3MK Dev',
          style: TextStyle(
            color: Colors.grey[800],
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => _scrollToSection(_aboutKey),
            child: Text('About', style: TextStyle(color: Colors.grey[700])),
          ),
          TextButton(
            onPressed: () => _scrollToSection(_skillsKey),
            child: Text('Skills', style: TextStyle(color: Colors.grey[700])),
          ),
          TextButton(
            onPressed: () => _scrollToSection(_projectsKey),
            child: Text('Projects', style: TextStyle(color: Colors.grey[700])),
          ),
          TextButton(
            onPressed: () => _scrollToSection(_contactKey),
            child: Text('Contact', style: TextStyle(color: Colors.grey[700])),
          ),
          SizedBox(width: 16),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 1500),
              child: Column(children: children),
            ),
            ContactSection(key: _contactKey),
          ],
        ),
      ),
    );
  }
}
