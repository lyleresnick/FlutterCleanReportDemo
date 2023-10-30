abstract class Result<Entity> {
    final Entity? data;
    final int? code;
    final String? description;
    Result(this.data, this.code, this.description);
}

class SuccessResult<Entity> extends Result<Entity> {
    SuccessResult({required Entity data}) : super(data, null, null);
}

class FailureResult<Entity> extends Result<Entity> {
    FailureResult({required int code, required String description})  : super(null, code, description);
}



