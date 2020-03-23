import 'dart:developer';

import 'package:base_code/features/custom_feature/domain/entities/custom_feature.dart';
import 'package:base_code/features/custom_feature/domain/usecases/custom_feature_use_cases.dart';

class PutCustomFeatureViewModel{

  CustomFeatureUseCases useCases;

  PutCustomFeatureViewModel({this.useCases});

  CustomFeature customFeature = CustomFeature(customProperty: "Julion Alvarez");

  Future<int> insert(){
    return useCases.insert(customFeature);
  }

  send() async{
      debugger();
      await insert();
      log('Operacion exitosa');
  }

}