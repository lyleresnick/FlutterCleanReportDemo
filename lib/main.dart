//  Copyright © 2019 Lyle Resnick. All rights reserved.

import 'package:flutter/material.dart';
import 'scenes/account_details_transaction_list/view/TransactionListScene.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Demo of reporting using Clean Architecture',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TransactionListScene.assembled(),
    );
  }
}
