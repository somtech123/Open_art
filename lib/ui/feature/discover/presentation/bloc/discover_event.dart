import 'package:equatable/equatable.dart';

abstract class DiscoverEvent extends Equatable {}

class SwitchDasbboardTab extends DiscoverEvent {
  final int selectedIndex;

  SwitchDasbboardTab({required this.selectedIndex});

  @override
  List<Object?> get props => [selectedIndex];
}
