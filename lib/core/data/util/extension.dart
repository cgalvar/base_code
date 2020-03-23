import 'package:base_code/core/data/models/model.dart';

extension ListCamionUtilities<Entity> on List<Model> {
  
  List<dynamic> toListEntity() {
    
    List<dynamic> camionesEntity = [];

    for (var model in this) {
      //debugger();
      camionesEntity.add(model.toEntity());
    }

    return camionesEntity;


  }
  
}