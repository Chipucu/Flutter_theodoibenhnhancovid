import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:testkhoidong_1/services/auth.dart';
import 'package:testkhoidong_1/share/constants.dart';

import '../../share/loading.dart';
class Register extends StatefulWidget {
  // const Register({Key? key}) : super(key: key);
final Function toggleView;
Register({required this.toggleView});
  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();
  final _formKey= GlobalKey<FormState>();
  bool loading= false;
  //text field
  String email= '';
  String password= '';
  String error= '';
  @override
  Widget build(BuildContext context) {
    return loading ? Loading() : Scaffold(
      backgroundColor: Colors.lightBlue[100],
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent[100],
        elevation: 0.0,
        title: Text('Đăng kí'),
        actions: <Widget>[
          FlatButton.icon(
              onPressed: (){
              widget.toggleView();
              },
              icon: Icon(Icons.person),
              label: Text('Đăng nhập'))
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              SizedBox(height: 20.0),
              TextFormField(
                decoration: textInputDecoration.copyWith(hintText: 'Email'),
                // validator: (val)=> val.isEmpty ? 'Enter an email',
                  validator: (String? val) {
                    if (val != null && val.isEmpty) {
                      return "Email không được để trống";
                    }
                    return null;
                  },

                  onChanged: (val){
                    //Nhap email
                    setState(() {
                      email= val;
                    });
                  }
              ),
              SizedBox(height: 20.0),
              TextFormField(
                  decoration: textInputDecoration.copyWith(hintText: 'Password'),
                  obscureText: true,
                  validator: (String? val) {
                    if (val != null && val.length<6) {
                      return "mật khẩu cần nhiều hơn 6 kí tự";
                    }
                    return null;
                  },
                  onChanged: (val){
                    //Nhap Password
                    setState(() {
                      password= val;
                    });
                  }
              ),
              SizedBox(height: 30),
              RaisedButton(
                  color: Colors.blue,
                  child: Text('Đăng kí',
                      style: TextStyle(color: Colors.white)),
                  onPressed: () async{
                    //  nut dang nhap
                   if(_formKey.currentState!.validate()){
                     setState(() {
                       loading= true;
                     });
                 dynamic result = await _auth.registerWithEmailAndPassword(email,password);
                 if(result==null) {
                   setState(() {
                     error = 'Hãy nhập lại email';
                     loading= false;
                   });
                 }
                   }
                  } ),
              SizedBox(height: 12.0),
              Text(
                error,
                style: TextStyle(color: Colors.red, fontSize: 14.0),
              )
            ],
          ),
        ),
      ),
    );
  }
}
