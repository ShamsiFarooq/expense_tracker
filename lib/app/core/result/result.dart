import 'package:foxus/app/core/error/failure.dart';

abstract class Result<T> {
  const Result();

  bool get isSuccess => this is Success<T>;
  bool get isError => this is Error<T>;

  R fold<R>(R Function(Failure failure) onError, R Function(T data) onSuccess) {
    if (this is Success<T>) {
      return onSuccess((this as Success<T>).data);
    } else {
      return onError((this as Error<T>).failure);
    }
  }
}

class Success<T> extends Result<T> {
  final T data;
  const Success(this.data);
}

class Error<T> extends Result<T> {
  final Failure failure;
  const Error(this.failure);
}
