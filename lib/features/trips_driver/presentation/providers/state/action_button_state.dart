class ActionButtonState {
  final bool isArrived;
  final bool isTripStarted;
  final bool isTripFinished;

  ActionButtonState({
    required this.isArrived,
    required this.isTripStarted,
    required this.isTripFinished,
  });

  ActionButtonState copyWith({
    bool? isArrived,
    bool? isTripStarted,
    bool? isTripFinished,
  }) {
    return ActionButtonState(
      isArrived: isArrived ?? this.isArrived,
      isTripStarted: isTripStarted ?? this.isTripStarted,
      isTripFinished: isTripFinished ?? this.isTripFinished,
    );
  }
}
