import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  static const routeName = 'search-page';
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: const Color(0xff152A38),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/logo-google-developer.png',
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 50,
                width: screenWidth,
                child: TextField(
                  style: const TextStyle(color: Colors.black),
                  cursorColor: Colors.black,
                  controller: _searchController,
                  decoration: InputDecoration(
                    hintText: 'Search Project',
                    hintStyle: TextStyle(color: Colors.grey[300]),
                    prefixIcon: const Icon(
                      Icons.search,
                      color: Colors.black,
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(width: 1, color: Colors.white)),
                    focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(width: 1, color: Colors.white)),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
