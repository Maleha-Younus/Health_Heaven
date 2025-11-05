import 'dart:convert';
import 'package:http/http.dart' as http;

class NutritionApiService {
  static const String appId = '2d204d0d';
  static const String appKey = '7351e1ac7be36cbd1d21f806fcc3b6c0';

  Future<Map<String, dynamic>?> fetchNutrition(String ingredient) async {
    // Agar user ne quantity nahi di, to default 1 cup lagao
    if (!ingredient.contains(RegExp(r'\d'))) {
      ingredient = "1 cup $ingredient";
    }

    final url =
        'https://api.edamam.com/api/nutrition-data?app_id=$appId&app_key=$appKey&ingr=${Uri.encodeComponent(ingredient)}';

    try {
      print('🔹 Fetching nutrition for: $ingredient');
      print('🔹 URL: $url');

      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        print('✅ API Response: ${response.body}');

        // correct path for nutrients
        final nutrients = data['ingredients']?[0]?['parsed']?[0]?['nutrients'];

        if (nutrients != null && nutrients.isNotEmpty) {
          return {
            'calories': nutrients['ENERC_KCAL']?['quantity'] ?? 0.0,
            'protein': nutrients['PROCNT']?['quantity'] ?? 0.0,
            'carbs': nutrients['CHOCDF']?['quantity'] ?? 0.0,
            'fat': nutrients['FAT']?['quantity'] ?? 0.0,
          };
        } else {
          throw Exception('Invalid or empty nutrition data');
        }
      } else {
        print('❌ Failed request. Status code: ${response.statusCode}');
        throw Exception('Failed to load nutrition data');
      }
    } catch (e) {
      print('⚠️ Error fetching data: $e');
      throw Exception('Error fetching data: $e');
    }
  }
}
