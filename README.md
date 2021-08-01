# Date Ranger

A date picker for flutter apps to pick single dates and date ranges

<img src="https://github.com/funyin/date_ranger/blob/master/assets/demo.gif?raw=true" height="350em"></img><img src="https://raw.githubusercontent.com/funyin/date_ranger/master/assets/single_picker.png" height="350em"></img>

## Usage

To use this package first add the dependency to you [pubspec.yaml] file
```yaml
dependencies:
  flutter:
    sdk: flutter
  date_ranger: 
```

[Example](https://github.com/funyin/date_ranger/blob/master/lib/example/example.dart)

```dart
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
          child:  DateRanger(
          initialRange: initialDateRange,
          onRangeChanged: (range) {
            setState(() {
              initialDateRange = range;
            });
          },
        ),
        )
      ],
    ));
  }
}
```


## Features
* Layout-agnostic: Conforms to any width by calculating its height internally
* Simple architecture: Built with default flutter architecture without depending on other state management packages
* Highly customisable:  Almost every thing can be changed including dimensions since dimensions are adjusted internally
* Picker types:  You can swap between a regular date picker and a date range picker easily.

***
[![BuyMeAShawrma.png](https://cdn.hashnode.com/res/hashnode/image/upload/v1619907239535/KqJOyu-70.png)](https://www.buymeacoffee.com/funyinkash) 
