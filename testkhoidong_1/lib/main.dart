import 'package:flutter/material.dart';
import 'package:testkhoidong_1/services/auth.dart';
import 'package:testkhoidong_1/srceen/Wrapper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:testkhoidong_1/model/user.dart';
// void main() {
//   runApp(MyApp());
// }
Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<Users?>.value(
      catchError: (_,__)=> null,
      value: AuthService().user,
      initialData: null,
      child: MaterialApp(
          home: Wrapper(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }}