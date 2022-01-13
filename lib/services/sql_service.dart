
import 'package:smart_personal_shopper/data/cart/cart.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class SQLService {
  Database? db;

  Future openDB() async {
    print("opendb");
    try {
      // Get a location using getDatabasesPath
      var databasesPath = await getDatabasesPath();
      String path = join(databasesPath, 'cart.db');
      print(path);
      // open the database
      this.db = await openDatabase(
        path,
        version: 1,
        onCreate: (Database db, int version) async {
          print(db);
          this.db = db;
          createTables();
        },
      );
      if(db!=null){
        return true;
      }
      throw Future.error("db not created");
    } catch (e) {
      print("ERROR IN OPEN DATABASE $e");
      return Future.error(e);
    }
  }

  deleteTable()async{
    try{
      var qry="drop database";
      await db?.execute(qry);
      print("table dropped");
    }
    catch(e)
    {
     print("error in drop table");
     print(e);
    }
  }

  createTables() async {
    try {
      var qry = "CREATE TABLE IF NOT EXISTS cart ( "
          "id TEXT PRIMARY KEY,"
          "name TEXT,"
          "image TEXT,"
          "price DOUBLE,"
          "qty INTEGER,"
          "datetime TEXT)";
      await db?.execute(qry);
    } catch (e) {
      print("ERROR IN CREATE TABLE");
      print(e);
    }
  }

  Future getCartList() async {
    try {
      var list = await db?.rawQuery('SELECT * FROM cart', []);
      return list ?? [];
    } catch (e) {
      return Future.error(e);
    }
  }

  Future getItem(String itemId) async {
    var qry = "SELECT * FROM cart_list where id = '${itemId}'";
    return await this.db?.rawDelete(qry);
  }

  Future addToCart(CartItem data) async {
    print(db);
    print("sqlservice");
    var qry =
        'INSERT INTO cart(id, name, image, price,qty,datetime) '
        'VALUES('
        '"${data.id}", "${data.name}", "${data.image}",${data.price},${data.quantity},"${data.datetime}")';
    print(qry);
    await this.db?.transaction((txn) async {
      print("**********************************");
      int id1 = await txn.rawInsert(qry);
      print(id1);
      return id1;
    });
  }

  Future removeFromCart(String itemId) async {
    var qry = "DELETE FROM cart where id = '${itemId}'";
    return await this.db?.rawDelete(qry);
  }
}
