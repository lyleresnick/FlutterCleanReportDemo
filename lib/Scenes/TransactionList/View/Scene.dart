//  Copyright © 2019 Lyle Resnick. All rights reserved.

part of '../TransactionList.dart';

@visibleForTesting
class Scene extends StatefulWidget {
  final Presenter _presenter;

  Scene(this._presenter);

  @override
  State<Scene> createState() => _SceneState();
}

class _SceneState extends State<Scene> {
  late final Presenter _presenter;

  @override
  void initState() {
  super.initState();
  this._presenter = widget._presenter;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Transaction List'),
          backgroundColor: brandColor,
          elevation: Theme.of(context).platform == TargetPlatform.iOS ? 0.0 : 4.0,
        ),
        body: BlocProvider<Presenter>(
          bloc: _presenter,
          child: SafeArea(
              child: StreamBuilder<PresenterOutput>(
                  stream: _presenter.stream,
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return Text("Loading ...");
                    }
                    final data = snapshot.data!;
                    return switch (data) {
                      ShowReport(:final model) => ListView.builder(
                            itemCount: model.rows.length,
                            itemBuilder: (context, index) {
                              return model.rows[index]._cell;
                            }),
                    };
                  })),
        ));
  }
}

extension on RowViewModel {
  Cell get _cell {
    return switch (this) {
      HeaderRowViewModel() => HeaderCell(row: this),
      SubheaderRowViewModel() => SubheaderCell(row: this),
      DetailViewModel() => DetailCell(row: this),
      SubfooterRowViewModel() => SubfooterCell(row: this),
      FooterRowViewModel() => FooterCell(row: this),
      GrandFooterRowViewModel() => GrandFooterCell(row: this),
      MessageRowViewModel() => MessageCell(row: this),
    };
  }
}
