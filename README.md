# FlutterCleanReportDemo - VIPER Style with BLoCs


This Flutter app demonstrates an architectual solution to a fairly complex banking report scene.

It shows how VIPER can be used to break up a potentially very Massive Flutter Scene by introducing the following classes:

- a Use Case which transforms its input Model to an output protocol -- there are two transformers: one processes data originating from two separate input streams, the other processes data originating from a single stream
- a Presenter, which transforms its input Model (as defined by the output protocol from the Use Case) into a ViewModel. The presenter retains the View Model to act as data source for the TableView
Note that the view models used here are not the ViewModels implied by the MVVM pattern

The app is based on the BLoC/BLoc Provider pattern. Each module's Presenter and UseCase is implemented as a BLoC. A BLoC uses a stream to return asynchronous events. Each Scene view uses a StreamBuilder to drive the display from events emitted by the Presenter. The Presenter processes the events emitted by the UseCase.
