import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:tech_languages/widgets/pdfView.dart';
import '../../../util/base_url.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class Body extends StatefulWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  bool loading = true;
  late List pdfList;

  Future fetchAllPDF() async {
    final response = await http.get(Uri.parse(API.pdfFile));

    if (response.statusCode == 200) {
      setState(() {
        pdfList = jsonDecode(response.body);
        loading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    fetchAllPDF();
  }

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      headerSliverBuilder: (context, innerBoxIsScrolled) => [
        SliverAppBar(
          backgroundColor: kPrimaryColor,
          elevation: 5,
          expandedHeight: 240,
          flexibleSpace: FlexibleSpaceBar(
            title: const Text('Flutter Development'),
            background: Image.network(
              'https://images.unsplash.com/photo-1617040619263-41c5a9ca7521?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8Zmx1dHRlcnxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60',
              fit: BoxFit.cover,
            ),
          ),
          floating: true,
          snap: true,
          pinned: true,
          leading: SizedBox(
            height: getProportionateScreenWidth(40),
            width: getProportionateScreenWidth(40),
            child: MaterialButton(
              onPressed: () => Navigator.pop(context),
              child: const Icon(Icons.arrow_back, color: Colors.white),
            ),
          ),
          actions: const [
            Icon(Icons.search, color: Colors.white),
            SizedBox(width: 12),
          ],
        )
      ],
      body: loading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.separated(
              shrinkWrap: true,
              padding: const EdgeInsets.only(top: 20, bottom: 80),
              itemBuilder: (_, index) {
                return Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: <Widget>[
                          Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 15, horizontal: 20),
                            width: SizeConfig.screenWidth - 40,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(50),
                              boxShadow: [
                                BoxShadow(
                                  offset: const Offset(0, 10),
                                  blurRadius: 30,
                                  color:
                                      const Color(0xFFD3D3D3).withOpacity(.50),
                                ),
                              ],
                            ),
                            child: Row(
                              children: <Widget>[
                                RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: pdfList[index]["material_name"],
                                        style: const TextStyle(
                                          fontSize: 16,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const Spacer(),
                                IconButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => PDFViewPage(
                                            url: "${API.pdfMaterial}/" +
                                                pdfList[index]["file_name"],
                                            name: pdfList[index]
                                                ["material_name"]),
                                      ),
                                    );
                                  },
                                  icon: const Icon(
                                    Icons.arrow_forward_ios,
                                    size: 18,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
              separatorBuilder: (_, __) {
                return const SizedBox(height: 20);
              },
              itemCount: pdfList.length,
            ),
    );
  }
}
