class ResponseModel<T> {
  final T? data;
  final Error? error;

  const ResponseModel({
    this.data,
    this.error,
  });
}
