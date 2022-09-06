import 'package:flutter/material.dart';
import 'package:testkhoidong_1/component_widget/KhamPhaList/card_fitness/videoplayer.dart';
import 'movement_description.dart';

class CacDongTacWidget extends StatefulWidget {
  const CacDongTacWidget({Key? key}) : super(key: key);

  @override
  _CacDongTacWidgetState createState() => _CacDongTacWidgetState();
}

class _CacDongTacWidgetState extends State<CacDongTacWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tập Thể Dục'),
        backgroundColor: Colors.blueAccent,
        actions: <Widget>[
          IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.close))
        ],
      ),
      key: scaffoldKey,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            //Các Động Tác
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(16, 16, 24, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: const [
                  Text(
                    'Các bài tập thể dục',
                    style: TextStyle(
                      fontFamily: 'Lexend Deca',
                      color: Color(0xFF090F13),
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
            ),
            //Động tác 1
            const Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16, 0, 0, 0),
              child: mo_ta_dong_tac(
                title: "Bài 1: Tập thể dục cho cơ bắp",
                subtitle: "Giúp cơ thể chắc khỏe ",
              ),
            ),
            //Động tác 2
            const Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16, 0, 0, 0),
                child: mo_ta_dong_tac(
                    title: "Bài tập 2: Hít thở nhẹ",
                    subtitle: "Cho quá trình sốt và triệu chứng nặng")),
            //Động tác 3
            const Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16, 0, 0, 0),
                child: mo_ta_dong_tac(
                    title: "Bài tập 3: Bài tập cơ hoành",
                    subtitle: "Tăng cường sức thở lúc đang hồi phục ")),

            //Bắt đầu tập luyện
            Padding(
              // ignore: prefer_const_constructors
              padding: EdgeInsets.fromLTRB(37, 10, 0, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.all(12.0),
                      backgroundColor: Colors.blueAccent,
                      textStyle: const TextStyle(
                        fontFamily: 'Lexend Deca',
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                      elevation: 3,
                    ),
                    onPressed: () async {
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const VideoPlayerScreen(),
                        ),
                      );
                    },
                    child: const Text(
                      'Bài tập giai đoạn hậu covid',
                      style: TextStyle(
                        fontFamily: 'Lexend Deca',
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
