import 'package:equatable/equatable.dart';

abstract class DashboardEvent extends Equatable {}

class SwitchDasbboardTab extends DashboardEvent {
  final int selectedIndex;

  SwitchDasbboardTab({required this.selectedIndex});

  @override
  List<Object?> get props => [selectedIndex];
}
