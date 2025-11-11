import 'package:flutter/material.dart';

class WaterProvider extends ChangeNotifier {
  double _progress = 0.0;
  double _goalLitres = 2.7;
  double _currentLitres = 0.0;
  int _filledCups = 0;

  double get progress => _progress;
  double get currentLitres => _currentLitres;
  double get goalLitres => _goalLitres;
  int get filledCups => _filledCups;

  void addWater(double litre) {
    _currentLitres += litre;
    if (_currentLitres > _goalLitres) _currentLitres = _goalLitres;

    // 🔹 Update cups count based on litres
    double litrePerCup = _goalLitres / 20;
    _filledCups = (_currentLitres / litrePerCup).round();

    _progress = _currentLitres / _goalLitres;
    notifyListeners();
  }

  void setCups(int cups) {
    _filledCups = cups;
    double litrePerCup = _goalLitres / 20;
    _currentLitres = _filledCups * litrePerCup;
    _progress = _currentLitres / _goalLitres;
    notifyListeners();
  }

  void resetWater() {
    _currentLitres = 0;
    _filledCups = 0;
    _progress = 0;
    notifyListeners();
  }
}
