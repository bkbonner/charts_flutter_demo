import 'package:flutter/foundation.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class SubscriberSeries {
  final String? year;
  final int? x;
  final int? subscribers;
  final charts.Color? barColor;

  SubscriberSeries(
      {@required this.year,
      @required this.x,
      @required this.subscribers,
      @required this.barColor});
}
