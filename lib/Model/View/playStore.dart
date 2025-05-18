
import 'package:url_launcher/url_launcher.dart';

class PlaystoreClass {

  void playstore()async{
     const appId = '';
                final Uri url = Uri.parse('market://details?id=$appId');
                final Uri fallbackUrl =
                    Uri.parse('https://pub.dev/packages/package_info_plus');
                try {
                  if (await canLaunchUrl(url)) {
                    await launchUrl(url, mode: LaunchMode.externalApplication);
                  } else if (await canLaunchUrl(fallbackUrl)) {
                    await launchUrl(fallbackUrl,
                        mode: LaunchMode.externalApplication);
                  } else {
                    throw 'could not lsuch play store';
                  }
                // ignore: empty_catches
                } catch (e) {
                  
  }

}}