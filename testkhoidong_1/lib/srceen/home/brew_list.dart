import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';

import '../../model/brew.dart';
import'package:testkhoidong_1/model/brew.dart';

import'package:testkhoidong_1/srceen/home/brew_title.dart';

class BrewList extends StatefulWidget {
  // const BrewList({Key? key}) : super(key: key);

  @override
  State<BrewList> createState() => _BrewListState();
}

class _BrewListState extends State<BrewList> {
  @override
  Widget build(BuildContext context) {
    //them dau ? vao Brew
    final brews= Provider.of<List<Brew>?>(context) ?? [];
  //   if(brews!=null){
  //     brews.forEach((brew) {
  //       print(brew!.name);
  //       print(brew.sugars);
  //       print(brew.strength);
  //
  //      });
  //
  // }
  //   return Container();
    // return ListView.builder(itemBuilder: (context,index){
    //   return BrewTile(brew: brews);
    // });

    // return ListView.builder(
    //     //them bot dau ? vao brew
    //     itemCount: brews.length,
    //     itemBuilder: (context, index){
    //       return BrewTile(brew: brews[index]);
    //     },
    // );
  //  cach khac
    return brews== null? Container(
      child: Text('brew is null'),
    ):ListView.builder(
        itemCount: brews.length,
        itemBuilder: (context, index) {


          return BrewTile(brew: brews[index]);
        }
        );

    //thu cach khac

    // return brews== null? Container(
    //   child: Text('brew is null'),
    // ): Container(
    //   child: Text('truy cap duoc vao brewtile'),
    // );

    //dau ngoai day la cua class
  }
}
