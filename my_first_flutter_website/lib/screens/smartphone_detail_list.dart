import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../extensions/string_extension.dart';

import '../db/smartphone.dart';

class SmartphoneDetailScreen extends StatelessWidget {
  final Smartphone smartphone;

  const SmartphoneDetailScreen({
    required this.smartphone,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<ChartData> chartData = [
      ChartData('Energie', smartphone.energie, Color(0xffe5db01)),
      ChartData('Recycling', smartphone.recycling, Color(0xff664f41)),
      ChartData('Langlebigkeit', smartphone.langlebigkeit, Color(0xffe67a00)),
      ChartData('Umweltverschmutzung', smartphone.umweltverschmutzung, Color(0xff42b315)),
      ChartData('Soziale Verantwortung', smartphone.soziale_verantwortung, Color(0xffe52f8f)),
      ChartData('Faire Arbeitsbedingungen', smartphone.faire_arbeitsbedingungen, Color(0xffa960e6)),
      ChartData('Transparenz', smartphone.transparenz, Color(0xff2b94e6))
    ];

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
                    padding: EdgeInsets.only(left: 0, right: 0, bottom: 0, top: 20),
                    child: GridView.count(crossAxisCount: 3, children: [Image.network(smartphone.picture,), Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SfCartesianChart(primaryXAxis: CategoryAxis(isInversed: true),
                                              primaryYAxis: NumericAxis(visibleMinimum:-10,
                                                                        visibleMaximum:10),
                                              title: ChartTitle(text: "Score Übersicht"),
                                              series: <StackedBarSeries<ChartData, String>>[
                        StackedBarSeries<ChartData, String>(
                        // Bind data source
                          dataSource:  chartData,
                          xValueMapper: (ChartData sales, _) => sales.categroy,
                          yValueMapper: (ChartData sales, _) => sales.value,
                          pointColorMapper: (ChartData sales, _) => sales.color
                      )
                  ],),
                    ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 40, 0, 0),
                    child: ListView(children: [
                      ListTile(title: Text("Veröffentlicht"), subtitle: Text(smartphone.released_at),),
                      ListTile(title: Text("Betriebssystem"), subtitle: Text(smartphone.os),),
                      ListTile(title: Text("Akku"),
                        subtitle: Text("Größe: ${smartphone.battery_size} \n"
                                       "Art: ${smartphone.battery_type}"),),
                      ListTile(title: Text("RAM"), subtitle: Text(smartphone.ram.nonBreaking),),
                      ListTile(title: Text("Speicher"), subtitle: Text(smartphone.storage),),
                      ListTile(title: Text("Display"),
                        subtitle: Text("Auflösung: ${smartphone.display_resolution} \n "
                                       "Größe: ${smartphone.display_resolution}"),),
                      ListTile(title: Text("Kamera"), subtitle: Text(smartphone.camera_pixels),)
                    ],),
                  )]),)
            )
        ),
      ),
    ));
  }
}

class ChartData {
  ChartData(this.categroy, this.value, this.color);
  final String categroy;
  final int value;
  final Color? color;
}


