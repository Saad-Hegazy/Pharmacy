
import 'package:url_launcher/url_launcher.dart';

class Functions {
  Future  launchURLBrowser(var Url) async {
    var url = Uri.parse(Url);
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}