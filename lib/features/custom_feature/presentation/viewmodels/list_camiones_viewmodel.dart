import 'package:base_code/features/custom_feature/domain/entities/custom_feature.dart';
import 'package:base_code/features/custom_feature/domain/usecases/custom_feature_use_cases.dart';

class ListCustomFeatureViewModel {
  
  CustomFeatureUseCases useCases;

  List<CustomFeature> listCustomFeature;

  ListCustomFeatureViewModel({this.useCases});

  list() async{
    this.listCustomFeature = await this.useCases.list();
  }


}