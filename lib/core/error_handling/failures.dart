sealed class Failures {
  final String message;

  const Failures(this.message);
}

class CacheFailure extends Failures {
  const CacheFailure(super.message);
}

class AssetFailure extends Failures {
  const AssetFailure(super.message);
}

class NetworkFailure extends Failures {
  const NetworkFailure(super.message);
}
