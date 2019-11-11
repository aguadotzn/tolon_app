import 'package:tolon_app/screens/home/models/ActivityCategory.dart';

abstract class ICategoryService {
  List<ActivityCategory> getCategories();
}