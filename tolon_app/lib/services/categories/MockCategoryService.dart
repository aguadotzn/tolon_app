import 'package:flutter/material.dart';
import 'package:tolon_app/screens/home/models/ActivityCategory.dart';
import 'package:tolon_app/services/categories/ICategoryService.dart';
import 'package:tolon_app/styles/ImagesReferences.dart';

class MockCategoryService implements ICategoryService {
  @override
  List<ActivityCategory> getCategories() => [
        ActivityCategory(
          "Deportes de equipo",
          Image.asset(
            ImageReferences.basketCategory,
            color: Colors.white,
          ),
        ),
        ActivityCategory(
          "Espectáculos",
          Image.asset(
            ImageReferences.theatreCategory,
            color: Colors.white,
          ),
        ),
        ActivityCategory(
          "Juegos de mesa populares",
          Image.asset(
            ImageReferences.gamesCategory,
            color: Colors.white,
          ),
        ),
        ActivityCategory(
          "Juegos de estrategia",
          Image.asset(
            ImageReferences.chessCategory,
            color: Colors.white,
          ),
        ),
        ActivityCategory(
          "Deporte",
          Image.asset(
            ImageReferences.gymCategory,
            color: Colors.white,
          ),
        )
      ];
}
