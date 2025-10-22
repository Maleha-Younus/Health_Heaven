import 'package:flutter/material.dart';
import 'package:healthy_heaven/view/Home/notification.dart';
import 'package:healthy_heaven/view_model/nutrition_viewmodel.dart';
import 'package:provider/provider.dart';

class MealScreen extends StatefulWidget {
  const MealScreen({Key? key}) : super(key: key);

  @override
  State<MealScreen> createState() => _MealScreenState();
}

class _MealScreenState extends State<MealScreen> {
  final TextEditingController _controller = TextEditingController();

  Widget nutrientCard(
    String label,
    IconData icon,
    dynamic value,
    String unit,
    Color iconColor,
  ) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.symmetric(vertical: 6),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: iconColor.withOpacity(0.15),
          child: Icon(icon, color: iconColor),
        ),
        title: Text(label, style: const TextStyle(fontWeight: FontWeight.w600)),
        trailing: Text(
          value != null ? "${value.toStringAsFixed(1)} $unit" : "— $unit",
          style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }

  final GlobalKey<ScaffoldState> _key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    final nutritionVM = Provider.of<NutritionViewModel>(context);

    return Scaffold(
      key: _key,
      backgroundColor: const Color(0xffF9F6FF),
      appBar: AppBar(
        title: Text("Meal Nutrition", style: TextStyle(color: Colors.white)),
        backgroundColor: const Color(0xff74A73D),
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.menu,
            color: Colors.white,
          ), // 👈 Menu icon white
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.notifications,
              color: Colors.white,
            ), // 👈 Notification icon white
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const NotificationScreen(),
                ),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.restaurant_menu_outlined),
                hintText: "Enter ingredient (e.g. 1 cup rice)",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
            const SizedBox(height: 16),

            ElevatedButton(
              onPressed: () {
                final ingredient = _controller.text.trim();
                if (ingredient.isNotEmpty) {
                  nutritionVM.analyzeIngredient(ingredient);
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xff74A73D),
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              child: const Text(
                "Analyze Nutrition",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
            const SizedBox(height: 20),

            if (nutritionVM.isLoading)
              const CircularProgressIndicator(color: Color(0xff6A4C93))
            else if (nutritionVM.errorMessage != null)
              Text(
                nutritionVM.errorMessage!,
                style: const TextStyle(color: Colors.red, fontSize: 14),
              )
            else if (nutritionVM.nutritionData != null)
              Expanded(
                child: ListView(
                  children: [
                    nutrientCard(
                      "Calories",
                      Icons.local_fire_department,
                      nutritionVM.nutritionData!["calories"],
                      "kcal",
                      Colors.orange,
                    ),
                    nutrientCard(
                      "Protein",
                      Icons.restaurant,
                      nutritionVM.nutritionData!["protein"],
                      "g",
                      Colors.green,
                    ),
                    nutrientCard(
                      "Carbs",
                      Icons.breakfast_dining,
                      nutritionVM.nutritionData!["carbs"],
                      "g",
                      Colors.blue,
                    ),
                    nutrientCard(
                      "Fat",
                      Icons.local_pizza,
                      nutritionVM.nutritionData!["fat"],
                      "g",
                      Colors.pink,
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
