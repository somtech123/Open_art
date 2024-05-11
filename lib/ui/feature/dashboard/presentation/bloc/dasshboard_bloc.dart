import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open_art/ui/feature/dashboard/presentation/bloc/dashboard_event.dart';
import 'package:open_art/ui/feature/dashboard/presentation/bloc/dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  DashboardBloc() : super(DashboardState()) {}
}
