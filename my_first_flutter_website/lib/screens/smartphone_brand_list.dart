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
  final textController = TextEditingController();
  final int entries = 20;
  int allEntries = 20;
  bool isLoadingMore = false;
  String search = "";

  @override
  void initState() {
    API().fetchRemoteSmartphones(0, entries, search: search).then((smartphones) {
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
        body: ListView(
          children: [_buildSearchTile(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: GridView.builder(
                  shrinkWrap: true,
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  itemCount: isLoadingMore ? smartphones!.length +1 : smartphones!.length,
                  itemBuilder: (ctx, i) {
                    if(i  < smartphones!.length){
                      return _buildCardView(i);
                    } else {
                      return _buildProgressTile(i);
                    }
                  },
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 5,
                    childAspectRatio: 1.0,
                    crossAxisSpacing: 0.0,
                    mainAxisSpacing: 5,
                    mainAxisExtent: 264,
                  ),
                ),
              ),
            ),
          ],
        controller: scrollController,)
    );
  }

  //Helper Functions

  Widget _buildCardView(int index){
    return Card(
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20)),
        margin: EdgeInsets.all(5),
        padding: EdgeInsets.all(5),
        child:
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 8, 20, 8),
                    child: Image.network(
                      smartphones[index].picture,
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ),
                ListTile(leading: CircleAvatar(backgroundColor: (smartphones[index].score > 6.0) ? Color(0xff00f533) :
                                                                (smartphones[index].score <= 6.0 && smartphones[index].score > 2.0) ? Color(0xffa3ff01) :
                                                                (smartphones[index].score <= 2.0 && smartphones[index].score > -2.0) ? Color(0xffe5dc00) :
                                                                (smartphones[index].score <= -2.0 && smartphones[index].score > -6.0) ? Color(0xffffa200) :
                                                                Color(0xfff54401),
                                                child: Text(smartphones[index].score.toStringAsFixed(1)),
                                                foregroundColor: Colors.black),
                          title: Text(smartphones[index].name),
                          trailing: Icon(Icons.arrow_forward),),
              ],
            ),
      ),
    );
  }

  Widget _buildSmartphoneListTile(int index) {
    final Smartphone currentPhone = smartphones[index];
    return ListTile(title: Text(currentPhone.name), leading: Image.network(currentPhone.picture),);
  }

  Widget _buildSearchTile(){
    return ListTile(title: TextField(controller: textController,textInputAction: TextInputAction.search,
      decoration: InputDecoration(
      border: InputBorder.none,
      prefixIcon: Icon(Icons.search),
      hintText: 'Search ',
      contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
    ),onSubmitted: (text) {
        API().fetchRemoteSmartphones(0,25, search: text).then((smartphones) {
          setState(() {
            this.search = text;
            this.allEntries = entries;
            this.smartphones = smartphones;
          });
        });
    },
    ),);
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
        API().fetchRemoteSmartphones(allEntries, entries, search: search).then((smartphones) {
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