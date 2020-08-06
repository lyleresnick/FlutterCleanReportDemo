//  Copyright © 2017 Lyle Resnick. All rights reserved.

import 'package:flutter/material.dart';
import '../../presenter/TransactionListRowViewModel.dart';
import 'TransactionListHeaderCell.dart';
import 'TransactionListSubheaderCell.dart';
import 'TransactionListDetailCell.dart';
import 'TransactionListSubfooterCell.dart';
import 'TransactionListFooterCell.dart';
import 'TransactionListGrandFooterCell.dart';
import 'TransactionListMessageCell.dart';


abstract class TransactionListCell extends StatelessWidget {

    TransactionListCell({@required TransactionListRowViewModel row});

    factory TransactionListCell.from({ @required TransactionListRowViewModel row}) {
        switch (row.cellId) {
            case CellId.header:
                return TransactionListHeaderCell(row: row);
            case CellId.subheader:
                return TransactionListSubheaderCell(row: row);
            case CellId.detail:
                return TransactionListDetailCell(row: row);
            case CellId.subfooter:
                return TransactionListSubfooterCell(row: row);
            case CellId.footer:
                return TransactionListFooterCell(row: row);
            case CellId.grandfooter:
                return TransactionListGrandFooterCell(row: row);
            case CellId.message:
                return TransactionListMessageCell(row: row);
            default:
                return null;
        }
    }

    Color backgroundColour(bool odd) {

        final backgroundRgb = odd ? 0xFFF7F8FC : 0xFFDDDDDD;
        return Color(backgroundRgb);
    }
}

