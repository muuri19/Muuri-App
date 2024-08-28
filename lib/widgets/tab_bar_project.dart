import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:muuri_app/utils/constant.dart';

class TabBarProject extends StatefulWidget {
  const TabBarProject({
    super.key,
  });

  @override
  State<TabBarProject> createState() => _TabBarProjectState();
}

class _TabBarProjectState extends State<TabBarProject> {
  final CollectionReference myProject =
      FirebaseFirestore.instance.collection("projects");

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: myProject.snapshots(),
      builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
        if (streamSnapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(
              color: Colors.white,
            ),
          );
        }

        if (streamSnapshot.hasError) {
          return Center(
            child: Text(
              'Error: ${streamSnapshot.error}',
              style: const TextStyle(color: Colors.red),
            ),
          );
        }

        if (!streamSnapshot.hasData || streamSnapshot.data!.docs.isEmpty) {
          return const Center(
            child: Text(
              'No Data Available',
              style: TextStyle(color: Colors.white),
            ),
          );
        }

        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.builder(
            itemCount: streamSnapshot.data!.docs.length,
            itemBuilder: (context, index) {
              final DocumentSnapshot documentSnapshot =
                  streamSnapshot.data!.docs[index];
              Constants.logger.i(documentSnapshot.data());
              return Card(
                child: ListTile(
                  title: Text(
                    documentSnapshot['name'],
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    documentSnapshot['framework'],
                    style: const TextStyle(fontWeight: FontWeight.normal),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
