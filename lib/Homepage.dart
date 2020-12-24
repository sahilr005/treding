import 'dart:convert';
import 'dart:io';
import 'package:bitcoine/dioo.dart';
import 'package:bitcoine/main.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

final List<Color> gridcolors = [
  const Color(0xff23b6e6),
  const Color(0xff02d39a),
];

stockData jsonResponse;

class _HomePageState extends State<HomePage> {
  // void gettt() async {
  //   var url =
  //       'https://api.polygon.io/v2/aggs/grouped/locale/us/market/stocks/2020-10-14?unadjusted=true&apiKey=EKokJZvTdmf4FFTaRXRxgo8Tli8oR0pL';
  //   var response = await http.get(
  //     url,
  //     headers: {
  //       HttpHeaders.authorizationHeader: "EKokJZvTdmf4FFTaRXRxgo8Tli8oR0pL"
  //     },
  //   );
  //   print(response.body);
  // }

  @override
  Widget build(BuildContext context) {
    redy == true ? setState(() {}) : HttpDate();
    return Scaffold(
      appBar: AppBar(
        title: Text("Treding"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            _getDefaultLineChart(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Table(
                columnWidths: {1: FractionColumnWidth(0.2)},
                border: TableBorder.all(),
                children: [
                  TableRow(children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('open'),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('close'),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Change'),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Heig \$'),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Low \$'),
                    ),
                  ]),
                  TableRow(children: [
                    Text(jsonResponse.results[0].open.toString()),
                    Text(jsonResponse.results[0].close.toString()),
                    Text('0%'),
                    Text(jsonResponse.results[0].high.toString()),
                    Text(jsonResponse.results[0].low.toString()),
                  ]),
                  TableRow(children: [
                    Text(jsonResponse.results[1].open.toString()),
                    Text(jsonResponse.results[1].close.toString()),
                    Text('0%'),
                    Text(jsonResponse.results[1].high.toString()),
                    Text(jsonResponse.results[1].low.toString()),
                  ]),
                  TableRow(children: [
                    Text(jsonResponse.results[2].open.toString()),
                    Text(jsonResponse.results[2].close.toString()),
                    Text('0%'),
                    Text(jsonResponse.results[2].high.toString()),
                    Text(jsonResponse.results[2].low.toString()),
                  ]),
                  TableRow(children: [
                    Text(jsonResponse.results[3].open.toString()),
                    Text(jsonResponse.results[3].close.toString()),
                    Text('0%'),
                    Text(jsonResponse.results[3].high.toString()),
                    Text(jsonResponse.results[3].low.toString()),
                  ]),
                  TableRow(children: [
                    Text(jsonResponse.results[4].open.toString()),
                    Text(jsonResponse.results[4].close.toString()),
                    Text('0%'),
                    Text(jsonResponse.results[4].high.toString()),
                    Text(jsonResponse.results[4].low.toString()),
                  ]),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

SfCartesianChart _getDefaultLineChart() {
  return SfCartesianChart(
    plotAreaBorderWidth: 0,
    title: ChartTitle(text: "\$ 23,605.00"),
    legend: Legend(isVisible: true, overflowMode: LegendItemOverflowMode.wrap),
    primaryXAxis: NumericAxis(
        edgeLabelPlacement: EdgeLabelPlacement.shift,
        interval: 2,
        majorGridLines: MajorGridLines(width: 0)),
    primaryYAxis: NumericAxis(
        labelFormat: '{value}',
        axisLine: AxisLine(width: 0),
        majorTickLines: MajorTickLines(color: Colors.transparent)),
    series: _getDefaultLineSeries(),
    tooltipBehavior: TooltipBehavior(enable: true),
  );
}

/// The method returns line series to chart.
///
List<LineSeries<_ChartData, num>> _getDefaultLineSeries() {
  final List<_ChartData> chartData = <_ChartData>[
    _ChartData(2005, jsonResponse.results[0].high, 28),
    _ChartData(2006, jsonResponse.results[1].high, 44),
    _ChartData(2007, jsonResponse.results[2].high, 48),
    _ChartData(2008, jsonResponse.results[3].high, 50),
    _ChartData(2009, jsonResponse.results[4].high, 66),
    _ChartData(2010, jsonResponse.results[5].high, 78),
    _ChartData(2011, jsonResponse.results[6].high, 84),
    _ChartData(2012, jsonResponse.results[7].high, 54),
    _ChartData(2013, jsonResponse.results[8].high, 84),
  ];

  return <LineSeries<_ChartData, num>>[
    LineSeries<_ChartData, num>(
        animationDuration: 1500,
        dataSource: chartData,
        isVisible: true,
        enableTooltip: true,
        isVisibleInLegend: false,
        xValueMapper: (_ChartData sales, _) => sales.x,
        yValueMapper: (_ChartData sales, _) => sales.y,
        width: 2,
        name: 'Germany',
        markerSettings: MarkerSettings(
          isVisible: true,
        )),
  ];
}

class _ChartData {
  _ChartData(this.x, this.y, this.y2);
  final double x;
  final double y;
  final double y2;
}
