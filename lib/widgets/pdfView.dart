import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:flutter/material.dart';

class PDFViewPage extends StatefulWidget {
  final String url;
  final String name;

  const PDFViewPage({Key? key, required this.url, required this.name})
      : super(key: key);

  @override
  State<PDFViewPage> createState() => _PDFViewPageState();
}

class _PDFViewPageState extends State<PDFViewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name),
      ),
      body: SfPdfViewer.network(widget.url),
    );
  }
}
