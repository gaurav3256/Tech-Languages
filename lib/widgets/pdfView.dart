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
  //bool loading = true;
  //late PDFDocument pdfDocument;

  /*loadPDF() async {
    pdfDocument = await PDFDocument.fromURL(widget.url);

    setState(() {
      loading = false;
    });
  }*/

  @override
  void initState() {
    super.initState();
    //loadPDF();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name),
      ),
      body: /*loading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          :*/ //PDFViewer(document: pdfDocument),
          SfPdfViewer.network(widget.url),
    );
  }
}
