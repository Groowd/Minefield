import 'dart:convert';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:mayintarlasi/login.dart';
import 'dart:io';
import 'package:flutter/services.dart' show rootBundle;
import 'package:mayintarlasi/main.dart';
import 'package:path_provider/path_provider.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});
  var usernameregister;
  var passwordregister;
  final _usernameControllerRegister = TextEditingController();
  final _passwordControllerRegister = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Future<void> registerFunction(String username, String password) async {
      var file = File('lib/assets/textfiles/users.txt');
      try {
        String fileContent =
            await rootBundle.loadString("lib/assets/textfiles/users.txt");
        List<String> linesRegister = LineSplitter.split(fileContent).toList();

        for (String line in linesRegister) {
          List<String> partsRegister = line.split(".");
          if (partsRegister.length == 2) {
            String storedUsernameRegister = partsRegister[0].trim();
            String storedPasswordRegister = partsRegister[1].trim();
            if (storedUsernameRegister == username) {
              print("Bu kullanıcı adı zaten kullanılmakta!");
              return;
            }
          }
        }
        print("Kullanıcı kaydı başarılı!");
        final directory = await getApplicationDocumentsDirectory();
        final file = File('${directory.path}/users.txt');
        await file.writeAsString('$username.$password');

        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Anasayfa()),
        );
        return;
      } catch (e) {
        print("Hata: Dosya okuma hatası - $e");
      }
    }

    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
        ), //aynı zamanda geri gitme tuşu oluşturuyor
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
          child: Padding(
            //padding: EdgeInsets.all(deviceWidth / 14),
            padding: EdgeInsets.fromLTRB(deviceWidth / 14, deviceHeight / 15,
                deviceWidth / 14, deviceHeight / 15),
            child: Column(
              children: [
                Form(
                    child: Column(
                  children: [
                    TextFormField(
                      controller: _usernameControllerRegister,
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.account_circle),
                          labelText: "Username",
                          labelStyle: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                    ),
                  ],
                )),
                SizedBox(height: deviceHeight / 35),
                Form(
                    child: Column(
                  children: [
                    TextFormField(
                      controller: _passwordControllerRegister,
                      obscureText: true,
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.lock),
                          labelText: "Password",
                          labelStyle: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                    ),
                  ],
                )),
                SizedBox(height: deviceHeight / 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: SizedBox(
                        width: deviceWidth / 2,
                        height: deviceHeight / 11,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0)),
                          ),
                          child: const Text(
                            "Register",
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          onPressed: () {
                            registerFunction(_usernameControllerRegister.text,
                                _passwordControllerRegister.text);
                          },
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
    );
  }
}
