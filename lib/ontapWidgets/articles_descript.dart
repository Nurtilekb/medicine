
import 'package:flutter/material.dart';

class ArticleScreen extends StatelessWidget {
  final int id;
  final String imagePath;
  
 final String nadpis;

  const ArticleScreen( {
    Key? key,
    required this.id,
    required this.imagePath, required this.nadpis,
  }) : super(key: key);


  Future<void> _launchInBrowser(String url) async {}

  @override
  Widget build(BuildContext context) {
 
   

    String swipeDirection = '';
    return Scaffold(
      appBar: AppBar(
        title: null,
        actions: [
          IconButton(
            onPressed: () => showModalBottomSheet<void>(
                context: context,
                isScrollControlled: true,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(20),
                  ),
                ),
                backgroundColor: Theme.of(context).primaryColorLight,
                builder: (context) {return Container(color: Colors.red,);
                }),
            icon: Icon(
              Icons.format_size_outlined,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.bookmark_border,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.star_border_outlined,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.share_outlined,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.more_horiz_outlined,
            ),
          ),
        ],
      ),
      body: GestureDetector(
        onHorizontalDragUpdate: (details) {
          swipeDirection = details.delta.dx < 0 ? 'left' : 'right';
        },
        onHorizontalDragEnd: (details) {
          print('id=$id');
          if (swipeDirection == 'left') {
            if (id == 2) {
              Navigator.pop(context);
              return;
            }

            
          }
          if (swipeDirection == 'right') {
            if (id == 0) {
              Navigator.pop(context);
              return;
            }
         
          }
        },
        child: Container(
          padding: EdgeInsets.all(10),
          child: SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              InkWell(
                onTap: () => _launchInBrowser('ec'),
                child:
                    Text('Zuby', style: Theme.of(context).textTheme.headline1),
              ),
              SizedBox(height: 10),
              Text(
                'vce pro tvoi zuby mojo uznat clicay syuda',
                style: Theme.of(context).textTheme.subtitle2,
              ),
              SizedBox(height: 25),
              Image.network(imagePath),
              SizedBox(height: 20),
              Text(
                nadpis,
                style: Theme.of(context).textTheme.bodyText1,
              ),
              SizedBox(
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
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                        ),
                        height: 55,
                        padding: EdgeInsets.all(10),
                        margin:
                            EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                        child: Center(
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
                      onTap: () => _launchInBrowser('wecw',),
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: Theme.of(context).primaryColorLight),
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                        ),
                        height: 55,
                        padding: EdgeInsets.all(10),
                        margin:
                            EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                        child: Center(
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
