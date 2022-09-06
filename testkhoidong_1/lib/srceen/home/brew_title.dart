import 'package:flutter/material.dart';
import 'package:testkhoidong_1/model/brew.dart';
class BrewTile extends StatelessWidget {
  // const BrewTile({Key? key}) : super(key: key);
final Brew brew;
BrewTile({required this.brew});
  // @override
  // Widget build(BuildContext context) {
  //   return Padding(
  //     padding: EdgeInsets.only(top: 8.0),
  //     child: Card(
  //       margin: EdgeInsets.fromLTRB(20.0, 6.0,20.0,0.0),
  //       child: ListTile(
  //         leading:CircleAvatar(
  //           radius: 25.0,
  //           backgroundColor: Colors.brown[brew.strength],
  //         ) ,
  //         title: Text(brew.name),
  //         subtitle:Text('Takes ${brew.sugars} sugar(s)') ,
  //       ),
  //     ),
  //   );
  // }

//thu cach khac
  @override
  Widget build(BuildContext context) {
    return  Container(
      child: Padding(
        padding: EdgeInsets.only(top: 8.0),
        child: Card(
          margin: EdgeInsets.fromLTRB(20.0, 6.0,20.0,0.0),
          child: ListTile(
            leading:CircleAvatar(
              radius: 25.0,
              backgroundColor: Colors.brown[300],
            ) ,
            title: Text('hihi'),
            subtitle:Text('Takes sugars'),
          ),
        ),
      ),
    );
  }
}
