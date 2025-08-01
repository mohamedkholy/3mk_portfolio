import 'package:flutter/material.dart';

class Project {
  final String title;
  final String description;
  final String fullDescription;
  final Color color;
  final List<String> technologies;
  final List<String> features;
  final String githubUrl;
  final String liveUrl;
  final List<String> screenshots;

  const Project({
    required this.title,
    required this.description,
    required this.fullDescription,
    required this.color,
    required this.technologies,
    required this.features,
    required this.githubUrl,
    required this.liveUrl,
    required this.screenshots,
  });
}
