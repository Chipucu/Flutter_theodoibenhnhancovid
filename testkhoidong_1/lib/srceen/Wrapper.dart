import 'package:flutter/material.dart';
import 'package:testkhoidong_1/model/user.dart';
import 'package:testkhoidong_1/srceen/authenticate/authenticate.dart';
import 'package:testkhoidong_1/srceen/home/home.dart';
import 'package:provider/provider.dart';
class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user= Provider.of<Users?>(context);
    print(user);
    // return home or authenticate
  if(user== null){
    return Authenticate();
  }
  else{
    return Home();
  }
    // return Home();
  }
}
