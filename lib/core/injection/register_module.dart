import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:injectable/injectable.dart';

@registerModule
abstract class RegisterModule {
 
  DataConnectionChecker get connectionChecker;
}