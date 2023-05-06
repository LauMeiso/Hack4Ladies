import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_first_flutter_website/networking/api.dart';
import 'package:my_first_flutter_website/screens/smartphone_detail_list.dart';
import 'package:radio_grouped_buttons/custom_buttons/custom_radio_buttons_group.dart';

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
  String pageTitle = "Fairy Tell";
  List<Smartphone> smartphones = [];
  final scrollController = ScrollController();
  final textController = TextEditingController();
  final int entries = 20;
  int allEntries = 20;
  bool isLoadingMore = false;
  String search = "";
  int selection = 0;

  @override
  void initState() {
    API().fetchRemoteSmartphones(0, entries, selection, search: search).then((smartphones) {
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
          children: [_buildSortTile(),_buildSearchTile(),
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
                ListTile(leading: CircleAvatar(child: Text(smartphones[index].score.toStringAsFixed(1))), title: Text(smartphones[index].name), trailing: Icon(Icons.arrow_forward), onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SmartphoneDetailScreen(smartphone: smartphones[index])),
                  );
                },),
              ],
            ),
      ),
    );
  }

  Widget _buildSearchTile(){
    return ListTile(title: TextField(controller: textController,textInputAction: TextInputAction.search,
      decoration: InputDecoration(
      border: InputBorder.none,
      prefixIcon: Icon(Icons.search),
      hintText: 'Search ',
      contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
    ),onSubmitted: (text) {
        API().fetchRemoteSmartphones(0,25, selection, search: text).then((smartphones) {
          setState(() {
            this.search = text;
            this.allEntries = entries;
            this.smartphones = smartphones;
          });
        });
    },
    ),);
  }

  List<String> buttonList=[
    "Energie","Recycling","Langlebigkeit","Umweltverschmutzung","Soziale Verantwortung","Faire Arbeitsbedingungen","Transparenz"];
  List<int> buttonValue=[
    0,1,2,3,4,5,6];

  Widget _buildSortTile(){
    return Container(
      padding: EdgeInsets.all(10),
      width: MediaQuery.of(context).size.width,
      child: CustomRadioButton(
        buttonLables: buttonList,
        buttonValues: buttonList,
        radioButtonValue: (label, value)=> {
          selection = value,
          API().fetchRemoteSmartphones(allEntries, entries, selection, search: search).then((smartphones) {
            setState(() {
              this.smartphones = smartphones;
            });
          }),
        },
        horizontal: true,
        enableShape: true,
        buttonSpace: 4,
        buttonColor: Colors.white,
        selectedColor: Colors.cyan,
      //  buttonWidth: 350,
      ),
    );
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
        API().fetchRemoteSmartphones(allEntries, entries, selection, search: search).then((smartphones) {
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