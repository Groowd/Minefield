import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:mayintarlasi/Levelfour.dart';
import 'package:mayintarlasi/levelthreehelper.dart';
import 'package:mayintarlasi/main.dart';

class Levelthree extends StatefulWidget {
  const Levelthree({super.key});

  @override
  State<Levelthree> createState() => _LevelthreeState();
}

class _LevelthreeState extends State<Levelthree> {
  MinefieldGame game = MinefieldGame();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    game.generateMap();
    game.resetGame();
  }

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
              title: Text(
                "Level 3",
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  //color: Colors.black,
                  color: HexColor("33186B"),
                ),
              ),
              centerTitle: true,
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
              // mayın alanları burada
              child: Stack(children: [
                GridView.builder(
                    // Oyun alanının ekran kenarlarına olan uzaklığını ayarlar
                    padding: EdgeInsets.fromLTRB(deviceWidth / 10,
                        deviceHeight / 12, deviceWidth / 10, deviceHeight / 4),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: MinefieldGame.row,
                      crossAxisSpacing: 0.9,
                      mainAxisSpacing: 0.9,
                    ),
                    itemCount: MinefieldGame.cells,
                    itemBuilder: (BuildContext ctx, index) {
                      return GestureDetector(
                        onTap: game.gameOver
                            ? null
                            : () {
                                setState(() {
                                  game.getClickedCell(game.gameMap[index]);
                                });
                              },
                        child: Container(
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('lib/assets/images/empty.png'),
                              fit: BoxFit.cover,
                            ),
                            //borderRadius: BorderRadius.circular(6.0)
                          ),
                          child: Center(
                            child: game.gameMap[index].reveal
                                ? game.gameMap[index].content ==
                                        "lib/assets/images/mine.png"
                                    ? Image.asset('lib/assets/images/mine.png')
                                    : Image.asset(
                                        'lib/assets/images/diamond.png')
                                : Image.asset('lib/assets/images/empty.png'),
                          ),
                        ),
                      );
                    }),
                if (game.gameOver)
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "You Lost",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 32.0,
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        SizedBox(
                          height: deviceHeight / 9,
                          width: deviceWidth / 1.5,
                          child: RawMaterialButton(
                            onPressed: () {
                              setState(() {
                                game.resetGame();
                                game.gameOver = false;
                              });
                            },
                            fillColor: Colors.white,
                            elevation: 0,
                            shape: const StadiumBorder(),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 64.0, vertical: 18.0),
                            child: const Text(
                              "Play Again",
                              style: TextStyle(
                                color: Colors.purple,
                                fontSize: 26.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                if (game.levelUp)
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Congratulations Level Up",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 32.0,
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        SizedBox(
                          height: deviceHeight / 9,
                          width: deviceWidth / 1.5,
                          child: RawMaterialButton(
                            onPressed: () {
                              setState(() {
                                game.levelUp = false;
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Levelfour()));
                              });
                            },
                            fillColor: Colors.white,
                            elevation: 0,
                            shape: const StadiumBorder(),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 64.0, vertical: 18.0),
                            child: const Text(
                              "Next Level",
                              style: TextStyle(
                                color: Colors.purple,
                                fontSize: 28.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                Center(
                  child: Padding(
                    padding: EdgeInsets.only(top: deviceHeight / 1.12),
                    child: SizedBox(
                      height: deviceHeight / 20,
                      width: deviceWidth / 2.3,
                      child: RawMaterialButton(
                        onPressed: () {
                          setState(() {
                            game.resetGame();
                            game.levelUp = false;
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Anasayfa()));
                          });
                        },
                        fillColor: Colors.white,
                        elevation: 0,
                        shape: const StadiumBorder(),
                        child: const Text(
                          "Go To Main Page",
                          style: TextStyle(
                            color: Colors.purple,
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ]),
            )),
      ),
    );
  }
}
