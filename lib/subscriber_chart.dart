import 'package:charts_flutter_demo/subscriber_series.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart';

class SubscriberChart extends StatelessWidget {
  final List<SubscriberSeries>? data;

  SubscriberChart({@required this.data});

  @override
  Widget build(BuildContext context) {
    List<Series<SubscriberSeries, num>> series = [
      Series(
        id: "Subscribers",
        data: data!,
        domainFn: (series, index) => series.x!,
        measureFn: (series, index) => series.subscribers,
        colorFn: (series, index) => series.barColor!,
        domainLowerBoundFn: (series, index) => 1970,
        domainUpperBoundFn: (series, index) => 2021,
      )
    ];

    return Container(
      height: 400,
      padding: EdgeInsets.all(20),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              Text(
                "World of Warcraft Subscribers by Year",
                style: Theme.of(context).textTheme.bodyText2,
              ),
              Expanded(
                  child: LineChart(series,
                      animate: false,
                      domainAxis: NumericAxisSpec(
                          // let the x-axis run from the 1970 - 2022
                          tickProviderSpec:
                              BasicNumericTickProviderSpec(zeroBound: false)))),
            ],
          ),
        ),
      ),
    );
  }
}
