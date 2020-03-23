import 'package:base_code/core/data/datasources/local_datasource/database.dart';
import 'package:base_code/features/custom_feature/domain/entities/custom_feature.dart';
import 'package:base_code/core/data/models/model.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:moor/moor.dart';


part 'custom_feature_model.g.dart';

@JsonSerializable(explicitToJson: true)
class CustomFeatureModel extends CustomFeature implements Model<CustomFeature, CustomFeatureDataCompanion>{

  String customProperty;
  int id;


  CustomFeatureModel({
    this.customProperty, 
    this.id
  });

  static fromJson(Map<String, dynamic> json) => _$CustomFeatureModelFromJson(json);

  Map<String, dynamic> toJson() => _$CustomFeatureModelToJson(this);

  CustomFeatureDataCompanion toDataCompanion(){
    return CustomFeatureDataCompanion(
        customProperty: Value(this.customProperty)
    );
  }


  CustomFeature toEntity(){

    return CustomFeature(customProperty: customProperty);

  }

  static CustomFeatureModel fromEntity(CustomFeature customFeature) {

    return CustomFeatureModel(id: customFeature.id, customProperty: customFeature.customProperty);

  }

} 