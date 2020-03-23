import 'package:base_code/core/data/datasources/local_datasource/database.dart';
import 'package:base_code/features/custom_feature/data/models/custom_feature_model.dart';


class GenericUtil <dataClass extends dynamic, Model>{
  
  List<Model> fromDataClassToModel(List<dataClass> list){
    
    List<Model> models = [];

    for (var item in list) {
      models.add(item.toModel());
    }

    return models;
  }
}

extension ListUtilities on List<CustomFeatureData> {
  
  List<CustomFeatureModel> toListModel() {
    GenericUtil util = GenericUtil<CustomFeatureData, CustomFeatureModel>();
    return util.fromDataClassToModel(this).cast<CustomFeatureModel>();
  }
  
}

extension CamionDataUtilities on CustomFeatureData{
  CustomFeatureModel toModel(){
    return CustomFeatureModel(customProperty: this.customProperty, id: this.id);
  }
}
