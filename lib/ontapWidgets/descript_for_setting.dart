import 'package:flutter/material.dart';

class DescripSettings extends StatefulWidget {
  const DescripSettings({super.key});

  @override
  State<DescripSettings> createState() => _DescripSettingsState();
}

class _DescripSettingsState extends State<DescripSettings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(), body: Container(
      color: Colors.blueGrey,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: [
          Container(height: 60,decoration: BoxDecoration(
            color: Colors.indigo,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              width: 1
            )
          ),),
          SizedBox(height: 8),
           Container(height: 60,decoration: BoxDecoration(
            color: Colors.indigo,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              width: 1
            )
          ),), SizedBox(height: 8),
           Container(height: 60,decoration: BoxDecoration(
            color: Colors.indigo,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              width: 1
            )
          ),), SizedBox(height: 8),
           Container(height: 60,decoration: BoxDecoration(
            color: Colors.indigo,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              width: 1
            )
          ),)
        ],),
      ),
    ));
  }
}
