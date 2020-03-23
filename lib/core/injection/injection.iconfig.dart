// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:base_code/core/data/datasources/local_datasource/database.dart';
import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:base_code/core/injection/register_module.dart';
import 'package:base_code/features/custom_feature/data/datasources/local_datasource/custom_feature_local_datasource.dart';
import 'package:base_code/features/custom_feature/data/repositories/camion_repository_impl.dart';
import 'package:base_code/features/custom_feature/domain/repositories/custom_feature_repository.dart';
import 'package:base_code/features/custom_feature/domain/usecases/custom_feature_use_cases.dart';
import 'package:base_code/core/data/datasources/remote_datasource/network_info.dart';
import 'package:get_it/get_it.dart';

void $initGetIt(GetIt g, {String environment}) {
  final registerModule = _$RegisterModule();
  g.registerFactory<DataConnectionChecker>(
      () => registerModule.connectionChecker);
  g.registerFactory<CustomFeatureLocalDataSource>(
      () => CustomFeatureLocalDataSourceImpl(database: g<MoorDatabase>()));
  g.registerFactory<CustomFeatureRepository>(() => CustomFeatureRepositoryImpl(
      localDataSource: g<CustomFeatureLocalDataSource>()));
  g.registerFactory<CustomFeatureUseCases>(
      () => CustomFeatureUseCases(repository: g<CustomFeatureRepository>()));
  g.registerFactory<NetworkInfo>(
      () => NetworkInfoImpl(g<DataConnectionChecker>()));

  //Eager singletons must be registered in the right order
  g.registerSingleton<MoorDatabase>(MoorDatabase());
}

class _$RegisterModule extends RegisterModule {
  @override
  DataConnectionChecker get connectionChecker => DataConnectionChecker();
}
