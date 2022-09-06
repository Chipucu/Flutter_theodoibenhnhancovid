import 'package:flutter/material.dart';
import 'package:testkhoidong_1/component_widget/KhamPhaList/card_nhat_ki/nhatki_list.dart';


// ignore: camel_case_types
class card_nhat_ki extends StatelessWidget {
  const card_nhat_ki({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      color: const Color(0xFFF5F5F5),
      child: InkWell(
          onTap: () async {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => NhatkiList()));
          },
          child: Column(
            // ignore: prefer_const_literals_to_create_immutables
            children: <Widget>[
              const Icon(Icons.fitness_center),
              const Text('Nhật kí')
            ],
          )),
    );
  }
}