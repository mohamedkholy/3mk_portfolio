import 'package:flutter/material.dart';
import 'package:my_portfolio/assets.dart';
import 'package:my_portfolio/models/project.dart';
import 'package:my_portfolio/screens/home/widgets/project_card.dart';

class ProjectsSection extends StatelessWidget {
  final _projects = const [
    Project(
      title: 'Metro Scout',
      description: 'Cairo metro navigation and guide app.',
      fullDescription:
          'Metro Scout helps users find the nearest metro stations, estimate ticket prices, and view the metro map. It offers real-time geolocation and a simple, clean interface.',
      color: Colors.red,
      technologies: [
        'Flutter',
        'Dart',
        'Drift',
        'Google Maps API',
        'Geolocator',
        'Cubit',
        'Multi-language',
      ],
      features: [
        'Find nearest stations by location',
        'Estimate ticket prices',
        'Interactive metro map',
        'Multi-language support (EN/AR)',
      ],
      githubUrl: 'https://github.com/mohamedkholy/metro_scout',
      liveUrl:
          'https://drive.google.com/drive/folders/1VY8vFmdAzZCx4xbgHBOU5KKOaUpSBqhH?usp=drive_link',
      screenshots: [
        Assets.imagesMetroScout,
        Assets.imagesMetroScoutCalculateFareScreenshot,
        Assets.imagesMetroScoutNearestStationAddressScreenshot,
        Assets.imagesMetroScoutHomeScreenshot,
        Assets.imagesMetroScoutNearestStationLocalScreenshot,
        Assets.imagesMetroScoutMetroMap2Screenshot,
        Assets.imagesMetroScoutMetroMapScreenshot,
      ],
    ),
    Project(
      title: 'Daily Track',
      description: 'Habit and routine tracking app.',
      fullDescription:
          'Daily Track is a productivity app to help users monitor habits and routines. It features detailed charts and animations for tracking personal progress.',
      color: Colors.green,
      technologies: [
        'Flutter',
        'Dart',
        'Drift',
        'Bloc',
        'Cubit',
        'Syncfusion Charts',
      ],
      features: [
        'Track daily habits and routines',
        'Real-time stats and charts',
        'Animated progress visuals',
      ],
      githubUrl: 'https://github.com/mohamedkholy/daily_track',
      liveUrl:
          'https://drive.google.com/drive/folders/1z6MiZyZ5qOxR1x8a4MnZnxkoE_LyC0CW?usp=drive_link',
      screenshots: [Assets.imagesDailyTrack],
    ),
    Project(
      title: 'Easy Mart',
      description: 'E-commerce app with delivery and checkout.',
      fullDescription:
          'Easy Mart lets users browse products, manage a cart, and place orders with real-time delivery tracking. It supports secure payments and user authentication.',
      color: Colors.orange,
      technologies: [
        'Flutter',
        'Cubit (MVVM)',
        'SQLite/Drift',
        'Google Maps API',
        'ScreenUtil',
        'Firebase Auth',
        'Cloud Firestore',
        'Stripe API',
        'Geocoding',
        'Shared Preferences',
      ],
      features: [
        'Product browsing and shopping cart',
        'Location-based delivery',
        'Secure checkout and online payments',
        'Authentication and real-time data sync',
      ],
      githubUrl: 'https://github.com/mohamedkholy/easy_mart',
      liveUrl:
          'https://drive.google.com/drive/folders/1inmvScyH9hs2BuBEYacJJIbYXfbe8L2J?usp=drive_link',
      screenshots: [Assets.imagesEasyMart],
    ),
    Project(
      title: 'PickIt',
      description: 'Marketplace for buying and selling items.',
      fullDescription:
          'PickIt is a modern marketplace app that connects buyers and sellers. Users can list items, chat in real time, and get notified instantly about new messages.',
      color: Colors.purple,
      technologies: [
        'Flutter',
        'Firebase Auth',
        'Cloud Firestore',
        'Cubit (MVVM)',
        'CachedNetworkImage',
        'Push Notifications',
      ],
      features: [
        'Item listings with images',
        'Real-time chat between users',
        'Authentication and secure accounts',
        'Push notifications and modern UI',
      ],
      githubUrl: 'https://github.com/mohamedkholy/pickIt',
      liveUrl:
          'https://drive.google.com/drive/folders/1JMw4ZD-2NGNkZ4SMCJAYWd24klKG92_W?usp=drive_link',
      screenshots: [Assets.imagesPickit],
    ),
    Project(
      title: 'Awraqi',
      description: 'Student notes and study papers app.',
      fullDescription:
          'Awraqi helps students access summarized notes and organized study materials. It includes secure PDF viewing, file encryption, and cloud-based storage and sync.',
      color: Colors.blue,
      technologies: [
        'Kotlin',
        'XML',
        'MVVM',
        'Firebase Auth',
        'Firestore',
        'FCM',
        'Storage',
        'Crashlytics',
        'Analytics',
        'PDF Viewer',
        'DataStore',
        'Koin',
      ],
      features: [
        'Summarized notes and study papers',
        'Secure file encryption & decryption',
        'Integrated PDF viewer',
        'Firebase backend with authentication and sync',
      ],
      githubUrl: 'https://github.com/mohamedkholy/Awraqi',
      liveUrl:
          'https://play.google.com/store/apps/details?id=com.dev3mk.awraqi',
      screenshots: [],
    ),
  ];

  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(

      padding: EdgeInsets.all(32),
      child: Column(
        children: [
          Text(
            'My Projects',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.grey[800],
            ),
          ),
          SizedBox(height: 32),
          GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: MediaQuery.of(context).size.width > 768 ? 2 : 1,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
              childAspectRatio: 1.2,
            ),
            itemCount: 4,
            itemBuilder: (context, index) => ProjectCard(_projects[index]),
          ),
        ],
      ),
    );
  }
}
