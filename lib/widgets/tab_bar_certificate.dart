import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../components/pdf_viewer_component.dart';
import '../utils/constant.dart';

class TabBarCertificate extends StatefulWidget {
  const TabBarCertificate({super.key});

  @override
  State<TabBarCertificate> createState() => _TabBarCertificateState();
}

class _TabBarCertificateState extends State<TabBarCertificate> {
  final CollectionReference myProject =
      FirebaseFirestore.instance.collection("certificate");
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

              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PdfViewerComponent(
                        certificatePdfUrl: documentSnapshot['certificate_pdf'],
                      ),
                    ),
                  );
                },
                child: Card(
                  child: ListTile(
                    title: Text(
                      documentSnapshot['title'],
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      documentSnapshot['company'],
                      style: const TextStyle(fontWeight: FontWeight.normal),
                    ),
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
