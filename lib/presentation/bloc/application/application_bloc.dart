import 'package:flutter_bloc/flutter_bloc.dart';
import 'application_event.dart';
import 'application_state.dart';

class ApplicationBloc extends Bloc<ApplicationEvent, ApplicationState> {
  ApplicationBloc(ApplicationState initialState) : super(initialState);

  static String _token = "";

  @override
  Stream<ApplicationState> mapEventTosate(ApplicationEvent event) async* {
    if (event is ApplicationEvent) {
      if (_token.isEmpty) {
        yield ApplicationState.desautenticado();
      } else {
        yield ApplicationState.autenticando();
      }
    }

    if (event is ApplicationLoginEvent) {
      _token = event.token;
      yield ApplicationState.autenticando();
    }
  }
}
