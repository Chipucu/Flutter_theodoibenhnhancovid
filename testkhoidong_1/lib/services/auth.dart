import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth_platform_interface/firebase_auth_platform_interface.dart';
import 'package:testkhoidong_1/services/database.dart';

import '../model/user.dart';
class AuthService{
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // tao object nguoi dung
  Users? _usersFromFirebaseUser(User user){
    //viet lai doan code sau:  return user!= null ? Users(uid: user.uid): null;
    if(user!=null){
      return Users(uid: user.uid);
    }
    else{
      return null;
    }
  }
  //auth change users
  Stream<Users> get user{
    return _auth.authStateChanges()
        .map((User? user)=> _usersFromFirebaseUser(user!)!);
  }
  // sign in anon
  Future signInAnon() async{
  try{
    UserCredential result =  await _auth.signInAnonymously();
    User?  user = result.user;
    return _usersFromFirebaseUser(user!);
  }
      catch(e){
    print(e.toString());
    return null;
      }
}

  //sign in with email
  Future signInWithEmailAndPassword(String email, String password) async{
    try{
      UserCredential result =  await _auth.signInWithEmailAndPassword(email: email, password: password);
      User?  user = result.user;
      //moi them dong nay
      // await DatabaseService(uid: user!.uid).updateData('0','new member',100);
      return _usersFromFirebaseUser(user!);
    }
    catch(e){
      print(e.toString());
      return null;
    }}
  //register
  Future registerWithEmailAndPassword(String email, String password) async{
    try{
      UserCredential result =  await _auth.createUserWithEmailAndPassword(email: email, password: password);
      User?  user = result.user;
      //create a new document for new user with uid
      await DatabaseService(uid: user!.uid).updateData('0','new member',100);

      return _usersFromFirebaseUser(user);
    }
    catch(e){
      print(e.toString());
      return null;
    }}
  //sign out
  Future signOut() async{
    try{
      return await _auth.signOut();
    }
        catch(e){
        print(e.toString());
        return null;
        }
}

}
