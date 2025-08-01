import 'package:flutter/material.dart';
import 'package:my_portfolio/assets.dart';
import 'package:auto_size_text/auto_size_text.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key, required this.onPressed});

  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 600,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.deepPurple.shade700, Colors.indigo.shade600],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Avatar with glowing effect
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.white.withAlpha(50),
                  blurRadius: 25,
                  spreadRadius: 4,
                ),
              ],
            ),
            child: SizedBox(
              width: 270,
              height: 270,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  CircleAvatar(
                    radius: 110,
                    backgroundColor: Colors.white,
                    child: CircleAvatar(
                      radius: 105,
                      backgroundColor: Colors.black,
                    ),
                  ),
                  Positioned(
                    bottom: 20,
                    child: Image.asset(
                      Assets.imagesMyphoto,
                      width: 250,
                      height: 250,
                    ),
                  ),
                  ClipPath(
                    clipper: CircleClipper(fillPercent: 0.2),
                    child: Container(
                      width: 220,
                      height: 220,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 24),
          // Name
          AutoSizeText(
            'Mohamed El Kholy',
            maxLines: 1,
            style: TextStyle(
              fontSize: 38,
              fontWeight: FontWeight.w900,
              color: Colors.white,
              letterSpacing: 1.5,
            ),
          ),
          const SizedBox(height: 10),
          // Subtitle
          Text(
            'Flutter Developer',
            style: TextStyle(
              fontSize: 22,
              color: Colors.white70,
              fontStyle: FontStyle.italic,
              letterSpacing: 1.2,
            ),
          ),
          const SizedBox(height: 32),
          // Animated Button
          ElevatedButton.icon(
            onPressed: onPressed,
            icon: const Icon(Icons.arrow_forward),
            label: const Text(
              'View My Work',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor: Colors.deepPurple,
              elevation: 8,
              padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 18),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(40),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CircleClipper extends CustomClipper<Path> {
  final double fillPercent;

  CircleClipper({required this.fillPercent});

  @override
  Path getClip(Size size) {
    final path = Path();

    double fillHeight = size.height * (1 - fillPercent);

    path.moveTo(0, fillHeight);
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, fillHeight);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
