import 'package:cloud_firestore/cloud_firestore.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final CollectionReference _mainCollection = _firestore.collection('notes');

class Database {
  static String? userUid;

  static Stream<QuerySnapshot> readMarkets() {
    CollectionReference marketsCollection =
    _mainCollection.doc(userUid).collection('markets');

    return marketsCollection.snapshots();
  }


}
