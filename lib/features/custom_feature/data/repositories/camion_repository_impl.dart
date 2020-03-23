import 'dart:developer';
import 'package:base_code/features/custom_feature/data/datasources/local_datasource/custom_feature_local_datasource.dart';
import 'package:base_code/features/custom_feature/data/models/custom_feature_model.dart';
import 'package:base_code/features/custom_feature/domain/entities/custom_feature.dart';
import 'package:base_code/features/custom_feature/domain/repositories/custom_feature_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:base_code/core/data/util/extension.dart';

@RegisterAs(CustomFeatureRepository)
@injectable
class CustomFeatureRepositoryImpl implements CustomFeatureRepository {
  
  CustomFeatureLocalDataSource localDataSource;

  CustomFeatureRepositoryImpl({@required this.localDataSource});

  @override
  Future<List<CustomFeature>> list() async{
    var list = await localDataSource.list();
    return  list.toListEntity().cast<CustomFeature>();
  }

  @override
  Future<int> insert(CustomFeature feature) {
    log('estamos en repository impl, a punto deinsertar Custom Feature');
    var model = CustomFeatureModel.fromEntity(feature);
    return localDataSource.insert(model);
  }
  
}