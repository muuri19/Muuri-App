import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PdfViewerComponent extends StatelessWidget {
  final String certificatePdfUrl;
  static const routeName = 'certificate-pdf';
  const PdfViewerComponent({super.key, required this.certificatePdfUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff152A38),
      appBar: AppBar(
        backgroundColor: const Color(0xff152A38),
        title: const Text(
          "PDF Viewer",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.white,
          ),
        ),
      ),
      body: SfPdfViewer.network(certificatePdfUrl),
    );
  }
}
