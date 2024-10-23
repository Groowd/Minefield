import 'dart:math';
import 'package:flutter/material.dart';

class MinefieldGame {
  // Oyun değişkenlerini ayarlıyoruz
  static int row = 5;
  static int col = 5;
  static int cells = row * col;
  bool gameOver = false;
  bool levelUp = false;
  List<Cell> gameMap = [];
  static List<List<dynamic>> map = List.generate(
      row,
      (x) => List.generate(
          col, (y) => Cell(x, y, "lib/assets/images/diamond.png", false)));
  // Oyun alanını oluşturan fonksiyon
  void generateMap() {
    PlaceMines(16);
    for (int i = 0; i < row; i++) {
      for (int j = 0; j < col; j++) {
        gameMap.add(map[i][j]);
      }
    }
  }

  // Oyunu resetleyen fonksiyon
  void resetGame() {
    map = List.generate(
        row,
        (x) => List.generate(
            col, (y) => Cell(x, y, "lib/assets/images/diamond.png", false)));
    gameMap.clear();
    generateMap();
  }

  // Mayınları random yerleştiren fonksiyon
  static void PlaceMines(int minesNumber) {
    Random random = Random();
    Set<String> placedMineLocations = Set<String>();

    for (int i = 0; i < minesNumber; i++) {
      int mineRow, mineCol;
      String mineLocation;

      do {
        mineRow = random.nextInt(row);
        mineCol = random.nextInt(col);
        mineLocation = '$mineRow,$mineCol';
      } while (placedMineLocations.contains(mineLocation));

      placedMineLocations.add(mineLocation);
      map[mineRow][mineCol] =
          Cell(mineRow, mineCol, "lib/assets/images/mine.png", true);
    }
  }

  // Yandığımızda bütün mayınları ve boş alanları gösteren fonksiyon
  void showMines() {
    for (int i = 0; i < row; i++) {
      for (int j = 0; j < col; j++) {
        if (map[i][j].content == "lib/assets/images/mine.png" ||
            map[i][j].content == "lib/assets/images/diamond.png") {
          map[i][j].reveal = true;
        }
      }
    }
  }

  // Tıkladığımız hücre mayınsa oyunu bitiren değilse hücreyi açan fonksiyon
  void getClickedCell(Cell cell) {
    if (cell.content == "lib/assets/images/mine.png") {
      showMines();
      gameOver = true;
    } else {
      int counter = 0;
      cell.reveal = true;
      for (int i = 0; i < row; i++) {
        for (int j = 0; j < col; j++) {
          if (map[i][j].reveal == true &&
              map[i][j].content == "lib/assets/images/diamond.png") {
            counter += 1;
          }
        }
      }

      if (counter == 9) {
        showMines();
        levelUp = true;
        // 14 boş alanı da bulunca buraya geliyor
      }
    }
  }
}

class Cell {
  int row;
  int col;
  String content;
  bool reveal = false;
  Cell(this.row, this.col, this.content, this.reveal);
}
