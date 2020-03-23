import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'injection.iconfig.dart';


final dependencyInjection = GetIt.instance;



@injectableInit
void configureInjection() => $initGetIt(dependencyInjection);