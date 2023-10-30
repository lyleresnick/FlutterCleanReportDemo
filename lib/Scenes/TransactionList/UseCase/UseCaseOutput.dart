//  Copyright © 2019 Lyle Resnick. All rights reserved.

part of '../TransactionList.dart';

abstract class UseCaseOutput {}

@visibleForTesting
class PresentReport extends UseCaseOutput {
  final PresentationModel model;
  PresentReport(this.model);
}
