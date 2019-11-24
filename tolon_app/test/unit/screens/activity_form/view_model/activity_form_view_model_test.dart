import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:tolon_app/screens/activity_form/ActivityFormInjector.dart';
import 'package:tolon_app/screens/activity_form/repository/IActivityFormRepository.dart';
import 'package:tolon_app/screens/activity_form/view_model/ActivityFormViewModel.dart';
import 'package:tolon_app/screens/activity_form/views/IActivityFormPage.dart';
import 'package:tolon_app/screens/home/models/Activity.dart';
import 'package:tolon_app/screens/home/models/ActivityCategory.dart';
import 'package:tolon_app/screens/home/models/User.dart';
import 'package:tolon_app/styles/ImagesReferences.dart';

class MockActivityFormPage extends Mock implements IActivityFormPage {}

class MockActivityRepository extends Mock implements IActivityFormRepository {}

final kTestActivity = Activity(
  id: "testId",
  category: ActivityCategory(
    "testCategory",
    Image.asset(ImageReferences.gymCategory, color: Colors.white),
  ),
  host: "testHost",
  date: DateTime(2019, 11, 13, 19, 45),
  location: "testLocation",
  title: "testTitle",
  description: "testDescription",
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
  IActivityFormRepository repository;

  group("ActivityFormViewModel - view notifications", () {
    setUp(() {
      view = MockActivityFormPage();
      viewModel = ActivityFormInjector.injectViewModel(view);
    });

    tearDown(() {
      view = null;
      viewModel = null;
    });

    group("given a joined activity", () {
      group("on activity joined", () {
        test("view is notified with joined state changed", () async {
          viewModel.join(kTestActivity, isCurrentlyJoined: true);
          await untilCalled(view.onActivityJoined(any));
          verify(view.onActivityJoined(false));
        });
      });
    });

    group("given a not joined activity", () {
      group("on activity joined", () {
        test("view is notified with joined state changed", () async {
          viewModel.join(kTestActivity, isCurrentlyJoined: false);
          await untilCalled(view.onActivityJoined(any));
          verify(view.onActivityJoined(true));
        });
      });
    });
  });

  group("ActivityFormViewModel - repository notifications", () {
    setUp(() {
      view = MockActivityFormPage();
      repository = MockActivityRepository();
      viewModel = ActivityFormInjector.injectViewModel(
        view,
        repository: repository,
      );
    });

    tearDown(() {
      view = null;
      viewModel = null;
      repository = null;
    });

    group("given a joined activity", () {
      group("on activity joined", () {
        test("repository is told to unjoin activity", () {
          viewModel.join(kTestActivity, isCurrentlyJoined: true);
          verify(repository.join(kTestActivity.id, willJoin: false));
        });
      });
    });

    group("given a not joined activity", () {
      group("on activity joined", () {
        test("repository is told to join activity", () {
          viewModel.join(kTestActivity, isCurrentlyJoined: true);
          verify(repository.join(kTestActivity.id, willJoin: false));
        });
      });
    });
  });
}
