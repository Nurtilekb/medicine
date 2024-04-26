import 'package:flutter/material.dart';

class ArcFirst extends StatelessWidget {
  const ArcFirst({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Container(
          color: Colors.blueGrey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(),
          ),
        ));
  }
}
