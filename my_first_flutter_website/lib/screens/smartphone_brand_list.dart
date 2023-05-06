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

  @override
  void initState() {
    API().fetchRemoteSmartphones().then((smartphones) {
      setState(() {
        this.smartphones = smartphones;
      });
    });
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
        body: ListView.separated(itemBuilder: (context, index) {
          return _buildBrandListTile(index);
        }, separatorBuilder: (_, __) => Divider(),
            itemCount: smartphones.length)
    );
  }

  Widget _buildBrandListTile(int index) {
    final Smartphone currentPhone = smartphones[index];
    return ListTile(title: Text(currentPhone.name),);
  }
}