//  Copyright © 2017 Lyle Resnick. All rights reserved.

import 'package:flutter/material.dart';
import '../../presenter/TransactionListRowViewModel.dart';
import '../../view/cells/TransactionListHeaderCell.dart';
import '../../view/cells/TransactionListSubheaderCell.dart';
import '../../view/cells/TransactionListDetailCell.dart';
import '../../view/cells/TransactionListSubfooterCell.dart';
import '../../view/cells/TransactionListFooterCell.dart';
import '../../view/cells/TransactionListGrandFooterCell.dart';
import '../../view/cells/TransactionListMessageCell.dart';


abstract class TransactionListCell extends StatelessWidget {

    Color _backgroundColor;

    TransactionListCell({@required TransactionListRowViewModel row});

    factory TransactionListCell.from({CellId cellId, TransactionListRowViewModel row}) {
        switch (cellId) {
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

    void _setBackgroundColour(bool odd) {

        final backgroundRgb = odd ? 0xF7F8FC : 0xDDDDDD;
        _backgroundColor = Color(backgroundRgb);
    }
}

