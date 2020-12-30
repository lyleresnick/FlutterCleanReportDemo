abstract class Result<Entity, Reason> {
    final Entity data;
    final int code;
    final String description;
    final Reason reason;
    Result(this.data, this.code, this.description, this.reason);
}

class SuccessResult<Entity, Reason> extends Result<Entity, Reason> {
    SuccessResult({Entity data}) : super(data, null, null, null);
}

class FailureResult<Entity, Reason> extends Result<Entity, Reason> {
    FailureResult({int code, String description})  : super(null, code, description, null);
}

class SemanticErrorResult<Entity, Reason> extends Result<Entity, Reason> {
    SemanticErrorResult({Reason reason}) : super(null, null, null, reason);
}


