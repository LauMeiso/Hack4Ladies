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
    final List<Color> color = <Color>[];
    color.add(Colors.red!);
    color.add(Colors.green!);

    final List<double> stops = <double>[];
    stops.add(-5.0);
    stops.add(5.0);

    final LinearGradient gradientColors =
    LinearGradient(colors: color, stops: stops);

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
                      child: SfCartesianChart(primaryXAxis: CategoryAxis(),
                                              primaryYAxis: NumericAxis(visibleMinimum:-10,
                                                                        visibleMaximum:10),
                                              title: ChartTitle(text: "Score Übersicht"),
                                              series: <StackedBarSeries<ChartData, String>>[
                        StackedBarSeries<ChartData, String>(
                        // Bind data source
                          dataSource:  <ChartData>[
                            ChartData('Energie', smartphone.energie),
                            ChartData('Recycling', smartphone.recycling),
                            ChartData('Langlebigkeit', smartphone.langlebigkeit),
                            ChartData('Umweltverschmutzung', smartphone.umweltverschmutzung),
                            ChartData('Soziale Verantwortung', smartphone.soziale_verantwortung),
                            ChartData('Faire Arbeitsbedingungen', smartphone.faire_arbeitsbedingungen),
                            ChartData('Transparenz', smartphone.transparenz)
                          ],
                          xValueMapper: (ChartData sales, _) => sales.categroy,
                          yValueMapper: (ChartData sales, _) => sales.value,
                          gradient: gradientColors
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
  ChartData(this.categroy, this.value);
  final String categroy;
  final int value;
}


