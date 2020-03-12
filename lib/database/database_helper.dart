import 'dart:io' as io;
import 'package:eattendance/models/checkin_response.dart';
import 'package:eattendance/models/login_response.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:async';

class DatabaseHelper {
  static final DatabaseHelper _instance = new DatabaseHelper.internal();
  factory DatabaseHelper() => _instance;
  static Database _db;

   Future<Database> get db async{
     if(_db != null)
       return _db;
       _db = await initDb();
       return _db;
   }

   DatabaseHelper.internal();

   initDb() async {
      io.Directory documentsDirectory = await getApplicationDocumentsDirectory();
      String path = join(documentsDirectory.path,"main.db");
      var theDb = await openDatabase(path, version: 1, onCreate: _onCreate);
      return theDb;
   }

   void _onCreate(Database db, int version) async {
     // When creating the db, create the table
     await db.execute("CREATE TABLE User(id TEXT PRIMARY KEY,name TEXT,employeeId TEXT,email TEXT,username TEXT,phone TEXT,token TEXT,date TEXT)");
     await db.execute("CREATE TABLE Checkin(id INTEGER AUTO_INCREMENT PRIMARY KEY,checkInAt TEXT,checkOutAt TEXT,comment TEXT,latLong TEXT, status TEXT)");
     print("Created tables");
   }

//   Future<int> saveUser(User user) async{
//     var dbClient = await db;
//     int res = await dbClient.insert("User", user.toMap());
//     return res;
//   }

  Future<int> saveUser(LoginRes user) async{
     var dbClient = await db;
     int res = await dbClient.insert("User", user.toMap());
     return res;
   }

  Future<int> saveCheckIn(CheckInRes checkIn) async{
    var dbClient = await db;
    int res = await dbClient.insert("Checkin", checkIn.toMap());
    return res;
  }
  Future<int> saveCheckOut(CheckInRes checkIn, int id) async{
    var dbClient = await db;
    int res = await dbClient.update("Checkin", checkIn.toMap(),where: 'id = ?',whereArgs: [id]);
    return res;
  }

//   Future<int> deleteUser(User user) async {
//     var dbClient = await db;
//     int res = await dbClient.delete("User");
//     return res;
//   }

  Future<int> deleteUser(LoginRes user) async {
    var dbClient = await db;
    int res = await dbClient.delete("User");
    return res;
  }

  Future<bool> isCheckIn() async {
    var dbClient = await db;
    var res  = await dbClient.query("CheckIn");
    return res.length > 0 ? true : false;
  }

   Future<bool> isLoggedIn() async{
     var dbClient = await db;
     var res  = await dbClient.query("User");
     return res.length > 0 ? true : false;
   }
//   Future<User> getUser() async{
//     var dbClient = await db;
//     List<Map> user = await dbClient.query("User");
//     if(user.length > 0){
//       return User.map(user.first);
//     }
//     return null;
//   }

  Future<LoginRes> getUser() async{
    var dbClient = await db;
    List<Map> user = await dbClient.query("User");
    if(user.length > 0){
      return LoginRes.map(user.first);
    }
    return null;
  }

  Future<CheckInRes> getCheckIn() async{
    var dbClient = await db;
    List<Map> checkIn = await dbClient.query("Checkin");
    if(checkIn.length > 0){
      return CheckInRes.map(checkIn.first);
    }
    return null;
  }
}