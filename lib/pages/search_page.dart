import 'package:flutter/material.dart';
import 'package:muuri_app/pages/sign_in_page.dart';
import 'package:muuri_app/widgets/tab_bar_certificate.dart';
import 'package:muuri_app/widgets/tab_bar_project.dart';

class SearchPage extends StatefulWidget {
  static const routeName = 'search-page';
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
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
      ),
    );
  }
}
