import 'package:flutter/material.dart';
import 'package:tolon_app/screens/home/models/Activity.dart';
import 'package:tolon_app/screens/home/models/ActivityCategory.dart';
import 'package:tolon_app/screens/home/models/User.dart';
import 'AddActivityIB.dart';
import 'package:tolon_app/services/categories/MockCategoryService.dart';
import 'package:tolon_app/services/activities/MockActivityService.dart';

class AddActivityPage extends StatefulWidget {
  final User creator;

  AddActivityPage(this.creator);

  @override
  _AddActivityPageState createState() => _AddActivityPageState();
}

class _AddActivityPageState extends State<AddActivityPage> {

  TextEditingController activityTitleController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  DateTime selectedDate;
  bool joinMe = false;
  List<ActivityCategory> categories = [];
  ActivityCategory selectedCategory;

  MockActivityService activityService;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var categoryService = MockCategoryService();
    categories = categoryService.getCategories();
    selectedCategory = categories.first;
    activityService = MockActivityService();
  }

  void onAddEvent() {
    Activity activity = Activity(
      host: widget.creator.name,
      title: activityTitleController.text,
      category: selectedCategory,
      date: DateTime(
        selectedDate.year,
        selectedDate.month,
        selectedDate.day,
        selectedDate.hour,
        selectedDate.minute
      ),
      description: descriptionController.text,
      location: locationController.text,
      attendingUsers: joinMe ? [widget.creator] : []
    );

    activityService.add(activity);

    Navigator.of(context).pop();
  }

  void onDateSelected(DateTime date) {
    setState(() {
      selectedDate = date;
    });
  }

  void onJoinMe(bool joinMe) {
    setState(() {
      this.joinMe = joinMe;
    });
  }

  void onCategorySelected(ActivityCategory category) {
    setState(() {
      print(category.name);
      selectedCategory = category;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AddActivityIB.build(
      context,
      onAddEvent,
      activityTitleController,
      locationController,
      descriptionController,
      selectedDate,
      onDateSelected,
      onJoinMe,
      joinMe,
      categories,
      selectedCategory,
      onCategorySelected,
    );
  }
}
