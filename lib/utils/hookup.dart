import 'package:url_launcher/url_launcher.dart';

class UrlLauncherHelper {
  // Method to launch phone calls
  static Future<void> launchPhone(String phoneNumber) async {
    final url = 'tel://$phoneNumber';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  // Method to send emails
  static Future<void> launchEmail(String emailAddress) async {
    final url = Uri.parse("mailto:$emailAddress");
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  static Future<void> launchTeamsMessage(String name) async {
   final url = Uri.parse("msteams://teams.microsoft.com/l/chat/0/0?users=$name");
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch Microsoft Teams.';
    }
  }

// Add more methods for other types of URLs if needed
}