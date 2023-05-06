import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_first_flutter_website/networking/api.dart';

import '../db/smartphone.dart';


class SmartphoneListScreen extends StatefulWidget {
  const SmartphoneListScreen({super.key, required this.title});
  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<SmartphoneListScreen> createState() => _SmartphoneListScreenState();
}

class _SmartphoneListScreenState extends State<SmartphoneListScreen> {
  String pageTitle = "Smartphones";
  List<Smartphone> smartphones = [];
  final scrollController = ScrollController();
  final int entries = 20;
  int allEntries = 20;
  bool isLoadingMore = false;

  @override
  void initState() {
    API().fetchRemoteSmartphones(0, entries).then((smartphones) {
      setState(() {
        this.smartphones = smartphones;
      });
    });
    scrollController.addListener((_scrollListener));
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text(pageTitle),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.separated(itemBuilder: (context, index) {
            if(index < smartphones!.length){
              return _buildSmartphoneListTile(index);
            } else {
              return _buildProgressTile(index);
            }
          }, separatorBuilder: (_, __) => Divider(),
              itemCount: isLoadingMore ? smartphones!.length +1 : smartphones!.length ,
          controller: scrollController,
          physics:  const AlwaysScrollableScrollPhysics(),),
        )
    );
  }

  //Helper Functions

  Widget _buildSmartphoneListTile(int index) {
    final Smartphone currentPhone = smartphones[index];
    return ListTile(title: Text(currentPhone.name), leading: Image.network(currentPhone.picture),);
  }

  Widget _buildProgressTile(int index){
    return Center(child: CircularProgressIndicator(),);
  }

  Future<void> _scrollListener() async {
    if(scrollController.position.pixels == scrollController.position.maxScrollExtent){
      allEntries = allEntries + entries;
      setState(() {
        isLoadingMore = true;
      });
      Future.delayed(Duration(seconds: 1), () {
        API().fetchRemoteSmartphones(allEntries, entries).then((smartphones) {
          setState(() {
            this.smartphones = this.smartphones + smartphones;
          });
        });
        setState(() {
          isLoadingMore = false;
        });
      });
    }
  }
}