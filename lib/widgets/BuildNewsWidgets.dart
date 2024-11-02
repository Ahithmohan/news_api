import 'package:flutter/material.dart';

class BuildNewsWidgets extends StatefulWidget {
  final String imgUrl;
  final String newsHeading;
  final String newsDis;

  const BuildNewsWidgets(
      {super.key,
      required this.imgUrl,
      required this.newsHeading,
      required this.newsDis});

  @override
  State<BuildNewsWidgets> createState() => _BuildNewsWidgetsState();
}

class _BuildNewsWidgetsState extends State<BuildNewsWidgets> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 2,
            width: MediaQuery.of(context).size.width,
            child: Image.network(
              fit: BoxFit.cover,
              widget.imgUrl,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Card(
            color: Colors.transparent,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    widget.newsHeading,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    widget.newsDis,
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
