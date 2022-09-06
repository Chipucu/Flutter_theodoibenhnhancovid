import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:testkhoidong_1/component_widget/KhamPhaList/card_nhat_ki/card_nhat_ki.dart';
import 'package:testkhoidong_1/model/brew.dart';
import 'package:testkhoidong_1/services/auth.dart';
import 'package:testkhoidong_1/services/database.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../component_widget/KhamPhaList/card_nutrient/card_nutrient.dart';
import 'brew_list.dart';
import 'package:flutter_svg/svg.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:testkhoidong_1/component_widget/web_view.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:testkhoidong_1/component_widget/KhamPhaList/card_fitness/card_fitness.dart';
import 'package:testkhoidong_1/component_widget/KhamPhaList/card_khao_sat/tham_gia_khao_sat.dart';
import 'package:testkhoidong_1/component_widget/KhamPhaList/card_nutrient/recipe.dart';
import 'package:testkhoidong_1/component_widget/KhamPhaList/card_nutrient/recipe_detail.dart';
import 'dart:ui';
import 'package:testkhoidong_1/component_widget/KhamPhaList/banner_quay_vong.dart';
import '';



class Home extends StatelessWidget {
  // const Home({Key? key}) : super(key: key);
final AuthService _auth= AuthService();
  // @override
  // Widget build(BuildContext context) {
  //   return StreamProvider<List<Brew?>?>.value(
  //     initialData: null,
  //     value: DatabaseService(uid: '').brews,
  //
  //     child: Scaffold(
  //       backgroundColor: Colors.brown[100],
  //       appBar: AppBar(
  //         title: Text('Home Page'),
  //         backgroundColor: Colors.brown[400],
  //         elevation: 0.0,
  //         actions: <Widget>[
  //           FlatButton.icon(
  //               onPressed: () async {
  //             await _auth.signOut();
  //               },
  //               icon: Icon(Icons.person),
  //               label: Text('logout'))
  //         ],
  //       ),
  //       body: BrewList(),
  //     ),
  //   );
  // }
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(title: const Text('Covid19 Care'), actions: <Widget>[
      IconButton(
        icon: const Icon(Icons.logout),
        onPressed: () async {
          await _auth.signOut();
        },
      ),
    ]),
    body: SingleChildScrollView(
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            ClipPath(
              child: Container(
                padding: const EdgeInsets.only(
                  left: 40,
                  top: 50,
                  right: 20,
                ),
                height: 180,
                width: double.infinity,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [
                      Color(0xFF3383CD),
                      Color(0xFF11249F),
                    ],
                  ),
                  image: DecorationImage(
                    image: AssetImage("assets/images/virus.png"),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const SizedBox(height: 0),
                    Expanded(
                      child: Stack(
                        //
                        children: <Widget>[
                          SvgPicture.asset(
                            "assets/icons/Drcorona.svg",
                            width: 230,
                            fit: BoxFit.fitWidth,
                            alignment: Alignment.topCenter,
                          ),
                          Positioned(
                            top: 30,
                            left: 160,
                            child: Text(
                              "Xin chào",
                              style: const TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Container(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              children: const [
                SizedBox(
                  width: 400,
                  height: 250,
                  child: Carousel(
                    key: null,
                  ),
                ),
              ],
            ),
            //Text: Khám phá
            Container(
              color: Colors.white,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: const [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(20, 5, 0, 20),
                    child: Text(
                      'Khám Phá',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                ],
              ),
            ),
            //Tập thể dục và dinh dưỡng và khảo sát
            Container(
              color: Colors.white,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  //Card tham gia khao sat
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                    child: SizedBox(
                      width: 100,
                      height: 100,
                      child: card_tham_gia_khao_sat(),
                    ),
                  ),
                  //Card xem nhat ki
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                    child: SizedBox(
                      width: 100,
                      height: 100,
                      child: card_nhat_ki(),
                    ),
                  ),
                  //Card chế độ dinh dưỡng
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                    child: SizedBox(
                      width: 100,
                      height: 100,
                      child: card_nutrient(),
                    ),
                  ),
                  //Card tập thể dục
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                    child: SizedBox(
                      width: 100,
                      height: 100,
                      child: card_fitness(),
                    ),
                  ),


                ],
              ),
            ),
            //Text: Cẩm nang y tế
            Container(
              color: Colors.white,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: const <Widget>[
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 10),
                    child: Text(
                      'Cẩm nang y tế',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 150.0,
              child: ListView(
                padding: const EdgeInsets.fromLTRB(20, 5, 0, 5),
                scrollDirection: Axis.horizontal,
                children: [
                  Card(
                    child: InkWell(
                      splashColor: Colors.blue.withAlpha(30),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const WebViewContainer(
                                    "https://covid19.gov.vn/")));
                      },
                      child: SizedBox(
                        width: 150,
                        child: Column(
                          children: [
                            Image.network(
                              'https://static.mediacdn.vn/covid19.gov.vn/image/logo.png',
                              fit: BoxFit.cover,
                            ),
                            const Text(' '),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Card(
                    child: InkWell(
                      splashColor: Colors.blue.withAlpha(30),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const WebViewContainer(
                                    "https://dantri.com.vn/")));
                      },
                      child: SizedBox(
                        width: 150,
                        child: Column(
                          children: [
                            Image.network(
                              'https://scontent.fhph1-2.fna.fbcdn.net/v/t1.6435-9/143424782_3752851181457879_7291351997305445846_n.png?_nc_cat=1&ccb=1-5&_nc_sid=09cbfe&_nc_ohc=pXzeriXllu4AX9YdIfa&_nc_ht=scontent.fhph1-2.fna&oh=00_AT-E5j_LSdx-0I0Dzkrik7jFYYMIVxOSZ8KfR5cNUJNq9w&oe=628FCB0C',
                              fit: BoxFit.cover,
                            ),
                            const Text(
                              'Hướng dẫn mới nhất về trường hợp F0 được điều trị tại nhà ',
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Card(
                    child: InkWell(
                      splashColor: Colors.blue.withAlpha(30),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const WebViewContainer(
                                    "https://hcdc.vn/category/van-de-suc-khoe/covid19/tai-lieu-truyen-thong/huong-dan-goi-cham-soc-suc-khoe-tai-nha-cho-nguoi-f0-phien-ban-16-9d692c99f55ff1da0cce2014e681f21b.html")));
                      },
                      child: SizedBox(
                        width: 150,
                        height: 100,
                        child: Column(
                          children: [
                            Image.network(
                              'https://image.thanhnien.vn/300x210/uploaded/hanhnb/2021_09_03/z2732707609704_73c88ed38df3ff6a04fc929b066955fc_lovk.jpg',
                              fit: BoxFit.cover,
                            ),
                            const Text(
                              'Gói chăm sóc sức khỏe tại nhà cho người F0',
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Card(
                    child: InkWell(
                      splashColor: Colors.blue.withAlpha(30),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const WebViewContainer(
                                    "https://nld.com.vn/suc-khoe/y-te-tu-nhan-tham-gia-cham-soc-f0-2021120620274544.htm")));
                      },
                      child: SizedBox(
                        width: 150,
                        height: 100,
                        child: Column(
                          children: [
                            Image.network(
                              'https://nld.mediacdn.vn/291774122806476800/2021/12/6/14-hinh-chot-1638792338702513435853.jpg',
                              fit: BoxFit.cover,
                            ),
                            const Text('Y tế tư nhân tham gia chăm sóc F0'),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    ),
  );
}
}


