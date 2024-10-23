import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:mayintarlasi/main.dart';

class howtoplay extends StatefulWidget {
  const howtoplay({super.key});

  @override
  State<howtoplay> createState() => _howtoplayState();
}

class _howtoplayState extends State<howtoplay> {
  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
          ),
          body: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
              colors: [
                HexColor("40F8FF"),
                HexColor("45FFCA"),
                HexColor("80B3FF"),
                HexColor("A084E8"),
                HexColor("F875AA"),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            )),
            //Text("Oyun dört seviyeden oluşur. Level1: 3x3 alan 1 mayın, Level2: 4x4 alan 2 mayın, Level3: 5x5 alan 3 mayın ve son seviye yani Level4: 5x5 alan 16 mayından oluşur. Oyunun amacı mayınlara basmadan bütün elmasları bulup level atlamaktır",style: TextStyle(fontSize: 14),),
            child: Padding(
              padding: EdgeInsets.only(left: deviceWidth / 35),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    //oyunun amacı
                    children: [
                      Expanded(
                        child: Text(
                          "Oyun dört seviyeden oluşur. Level1: 3x3 alan 1 mayın, Level2: 4x4 alan 2 mayın, Level3: 5x5 alan 3 mayın ve son seviye yani Level4: 5x5 alan 16 mayından oluşur. Oyunun amacı mayınlara basmadan bütün elmasları bulup level atlamaktır.",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: deviceHeight / 50,
                  ),
                  Row(
                    //yanma
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Image(
                          image: AssetImage("lib/assets/images/lost.png"),
                          width: deviceWidth / 2.8,
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(left: deviceWidth / 40),
                          child: Text(
                            "Mayına bastığınız zaman kaybedersiniz. Görüntüdeki gibi tekrar oynama butonu gelir.",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: deviceHeight / 50,
                  ),
                  Row(
                    //level atlama
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Image(
                          image: AssetImage("lib/assets/images/levelup.png"),
                          width: deviceWidth / 2.8,
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(left: deviceWidth / 40),
                          child: Text(
                            "Mayına basmadan bütün elmasları topladığınızda oyunu kazanır, varsa bir sonraki seviyeye geçersiniz. Görüntüdeki gibi sıradaki seviyeye geçme butonu gelir.",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: deviceHeight / 50,
                  ),
                  Row(
                    //oyunu bitirme
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Image(
                          image: AssetImage("lib/assets/images/end.png"),
                          width: deviceWidth / 2.8,
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(left: deviceWidth / 40),
                          child: Text(
                            "Son seviyede (Level 4) bütün elmasları bulduğunuzda oyunu bitirmiş olursunuz. Görüntüdeki gibi anasayfaya dönme butonu gelir.",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: deviceHeight / 80,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    //anasayfaya dönüş butonu
                    children: [
                      RawMaterialButton(
                        onPressed: () {
                          setState(() {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Anasayfa()));
                          });
                        },
                        fillColor: Colors.white,
                        elevation: 0,
                        shape: const StadiumBorder(),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 64.0, vertical: 18.0),
                        child: const Text(
                          "Go To Main Page",
                          style: TextStyle(
                            color: Colors.purple,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
