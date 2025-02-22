import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';

class PdfView extends StatefulWidget {
  PdfView({super.key});

  @override
  State<PdfView> createState() => _PdfViewState();
}

class _PdfViewState extends State<PdfView> {
  final String path = 'assets/22234103276.pdf';
  @override
  Widget build(BuildContext context) {
    return PDFView(
      filePath: path,
      enableSwipe: true,
      swipeHorizontal: false,
      autoSpacing: true,
      pageFling: true,
      backgroundColor: Colors.white,
    );
  }
}
