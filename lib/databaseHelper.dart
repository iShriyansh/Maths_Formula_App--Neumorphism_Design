import 'package:flutter/services.dart';
import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:io';

class DatabaseHelper{



  Future<Database> database;

  Future<void >copyDatabase() async{
    var databasesPath = await getDatabasesPath();
    var path = join(databasesPath, "formula.db");

// Check if the database exists
    var exists = await databaseExists(path);

    if (!exists) {
      // Should happen only the first time you launch your application
      print("Creating new copy from asset");

      // Make sure the parent directory exists
      try {
        await Directory(dirname(path)).create(recursive: true);
      } catch (_) {}

      // Copy from asset
      ByteData data = await rootBundle.load(join("db/formula.db"));
      List<int> bytes =
      data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);

      // Write and flush the bytes written
      await File(path).writeAsBytes(bytes, flush: true);

      database = openDatabase(path);
      await getSubCategory();
    } else {
      print("Opening existing database");
    }
// open the database
    database = openDatabase(path);
    await getSubCategory();
  }

  var  subCategoryData ;
  Future<List> getSubCategory() async {
    // Get a reference to the database.
    final Database db = await database;

    // Query the table for all The Dogs.
    final List<Map<String, dynamic>> maps = await db.rawQuery('select  DISTINCT sub_category from Maths ');
    print(maps);
    subCategoryData =  maps;
    return subCategoryData;
    // Convert the List<Map<String, dynamic> into a List<Dog>.

  }





}