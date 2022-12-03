import 'package:get_it/get_it.dart';
import 'package:time_line_app/bloc/bloc_dependencies.dart';
class AppDependencies{
  GetIt get injector => GetIt.I;
  Future init() async{
    BlocDependencies.init(injector);


  }

}