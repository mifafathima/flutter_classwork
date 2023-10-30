import 'package:sqflite/sqflite.dart' as sql; //type casting

class SQLHelper{
  ///database creation
  static Future<sql.Database> createDB() async{
    return sql.openDatabase('MyContacts.db',
    version: 1,
      onCreate: (sql.Database database,int version) async{
      await createTable(database);
      }
    );
  }

  ///table for storing values in this db
  static Future<void> createTable(sql.Database database) async {
    await database.execute("""CREATE TABLE contacts(
        id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
        cname TEXT,
        cnumber TEXT,
        createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
      )""");
  }

  //this is static because we call it as classname.functions
  //to add/save name and phone number to contacts table
  static Future<int> create_contact(String name, String phonenum) async {
    final db = await SQLHelper.createDB();  //open database
    final data = {'cname' : name ,'cnumber' : phonenum};
    //        insert to a particular table with values as map
    final id = await db.insert('contacts', data);
    return id;

  }

  //fetch or read all the contacts from database
  static Future<List<Map<String,dynamic>>> readContacts()  async{
    final db = await SQLHelper.createDB();
    //to read or fetch we use method query >> contacts enn lle table ellaaa values id anusarich read cheyya
    return db.query('contacts',orderBy: 'id');
  }

  static Future<int> updateContact(int id, String name, String phone) async{
    final db = await SQLHelper.createDB();
    final newdata = {
      'cname' : name ,
      'cnumber' : phone,
      'createdAt' :DateTime.now().toString()
    };
    final upid = await db.update('contacts', newdata, where: 'id = ? ',whereArgs: [id]);
    return upid;
  }

  static Future<void> deleteContact(int id) async {
    final db = await SQLHelper.createDB();
    try{
      await db.delete('contacts',where: 'id = ? ',whereArgs: [id]);
    }catch(e){
      throw Exception();
    }

  }



}