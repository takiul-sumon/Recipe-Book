import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:path_provider/path_provider.dart';

class Home_Page extends StatefulWidget {
  const Home_Page({super.key});

  @override
  State<Home_Page> createState() => _Home_PageState();
}

class _Home_PageState extends State<Home_Page> {
  final String path = 'assets/22234103276.pdf';

  Future<void> loaddata() async {
    final ByteData data = await rootBundle.load('assets/22234103276.pdf');
    final Uint8List bytes = data.buffer.asUint8List();
    final tempDir = await getTemporaryDirectory();
    final file = File('${tempDir.path}/temp_pdf.pdf'); 
    await file.writeAsBytes(bytes); 
    String filePath = file.path;

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => PdfView(path: filePath)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            TextButton(
              onPressed: () {
                loaddata();
              },
              child: Text("Show PDF"),
            ),
          ],
        ),
      ),
    );
  }
}

class PdfView extends StatelessWidget {
  String path;

  PdfView({super.key, required this.path});

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
