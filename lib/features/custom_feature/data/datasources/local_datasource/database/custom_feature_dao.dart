import 'package:base_code/core/data/datasources/local_datasource/database.dart';
import 'package:base_code/core/data/datasources/local_datasource/tables.dart';
import 'package:moor/moor.dart';



part 'custom_feature_dao.g.dart';

@UseDao(tables: [CustomFeatureMoorTable])
class CustomFeatureDao extends DatabaseAccessor<MoorDatabase> with _$CustomFeatureDaoMixin{
  
  CustomFeatureDao(MoorDatabase db) : super(db);

  Future<List<CustomFeatureData>> list(){
   return select(customFeatureMoorTable).get(); 
  }
  
  Future<int> insert(CustomFeatureDataCompanion entry){
    return into(customFeatureMoorTable).insert(entry);
  }


}