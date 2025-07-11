import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:multitool/widgets/bottom_nav_bar.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  void _launchPrivacyPolicy() async {
    final Uri url = Uri.parse(
      'https://pruthviraj-guddu.github.io/multitool/privacyPolicy.html',
    );
    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $url';
    }
  }

  void _launchTermsAndConditions() async {
    final Uri url = Uri.parse(
      'https://pruthviraj-guddu.github.io/multitool/termsAndCondition.html',
    );
    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profile')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // const CircleAvatar(
            //   radius: 50,
            //   backgroundImage: AssetImage('assets/profile_placeholder.png'),
            // ),
            // const SizedBox(height: 20),
            // const Text(
            //   'User Name',
            //   style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            // ),
            // const SizedBox(height: 10),
            // const Text('user@example.com'),
            const SizedBox(height: 40),

            SizedBox(
              width: 200,
              child: SizedBox(
                width: 200,
                child: ElevatedButton(
                  onPressed: _launchPrivacyPolicy,
                  child: const Text('Privacy Policy'),
                ),
              ),

              // ElevatedButton(
              //   onPressed: () {
              //     _showLegalDialog(
              //       context,
              //       'Privacy Policy',
              //       'Privacy policy content will be loaded here. You can replace this with your HTML content later.',
              //     );
              //   },
              //   child: const Text('Privacy Policy'),
              // ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: 200,
              child: SizedBox(
                width: 200,
                child: ElevatedButton(
                  onPressed: _launchTermsAndConditions,
                  child: const Text('Terms & Conditions'),
                ),
              ),
              // ElevatedButton(
              //   onPressed: () {
              //     _showLegalDialog(
              //       context,
              //       'Terms & Conditions',
              //       'Terms and conditions content will be loaded here. You can replace this with your HTML content later.',
              //     );
              //   },
              //   child: const Text('Terms & Conditions'),
              // ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const AppBottomNavBar(currentIndex: 2),
    );
  }
}
