// ignore_for_file: override_on_non_overriding_member

class DashboardState {
  int tabIndex;

  DashboardState({
    this.tabIndex = 0,
  });

  DashboardState copyWith({int? tabIndex}) =>
      DashboardState(tabIndex: tabIndex ?? this.tabIndex);

  @override
  List<Object?> get props => [tabIndex];
}
