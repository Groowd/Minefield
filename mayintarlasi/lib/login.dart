import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:mayintarlasi/main.dart';
import 'package:mayintarlasi/register.dart';
import 'dart:io';
import 'package:flutter/services.dart' show rootBundle;

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  @override
  var username;
  var password;
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  Widget build(BuildContext context) {
    Future<void> loginFunction(String username, String password) async {
      try {
        String fileContent =
            await rootBundle.loadString("lib/assets/textfiles/users.txt");
        List<String> lines = LineSplitter.split(fileContent).toList();

        for (String line in lines) {
          List<String> parts = line.split(".");
          if (parts.length == 2) {
            String storedUsername = parts[0].trim();
            String storedPassword = parts[1].trim();
            if (storedUsername == username && storedPassword == password) {
              print("Giriş başarılı!");
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Anasayfa()),
              );
              return;
            } else if (storedUsername == username &&
                storedPassword != password) {
              print("Şifre yanlış!");
              return;
            }
          }
        }
        // Döngü tamamlandığında, kullanıcı adı bulunamamıştır.
        print("Kullanıcı adı yanlış!");
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
                      controller: _usernameController,
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
                      controller: _passwordController,
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Center(
                      child: SizedBox(
                        width: deviceWidth / 2.7,
                        height: deviceHeight / 11,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0)),
                          ),
                          child: const Text(
                            "Login",
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          onPressed: () {
                            loginFunction(_usernameController.text,
                                _passwordController.text);
                          },
                        ),
                      ),
                    ),
                    Center(
                      child: SizedBox(
                        width: deviceWidth / 2.7,
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
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => RegisterScreen()));
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
