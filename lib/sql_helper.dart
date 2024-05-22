import 'package:employees/models/employee_model.dart';
import 'package:sqflite/sqflite.dart';

class SqlHelper
{
  Database? database;
 SqlHelper()
 {
   createDatabase();
 }

   Future<void> createDatabase()async {
     await openDatabase(
      'employees.db',
      version: 1,
      onCreate: (db, version) {
        print("database created");
        db.execute("""
               create table employees(
               id integer primary key,
               name text not null,
               salary real not null
               )
               """).then((value) {
          print("table created");
        }).catchError((error) {
          print("Error when creating table ${error.toString()}");
        });
      },
      onOpen: (db) {

        print("database opened");
      },
    ).then((value) {
      database = value;
    });
  }

  Future<void> insertToDatabase({
    required String name,
    required num salary,
  }) async
  {
    await database?.transaction((txn) {
      return txn.rawInsert(
          'INSERT INTO employees(name,salary) VALUES("$name","$salary")')
          .then((value) {
        print("$value inserted successfully");

      }).catchError((error) {
        print("error when inserting new record ${error.toString()}");
      });
    });
  }


  Future<List<Employee>> getDataFromDatabase() async {
    if (database == null) {
      throw Exception('Database is not initialized');
    }
    final List<Map<String, dynamic>> maps = await database!.rawQuery('SELECT * FROM employees');
    return List.generate(maps.length, (i) {
      return Employee(
        name: maps[i]['name'] as String,
        salary: maps[i]['salary'] as num,
      );
    });
  }
}
