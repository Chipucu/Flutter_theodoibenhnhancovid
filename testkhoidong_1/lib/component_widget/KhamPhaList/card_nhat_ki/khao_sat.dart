import 'package:flutter/material.dart';
class Khaosat extends StatefulWidget {
  const Khaosat({Key? key}) : super(key: key);

  @override
  State<Khaosat> createState() => _KhaosatState();
}

class _KhaosatState extends State<Khaosat> {
  final List<String> trieu_chung = <String>[
    'Ho',
    'Đau Đầu',
    'Chóng Mặt',
    'Đau Mỏi Cơ Bắp',
    'Mệt Mỏi'
  ];
  final _clicked = <String>{};
  @override
  Widget build(BuildContext context) {
    return Scaffold(
body: ListView(
  children: [
    buildListTile(context, trieu_chung[0]),
    const Divider(indent: 20, endIndent: 20, thickness: 2),
    buildListTile(context, trieu_chung[1]),
    const Divider(indent: 20, endIndent: 20, thickness: 2),
    buildListTile(context, trieu_chung[2]),
    const Divider(indent: 20, endIndent: 20, thickness: 2),
    buildListTile(context, trieu_chung[3]),
    const Divider(indent: 20, endIndent: 20, thickness: 2),
    buildListTile(context, trieu_chung[4]),
  ],
),


    );
  }
  Widget buildListTile(BuildContext context, String title) {
    bool _isClick = _clicked.contains(title);
    return ListTile(
      contentPadding: const EdgeInsets.fromLTRB(40, 0, 40, 0),
      title: Text(title),
      trailing: Icon(
        _isClick ? Icons.check_box : Icons.check_box_outline_blank,
        color: _isClick ? Colors.blueAccent : null,
      ),
      onTap: () {
        setState(() {
          if (_isClick) {
            _clicked.remove(title);
          } else {
            _clicked.add(title);
          }
        });
      },
    );
  }
}
