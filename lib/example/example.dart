import 'package:date_ranger/date_ranger.dart';
import 'package:flutter/material.dart';

class TestPack extends StatefulWidget {
  @override
  _TestPackState createState() => _TestPackState();
}

class _TestPackState extends State<TestPack> {
  var initialDate = DateTime.now();
  var initialDateRange =
      DateTimeRange(start: DateTime.now(), end: DateTime.now());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(),
        Padding(
          padding: const EdgeInsets.all(24),
          child: singleDatePicker() /*or  dateRangePicker() */,
        )
      ],
    ));
  }

  DateRanger singleDatePicker() {
    return DateRanger(
      initialDate: initialDate,
      rangerType: DateRangerType.single,
      onRangeChanged: (range) {
        setState(() {
          initialDate = range.start;
        });
      },
    );
  }

  DateRanger dateRangePicker() {
    return DateRanger(
      initialRange: initialDateRange,
      onRangeChanged: (range) {
        setState(() {
          initialDateRange = range;
        });
      },
    );
  }
}
