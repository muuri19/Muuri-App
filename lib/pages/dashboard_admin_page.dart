import 'package:flutter/material.dart';
import 'package:muuri_app/pages/search_page.dart';

class DashboardAdminPage extends StatelessWidget {
  static const routeName = 'dashboard-admin';
  const DashboardAdminPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard Admin'),
        centerTitle: true,
      ),
      body: Center(
        child: TextButton(
          onPressed: () {
            Navigator.pushNamedAndRemoveUntil(
                context, SearchPage.routeName, (Route<dynamic> route) => false);
          },
          child: const Text('Logout'),
        ),
      ),
    );
  }
}
