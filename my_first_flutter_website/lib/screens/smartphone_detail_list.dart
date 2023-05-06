import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../db/smartphone.dart';

class SmartphoneDetailScreen extends StatelessWidget {
  final Smartphone smartphone;

  const SmartphoneDetailScreen({
    required this.smartphone,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(smartphone.name),
                     flexibleSpace: Container(
                       decoration: const BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: <Color>[Color(0xff33691e), Color(0xff7cb342)]),
                        ),
                      ),),
      body: SafeArea(
        child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Card(
                child: ConstrainedBox(constraints: BoxConstraints(
                  minHeight: 10,
                  minWidth: double.infinity,
                ),
                  child: Padding(
                    padding: EdgeInsets.only(left: 0, right: 0, bottom: 0, top: 0),
                    child: Row(children: [Image.network(smartphone.picture, width: MediaQuery.of(context).size.width / 4,)],),
                  ),)
            )
        ),
      ),
    );
  }
}
