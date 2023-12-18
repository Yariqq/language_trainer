abstract class BaseFutureUseCase<Input, Output> {
  Future<Output> execute([Input input]);
}
