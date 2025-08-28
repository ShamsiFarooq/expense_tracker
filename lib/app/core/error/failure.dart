/// Base class for all failures in the app.
class Failure {
  final String message;
  final StackTrace? stackTrace;

  const Failure(this.message, [this.stackTrace]);

  @override
  String toString() => '$runtimeType: $message';
}

/// Common failure types
class NetworkFailure extends Failure {
  const NetworkFailure(super.message, [super.stackTrace]);
}

class CacheFailure extends Failure {
  const CacheFailure(super.message, [super.stackTrace]);
}

class ValidationFailure extends Failure {
  const ValidationFailure(super.message, [super.stackTrace]);
}

class UnknownFailure extends Failure {
  const UnknownFailure([super.message = 'Unknown error', super.stackTrace]);
}
