//  Copyright © 2017 Lyle Resnick. All rights reserved.

part of '../../TransactionList.dart';

abstract class Cell extends StatelessWidget {
  Color backgroundColour(bool odd) {
    final backgroundRgb = odd ? 0xFFF7F8FC : 0xFFDDDDDD;
    return Color(backgroundRgb);
  }

  static double headerHeight = 60;
  static double subheaderHeight = 34;
  static double detailHeight = 18;
  static double subfooterHeight = 12;
  static double footerHeight = 44;
  static double grandFooterHeight = 60;
  static double messageHeight = 100;
}
