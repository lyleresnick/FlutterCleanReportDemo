//  Copyright © 2017 Lyle Resnick. All rights reserved.

import 'package:flutter/material.dart';

abstract class TransactionListCell extends StatelessWidget {
  Color backgroundColour(bool odd) {
    final backgroundRgb = odd ? 0xFFF7F8FC : 0xFFDDDDDD;
    return Color(backgroundRgb);
  }
}
