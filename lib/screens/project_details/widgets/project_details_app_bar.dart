import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectDetailsAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  final String projectTitle;
  final String liveUrl;
  final String githubUrl;
  const ProjectDetailsAppBar({
    super.key,
    required this.projectTitle,
    required this.liveUrl,
    required this.githubUrl,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 1,
      leading: IconButton(
        icon: Icon(Icons.arrow_back, color: Colors.grey[800]),
        onPressed: () => Navigator.pop(context),
      ),
      title: Text(
        projectTitle,
        style: TextStyle(
          color: Colors.grey[800],
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
      actions: [
        TextButton.icon(
          onPressed: () {
            launchUrl(Uri.parse(liveUrl));
          },
          icon: Icon(Icons.play_arrow, size: 28),
          label: Text(
            "Try the App",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          style: TextButton.styleFrom(foregroundColor: Colors.green),
        ),
        IconButton(
          icon: const Icon(IconData(0xe808, fontFamily: "Git_hup"), size: 28),
          onPressed: () {
            launchUrl(Uri.parse(githubUrl));
          },
          tooltip: 'GitHub Repo',
        ),
        IconButton(
          icon: Icon(Icons.share, color: Colors.grey[700], size: 28),
          onPressed: () {
            final title = projectTitle;
            final apkUrl = liveUrl;

            final message = "Check out this app \"$title\" 👇\n$apkUrl";

            SharePlus.instance.share(ShareParams(text: message));
          },
          tooltip: 'Share Project',
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
