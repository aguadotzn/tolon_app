import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:tolon_app/screens/activity_form/ActivityFormInjector.dart';
import 'package:tolon_app/screens/activity_form/view_model/ActivityFormViewModel.dart';
import 'package:tolon_app/screens/activity_form/views/IActivityFormPage.dart';
import 'package:tolon_app/screens/home/models/Activity.dart';
import 'package:tolon_app/screens/home/models/ActivityCategory.dart';
import 'package:tolon_app/screens/home/models/User.dart';
import 'package:tolon_app/styles/ImagesReferences.dart';

class MockActivityFormPage extends Mock implements IActivityFormPage {}

final kTestActivity =     Activity(
  category: ActivityCategory(
    "testCategory",
    Image.asset(ImageReferences.gymCategory, color: Colors.white),
  ),
  host: "testHost",
  date: DateTime(2019, 11, 13, 19, 45),
  location: "testLocation",
  title: "testTitle",
  description:
  "testDescription",
  attendingUsers: <User>[
    User(
        image: Image.asset(
          "assets/images/users/avatar3.png",
          color: Colors.white,
        ),
        name: "testName",
        telephone: 661341312),
  ],
);

void main() {
  ActivityFormViewModel viewModel;
  IActivityFormPage view;

  setUp(() {
    view = MockActivityFormPage();
    viewModel = ActivityFormInjector.injectViewModel(view);
  });

  tearDown(() {
    view = null;
    viewModel = null;
  });

  group("ActivityFormViewModel - view notifications", () {
    group("given a joined activity", () {
      group("on activity joined", () {
        test("view is notified", () {
          viewModel.join(kTestActivity);
          verify(view.onActivityJoined());
        });
      });
    });
  });
}