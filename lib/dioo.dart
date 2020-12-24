import 'dart:convert';
import 'package:bitcoine/Homepage.dart';
import 'package:bitcoine/main.dart';
import 'package:http/http.dart' as http;

var res;

class stockData {
  final queryCount;
  final resultsCount;
  dynamic adjusted;
  List<rstock> results;

  stockData({this.queryCount, this.resultsCount, this.adjusted, this.results});
  factory stockData.fromjson(Map<String, dynamic> json) {
    return stockData(
      queryCount: json['queryCount'],
      resultsCount: json['resultsCount'],
      adjusted: json['adjusted'],
      results: _parstokdata(json['results']),
    );
  }
}

_parstokdata(List<dynamic> data) {
  List<rstock> results1 = new List<rstock>();
  data.forEach((item) {
    results1.add(rstock.fromJson(item));
  });
  return results1;
}

_parstokstring(List<dynamic> data) {
  List<String> stockres = List<String>();
  data.forEach((element) {
    stockres.add(element);
  });
  return stockres;
}

class rstock {
  final open;
  final close;
  final high;
  final low;

  rstock({this.open, this.close, this.high, this.low});
  factory rstock.fromJson(Map<String, dynamic> json) {
    redy = true;
    print('redy..........');
    return rstock(
      open: json['o'],
      close: json['c'],
      high: json['h'],
      low: json['l'],
    );
  }
}

// class ResultModel {
//   int count;
//   String next;
//   dynamic previous;
//   List<Result> results;

//   ResultModel({
//     this.count,
//     this.next,
//     this.previous,
//     this.results,
//   });

//   factory ResultModel.fromJson(Map<String, dynamic> json) {
//     return ResultModel(
//       count: json['count'],
//       next: json['next'],
//       previous: json['previous'],
//       results: _parseResult(json['results']),
//     );
//   }
// }

// _parseResult(List<dynamic> data) {
//   List<Result> results = new List<Result>();
//   data.forEach((item) {
//     results.add(Result.fromJson(item));
//   });
//   return results;
// }

// _parseString(List<dynamic> data) {
//   List<String> results = new List<String>();
//   data.forEach((item) {
//     results.add(item);
//   });
//   return results;
// }

// class Result {
//   String name;
//   String height;
//   String url;

//   Result({
//     this.name,
//     this.edited,
//     this.url,
//   });

//   factory Result.fromJson(Map<String, dynamic> json) {
//     return Result(
//       name: json['name'],
//       edited: json['edited'],
//       url: json['url'],
//     );
//   }
// }
