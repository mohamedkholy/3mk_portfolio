import 'package:flutter/material.dart';
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
            HeroSection(onPressed: () => _scrollToSection(_projectsKey)),
            AboutSection(_aboutKey),
            SkillsSection(_skillsKey),
            ProjectsSection(_projectsKey),
            ContactSection(sectionKey: _contactKey),
          ],
        ),
      ),
    );
  }
}
