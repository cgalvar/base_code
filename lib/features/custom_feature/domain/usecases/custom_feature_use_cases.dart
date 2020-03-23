import 'package:base_code/features/custom_feature/domain/entities/custom_feature.dart';
import 'package:base_code/features/custom_feature/domain/repositories/custom_feature_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class CustomFeatureUseCases {
  
  CustomFeatureRepository repository;

  CustomFeatureUseCases({this.repository});

  Future<List<CustomFeature>> list(){
    return this.repository.list();
  }

  Future<int> insert(CustomFeature feature){
    return this.repository.insert(feature);
  }

}