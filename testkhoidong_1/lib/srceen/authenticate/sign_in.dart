import 'package:flutter/material.dart';
import 'package:testkhoidong_1/services/auth.dart';
import 'package:testkhoidong_1/share/loading.dart';

import '../../share/constants.dart';
class SignIn extends StatefulWidget {
  final Function toggleView;
  SignIn({required this.toggleView});
  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  // dong lenh nay gay loi
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
        backgroundColor: Colors.blueAccent[100],
        elevation: 0.0,
        title: Text('Đăng nhập '),
        actions: <Widget>[
          FlatButton.icon(
              onPressed: (){
              widget.toggleView();
              },
              icon: Icon(Icons.person),
              label: Text('Đăng kí'))
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
                  validator: (String? val) {
                    if (val != null && val.isEmpty) {
                      return "email không được để trống";
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
                  decoration: textInputDecoration.copyWith(hintText: 'Mật khẩu'),
                obscureText: true,
                  validator: (String? val) {
                    if (val != null && val.length<6) {
                      return "pMật khẩu cần nhiều hơn 6 kí tự";
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
              SizedBox(height: 20),
              RaisedButton(
                  color: Colors.blue,
                  child: Text('Đăng nhập',
                  style: TextStyle(color: Colors.white)),
                  onPressed: () async{
                    if(_formKey.currentState!.validate()){
                      setState(() {
                        loading= true;
                      });
                     dynamic result= await _auth.signInWithEmailAndPassword(email, password);
                      // // dynamic result = await _auth.registerWithEmailAndPassword(email,password);
                      //
                      if(result==null) {
                        setState(() {
                          error = 'Tài khoản hoặc mật khẩu không chính xác';
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
