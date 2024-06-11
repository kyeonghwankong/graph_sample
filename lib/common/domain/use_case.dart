abstract interface class UseCase<T, Param> {
  T execute(Param param);
}
