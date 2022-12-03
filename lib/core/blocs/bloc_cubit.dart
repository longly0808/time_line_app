import 'dart:async';
import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';

import '../../utility/utility.dart';
import 'bloc.dart';
class BaseCubit extends Cubit<BaseState>{
  final StreamController<bool> _streamController =
      StreamController<bool>.broadcast();

  StreamSink<bool> get loadingSink => _streamController.sink;

  Stream<bool> get loadingStream => _streamController.stream;

  BaseCubit(BaseState state) : super(state);
  LoadedState? lateLoadedState(){
    if(state is LoadedState){
      return state as LoadedState;
    }
    return null;
  }
  void initState() {}

  void didChangeDependencies() {}

  void onResume() {}

  void onPause() {}

  void onDetach() {}

  void onInactive() {}

  void showLoading() => EasyLoading.show();

  Future<void> dismissLoading() async {
    await EasyLoading.dismiss();
  }

  @mustCallSuper
  @override
  Future<void> close() {
    // TODO: implement close
    _streamController.close();
    return super.close();
  }
}
