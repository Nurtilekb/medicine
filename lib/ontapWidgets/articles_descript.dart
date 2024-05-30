
import 'package:flutter/material.dart';

class ArticleScreen extends StatelessWidget {
  final int id;
  final String imagePath;
  
 final String nadpis;

  const ArticleScreen( {
    super.key,
    required this.id,
    required this.imagePath, required this.nadpis,
  });


 
  @override
  Widget build(BuildContext context) {
 


    return Scaffold(
      appBar: AppBar(
        title: null,
        actions: [
          IconButton(
            onPressed: () => showModalBottomSheet<void>(
                context: context,
                isScrollControlled: true,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(20),
                  ),
                ),
                backgroundColor: Theme.of(context).primaryColorLight,
                builder: (context) {return SafeArea(child: Container(
                  height: 300,
                  width: 200,
                  color: Colors.blue,child: const AnimatedIcon(icon:AnimatedIcons.pause_play, progress:kAlwaysDismissedAnimation),));
                }),
            icon: const Icon(
              Icons.format_size_outlined,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.bookmark_border,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.star_border_outlined,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.share_outlined,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.more_horiz_outlined,
            ),
          ),
        ],
      ),
      body: GestureDetector(
        child: Container(
          padding: const EdgeInsets.all(10),
          child: SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              InkWell(
                onTap: (){},
                child:
                    Text('Zuby', style: Theme.of(context).textTheme.displayLarge),
              ),
              const SizedBox(height: 10),
              Text(
                'vce pro tvoi zuby mojo uznat clicay syuda',
                style: Theme.of(context).textTheme.titleSmall,
              ),
              const SizedBox(height: 25),
              Image.asset(imagePath),
              const SizedBox(height: 20),
              Text(
                nadpis,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {},
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: Theme.of(context).primaryColorLight),
                          borderRadius: const BorderRadius.all(Radius.circular(5)),
                        ),
                        height: 55,
                        padding: const EdgeInsets.all(10),
                        margin:
                            const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                        child: const Center(
                          child: Text(
                            'SHARE',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: (){},
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: Theme.of(context).primaryColorLight),
                          borderRadius: const BorderRadius.all(Radius.circular(5)),
                        ),
                        height: 55,
                        padding: const EdgeInsets.all(10),
                        margin:
                            const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                        child: const Center(
                          child: Text(
                            'VISIT WEBSITE',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ]),
          ),
        ),
      ),
    );
  }
}
