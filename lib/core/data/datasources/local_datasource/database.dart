// this annotation tells moor to prepare a database class that uses both of the
// tables we just defined. We'll see how to use that database class in a moment.
import 'dart:io';
import 'package:base_code/features/custom_feature/data/datasources/local_datasource/database/custom_feature_dao.dart';
import 'package:injectable/injectable.dart';
import 'package:moor/moor.dart';
import 'package:moor_ffi/moor_ffi.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;
import 'tables.dart';

part 'database.g.dart';

LazyDatabase _openConnection() {
  // the LazyDatabase util lets us find the right location for the file async.
  return LazyDatabase(() async {
    // put the database file, called db.sqlite here, into the documents folder
    // for your app.
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(path.join(dbFolder.path, 'db.sqlite'));
    return VmDatabase(file);
  });
}

@singleton
@injectable
@UseMoor(tables: [CustomFeatureMoorTable], daos: [CustomFeatureDao])
class MoorDatabase extends _$MoorDatabase{
    // we tell the database where to store the data with this constructor
  MoorDatabase() : super(_openConnection());
  MoorDatabase.test(VmDatabase vmDatabase) : super(vmDatabase);
  // you should bump this number whenever you change or add a table definition. Migrations
  // are covered later in this readme.
  @override
  int get schemaVersion => 1;
}