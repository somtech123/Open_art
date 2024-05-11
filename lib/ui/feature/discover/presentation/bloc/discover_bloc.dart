// ignore_for_file: invalid_use_of_visible_for_testing_member

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open_art/app/resouces/app_logger.dart';
import 'package:open_art/ui/feature/discover/presentation/bloc/discover_event.dart';
import 'package:open_art/ui/feature/discover/presentation/bloc/discover_state.dart';

var log = getLogger('Dashboard_bloc');

class DiscoverBloc extends Bloc<DiscoverEvent, DiscoverState> {
  DiscoverBloc() : super(DiscoverState(tabIndex: 0)) {
    on<SwitchDasbboardTab>((event, emit) => switchtab(event.selectedIndex));
  }

  switchtab(int index) {
    emit(state.copyWith(tabIndex: index));
    log.d(state.tabIndex);
  }
}
