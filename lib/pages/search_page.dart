import 'package:flutter/material.dart';
import 'package:muuri_app/pages/sign_in_page.dart';
import 'package:muuri_app/widgets/tab_bar_certificate.dart';
import 'package:muuri_app/widgets/tab_bar_project.dart';
import 'package:url_launcher/url_launcher.dart';

class SearchPage extends StatefulWidget {
  static const routeName = 'search-page';
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final Uri _url = Uri.parse(
      'https://wa.me/6282268215563?text=Hallo%20Muuri!,%20Can%20You%20Help%20Me?');
  Future<void> _launchUrl() async {
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        backgroundColor: const Color(0xff152A38),
        appBar: AppBar(
          title: const Text('MUURI - API 🚀'),
          titleTextStyle: const TextStyle(color: Colors.white, fontSize: 18),
          backgroundColor: const Color(0xff152A38),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, SignInPage.routeName);
              },
              style: ButtonStyle(
                shape: WidgetStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
              child: const Text(
                'Login Admin',
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
          bottom: const TabBar(
            indicatorColor: Colors.white,
            unselectedLabelColor: Color(0xff696D78),
            labelStyle: TextStyle(color: Colors.white),
            tabs: [
              Tab(
                text: 'Project',
              ),
              Tab(
                text: 'Certificate',
              ),
            ],
          ),
        ),
        body: const TabBarView(
          physics: NeverScrollableScrollPhysics(),
          children: [
            TabBarProject(),
            TabBarCertificate(),
          ],
        ),
        floatingActionButton: FloatingActionButton.extended(
            onPressed: () {
              _launchUrl();
            },
            label: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/bot.png',
                  height: 25,
                ),
                const SizedBox(
                  width: 8,
                ),
                const Text(
                  'Chat Me',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                )
              ],
            )),
      ),
    );
  }
}
