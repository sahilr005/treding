import 'dart:convert';
import 'dart:io';
import 'package:bitcoine/HTTPFILR.dart';
import 'package:bitcoine/dioo.dart';
import 'package:http/http.dart' as http;
import 'package:bitcoine/Homepage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

bool redy = false;

class _MyAppState extends State<MyApp> {
  Future<List<stockData>> httpdata() async {
    try {
      var response = await http.get(
          'https://api.polygon.io/v2/aggs/grouped/locale/us/market/stocks/2020-10-14?unadjusted=true&apiKey=EKokJZvTdmf4FFTaRXRxgo8Tli8oR0pL');
      if (response != null && response.statusCode == 200) {
        jsonResponse = stockData.fromjson(jsonDecode(response.body));
        setState(() {});
        // print(await jsonResponse.results.length);
        // print(jsonResponse.results[0].close);
        // print(jsonResponse.results[0].open);
        // print(jsonResponse.results[0].low);
        // print(jsonResponse.results[0].high);
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    setState(() {
      httpdata();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: redy == true ? HomePage() : Nothing(),
      // home: Dataget(),
      // home: Mylinechat(),
    );
  }
}

class Nothing extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text("Wait"),
      ),
    );
  }
}
