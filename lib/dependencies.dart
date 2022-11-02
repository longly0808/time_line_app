import 'package:get_it/get_it.dart';
import 'package:time_line_app/services/service.dart';
class AppDependencies{
    static GetIt get injector => GetIt.I;

    static Future initial() async{
        ServiceDependencies.init(injector);
    }
}