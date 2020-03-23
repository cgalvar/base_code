
import 'package:base_code/features/custom_feature/domain/entities/custom_feature.dart';

abstract class CustomFeatureRepository {
  
  Future<List<CustomFeature>> list();

  Future<int> insert(CustomFeature feature);

}