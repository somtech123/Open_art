// ignore_for_file: override_on_non_overriding_member

class DiscoverState {
  int tabIndex;

  DiscoverState({
    this.tabIndex = 0,
  });

  DiscoverState copyWith({int? tabIndex}) =>
      DiscoverState(tabIndex: tabIndex ?? this.tabIndex);

  @override
  List<Object?> get props => [tabIndex];
}
