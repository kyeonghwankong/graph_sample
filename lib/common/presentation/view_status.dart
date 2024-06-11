enum ViewStatus {
  initial,
  loading,
  failure,
  success,
  empty,
}

extension ViewStatusX on ViewStatus {
  bool get isInitial => this == ViewStatus.initial;

  bool get isLoading => this == ViewStatus.loading;

  bool get isFailure => this == ViewStatus.failure;

  bool get isSuccess => this == ViewStatus.success;

  bool get isEmpty => this == ViewStatus.empty;
}
