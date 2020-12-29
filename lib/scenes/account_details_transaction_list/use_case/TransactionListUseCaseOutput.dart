//  Copyright © 2019 Lyle Resnick. All rights reserved.
import 'package:flutter_clean_report_demo/entities/TransactionGroup.dart';

abstract class TransactionListUseCaseOutput {}

// ViewReady
class PresentInit extends TransactionListUseCaseOutput {}
class PresentHeader extends TransactionListUseCaseOutput { final TransactionGroup group; PresentHeader(this.group);}
class PresentSubheader extends TransactionListUseCaseOutput { final DateTime date; PresentSubheader(this.date);}
class PresentDetail extends TransactionListUseCaseOutput { final String description; final double amount; PresentDetail(this.description, this.amount);}
class PresentSubfooter extends TransactionListUseCaseOutput {}
class PresentFooter extends TransactionListUseCaseOutput { final double total; PresentFooter(this.total);}
class PresentGrandFooter extends TransactionListUseCaseOutput { final double grandTotal; PresentGrandFooter(this.grandTotal);}
class PresentGroupNotFoundMessage extends TransactionListUseCaseOutput { final TransactionGroup group; PresentGroupNotFoundMessage(this.group);}
class PresentNoTransactionsMessage extends TransactionListUseCaseOutput { final TransactionGroup group; PresentNoTransactionsMessage(this.group);}
class PresentNotFoundMessage extends TransactionListUseCaseOutput {}
class PresentReport extends TransactionListUseCaseOutput {}
