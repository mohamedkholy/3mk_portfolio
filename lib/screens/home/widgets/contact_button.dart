import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactButton extends StatelessWidget {
  final IconData icon;
  final String label;
  const ContactButton({required this.icon, required this.label, super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        switch (label) {
          case 'Email':
            launchUrl(
              Uri(scheme: 'mailto', path: 'mohamed.elkholy14920@gmail.com'),
            );

          case 'Phone':
            launchUrl(Uri(scheme: 'tel', path: '+201501535217'));

          case 'WhatsApp':
            launchWhatsApp('+201501535217');

          default:
            launchUrl(
              Uri.parse(
                'https://www.linkedin.com/in/mohamed-el-kholy-aa910916b/',
              ),
            );
        }
      },
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.blue[600],
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: Colors.white, size: 24),
          ),
          SizedBox(height: 8),
          Text(label, style: TextStyle(color: Colors.white, fontSize: 12)),
        ],
      ),
    );
  }

  void launchWhatsApp(String phone) async {
    final url = Uri.parse("https://wa.me/$phone");
    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch WhatsApp';
    }
  }
}
