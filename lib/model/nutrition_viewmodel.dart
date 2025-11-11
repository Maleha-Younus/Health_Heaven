import 'package:flutter/material.dart';
import 'package:healthy_heaven/Controller/api_services.dart';

class NutritionViewModel extends ChangeNotifier {
  final NutritionApiService _apiService = NutritionApiService();

  bool isLoading = false;
  Map<String, dynamic>? nutritionData;
  String? errorMessage;

  Future<void> analyzeIngredient(String ingredient) async {
    if (ingredient.trim().isEmpty) return;

    isLoading = true;
    errorMessage = null;
    nutritionData = null;
    notifyListeners();

    try {
      final data = await _apiService.fetchNutrition(ingredient);

      //  Simplified — directly assign data
      if (data != null && data.isNotEmpty) {
        nutritionData = data;
      } else {
        errorMessage = "No nutrition data found for this ingredient.";
      }
    } catch (e) {
      errorMessage = "Error fetching data: $e";
    }

    isLoading = false;
    notifyListeners();
  }
}
