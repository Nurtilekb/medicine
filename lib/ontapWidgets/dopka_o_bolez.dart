import 'package:flutter/material.dart';

class Dopkaprobolez extends StatelessWidget {
  const Dopkaprobolez({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            const Text('                              Все ваши избранные'),
            Card(
                child: SizedBox(
              height: 120,
              width: MediaQuery.of(context).size.width,
              child:  const Text('data'),
            )),
            Align(child: FloatingActionButton(onPressed: (){Navigator.pop(context);},child:const Icon(Icons.arrow_back) ,),)
          ],
        ),
      ),
    );
   
  }
}
