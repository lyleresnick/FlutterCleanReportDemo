//  Copyright © 2019 Lyle Resnick. All rights reserved.

part of '../TransactionList.dart';

sealed class PresenterOutput {}

@visibleForTesting
class ShowReport extends PresenterOutput {
  final ViewModel model;
  ShowReport(this.model);
}
