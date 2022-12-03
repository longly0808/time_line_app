abstract class BaseState {}

class InitialState extends BaseState {}

class ErrorState extends BaseState {
  String? message;

  ErrorState(this.message);
}

class NoDataState extends BaseState {
  String? message;

  NoDataState(this.message);
}

class LoadedState<TParams, TModels> extends BaseState {
  TParams? params;
  TModels? model;
  String? errorMessage;
  bool? isShowLoading;

  LoadedState(this.params, this.model, {this.errorMessage, this.isShowLoading});

  LoadedState copywith({
    TParams? params,
    TModels? model,
    String? errorMessage,
    bool? isShowLoading,
  }) =>
      LoadedState(
        params ?? this.params,
        model ?? this.model,
        errorMessage: errorMessage,
        isShowLoading: isShowLoading,
      );
}
