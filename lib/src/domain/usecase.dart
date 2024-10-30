abstract class UseCase<R, Q> {
  R call({required Q event});
}
