import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:testkhoidong_1/model/brew.dart';
class DatabaseService{
  final String uid;
  DatabaseService({required this.uid});
  // colection reference
  final CollectionReference brewCollection = FirebaseFirestore.instance.collection('brews');

  Future updateData(String sugars, String name, int strength) async{
    return await brewCollection.doc(uid).set({
      'sugars': sugars,
      'name': name,
      'strength': strength,
    });
  }
  //brew list from snapshot
  List<Brew> _brewListFromSnapshot(QuerySnapshot snapshot){
    return  snapshot.docs.map((doc){
      return Brew(
        name: doc.get('name')??'0',
        sugars: doc.get('sugars')?? '0',
        strength: doc.get('strength')?? 0,
      );
    }).toList();

  }
//  get brews stream
Stream<List<Brew>> get brews{
    return brewCollection.snapshots().map(_brewListFromSnapshot);
}
}
