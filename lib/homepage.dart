import 'dart:html';
import 'dart:math';

import 'package:charts_flutter/flutter.dart';
import 'package:charts_flutter_demo/subscriber_chart.dart';
import 'package:charts_flutter_demo/subscriber_series.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  int startYear = 1970;

  SubscriberSeries getRandomSubscriberSeries(int i) {
    startYear++;
    return SubscriberSeries(
        year: i.toString(),
        x: i,
        subscribers: Random().nextInt(500),
        barColor: ColorUtil.fromDartColor(Colors.blue));
  }

  SubscriberSeries getRandomSubscriberSeriesAfter2021(int i) {
    return getRandomSubscriberSeries(i + 2021);
  }

  final List<SubscriberSeries> data = [];

  void loadData() {
    for (var i = 1970; i < 2021; i++) {
      data.add(getRandomSubscriberSeries(i));
    }
  }

  Stream<SubscriberSeries> buildStream() {
    Stream<SubscriberSeries> dataStream = Stream<SubscriberSeries>.periodic(
        Duration(seconds: 1), getRandomSubscriberSeriesAfter2021);
    return dataStream;
  }

  void updateData(SubscriberSeries newData) {
    print("adding data: $newData");
    data.removeAt(0);
    data.add(newData);
  }

  @override
  Widget build(BuildContext context) {
    Stream<SubscriberSeries> stream = buildStream();
    // stream.listen((data) => updateData(data));
    loadData();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text("World of Warcraft Subscribers"),
      ),
      body: Center(
          child: StreamBuilder<SubscriberSeries>(
              stream: stream,
              builder: (context, snapshot) {
                updateData(snapshot.data!);

                return SubscriberChart(
                  data: data,
                );
              })),
    );
  }
}
