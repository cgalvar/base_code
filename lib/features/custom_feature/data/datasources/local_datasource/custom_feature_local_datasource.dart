import 'dart:developer';
import 'package:base_code/core/data/datasources/local_datasource/database.dart';
import 'package:base_code/features/custom_feature/data/datasources/local_datasource/database/custom_feature_dao.dart';
import 'package:base_code/features/custom_feature/data/models/custom_feature_model.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:base_code/features/custom_feature/data/util/extension.dart';

abstract class CustomFeatureLocalDataSource{

  Future<int> insert(CustomFeatureModel customFeatureModel);

  Future<List<CustomFeatureModel>> list();

}

@RegisterAs(CustomFeatureLocalDataSource)
@injectable
class CustomFeatureLocalDataSourceImpl implements CustomFeatureLocalDataSource{
  
  MoorDatabase database;
  CustomFeatureDao dao;

  CustomFeatureLocalDataSourceImpl({
    @required this.database
  }){
    this.dao = database.customFeatureDao;
  }

  @override
  Future<List<CustomFeatureModel>> list() async {
    
    var customFeaturesData = await this.dao.list();

    return customFeaturesData.toListModel();

  }

  @override
  Future<int> insert(CustomFeatureModel customFeature) {
    
    try {
      var entry = customFeature.toDataCompanion();
      return this.dao.insert(entry);
    } 
    catch (e) {
        log(e);
        return e;
    }

  }

}