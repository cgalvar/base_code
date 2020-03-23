import 'package:moor/moor.dart';


@DataClassName("CustomFeatureData")
class CustomFeatureMoorTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get customProperty => text()();
}

