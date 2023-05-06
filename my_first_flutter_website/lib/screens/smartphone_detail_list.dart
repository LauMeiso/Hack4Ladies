import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

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
      appBar: AppBar(title: Text(smartphone.name)),
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
                      child: SfCartesianChart(primaryXAxis: CategoryAxis(), title: ChartTitle(text: "Score Übersicht"), series: <StackedBarSeries<ChartData, String>>[
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
                          yValueMapper: (ChartData sales, _) => sales.value
                      )
                  ],),
                    ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 40, 0, 0),
                    child: ListView(children: [ListTile(title: Text("Akku"), subtitle: Text("Hier specs"),), ListTile(title: Text("Mehr"), subtitle: Text("hier specs"),), ListTile(title: Text("Noch mehr"), subtitle: Text("hier specs"),)],),
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


