//  Copyright © 2019 Lyle Resnick. All rights reserved.

import 'package:flutter/material.dart';
import 'package:flutter_clean_report_demo/Scenes/TransactionList/TransactionList.dart' as TransactionList;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Demo of reporting using Clean Architecture',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TransactionList.Assembly().scene,
    );
  }
}
