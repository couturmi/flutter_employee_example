import 'package:flutter_bloc/flutter_bloc.dart';

/// Type of view for the screen
enum ViewType { manager, normal }

/// Bloc to manage the type of view to be displayed
class ViewTypeBloc extends Bloc<ViewType, ViewType> {
  /// Initial ViewType for the Bloc
  ViewType _initialViewType;

  ViewTypeBloc(this._initialViewType);

  @override
  ViewType get initialState => _initialViewType;

  @override
  Stream<ViewType> mapEventToState(ViewType type) async* {
    yield type;
  }
}
