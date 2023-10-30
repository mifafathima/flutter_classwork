import 'package:sqflite/sqflite.dart' as sql; //type casting

class SQLHelper1 {
  ///database creation
  static Future<sql.Database> createDB() async {
    return sql.openDatabase('MyContacts.db',
        version: 1,
        onCreate: (sql.Database database, int version) async {
          await createTable(database);
        }
    );
  }

  ///table for storing values in this db
  static Future<void> createTable(sql.Database database) async {
    await database.execute("""CREATE TABLE user(
        id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
        name TEXT,
        phone TEXT,
        pass TEXT,
      )""");
  }

  static Future<int>addNewUser(String name, String phone, String pass) async{
    final db = await SQLHelper1.createDB();
    final data = {'name' : name ,'phone' : phone,'pass' : pass};
    final id = await db.insert('user', data);
    return id;

  }


}