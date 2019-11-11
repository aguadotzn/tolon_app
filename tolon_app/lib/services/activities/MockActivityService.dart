import 'package:flutter/material.dart';
import 'package:tolon_app/screens/home/models/Activity.dart';
import 'package:tolon_app/screens/home/models/ActivityCategory.dart';
import 'package:tolon_app/screens/home/models/User.dart';
import 'package:tolon_app/services/activities/IActivityService.dart';
import 'package:tolon_app/styles/ImagesReferences.dart';

class MockActivityService implements IActivityService {
  @override
  List<Activity> getActivities() => _MockActivityStorage().activities;

  @override
  void add(Activity activity) =>
      _MockActivityStorage().activities.add(activity);
}

class _MockActivityStorage {
  final activities = [
    Activity(
      category: ActivityCategory(
        "Deporte de equipo",
        Image.asset(ImageReferences.basketCategory, color: Colors.white,),
      ),
      host: "Diego Rogel",
      date: DateTime(2019, 11, 11, 18, 30),
      location: "Abelgas",
      title: "Baloncesto",
      description:
          "Somos un equipo de 3 personas que buscan un partido amistoso de baloncesto en el polideportivo de Abelgas. ¡Todo el mundo es bienvenido!",
      attendingUsers: <User>[
        User(
            image: Image.asset(
              "assets/images/users/avatar1.png",
              color: Colors.white,
            ),
            name: "Sergio",
            telephone: 662818222),
        User(
            image: Image.asset(
              "assets/images/users/avatar3.png",
              color: Colors.white,
            ),
            name: "Andrea",
            telephone: 661341312),
        User(
            image: Image.asset(
              "assets/images/users/avatar5.png",
              color: Colors.white,
            ),
            name: "Adrián",
            telephone: 616157123),
      ],
    ),
    Activity(
      category: ActivityCategory(
        "Espectáculo",
        Image.asset(ImageReferences.theatreCategory, color: Colors.white),
      ),
      host: "Adrián Aguado",
      date: DateTime(2019, 11, 12, 19, 30),
      location: "Campazas",
      title: "Cine",
      description:
          "Tengo pensado coger el coche para ir al cine de León a pasar la tarde, puedo llevar hasta a 3 personas más.",
    ),
    Activity(
      category: ActivityCategory(
        "Deporte",
        Image.asset(ImageReferences.gymCategory, color: Colors.white),
      ),
      host: "Sergio Pascual",
      date: DateTime(2019, 11, 13, 19, 45),
      location: "Las Médulas",
      title: "Running",
      description:
          "¿Quién quiere venirse a correr por el monte con Andrea y conmigo?",
      attendingUsers: <User>[
        User(
            image: Image.asset(
              "assets/images/users/avatar3.png",
              color: Colors.white,
            ),
            name: "Andrea",
            telephone: 661341312),
      ],
    ),
    Activity(
      category: ActivityCategory(
        "Juegos",
        Image.asset(ImageReferences.gamesCategory, color: Colors.white),
      ),
      host: "Andrea Colina",
      date: DateTime(2019, 11, 15, 16, 30),
      location: "Horcada",
      title: "Parchís",
      description:
          "Hoy nos apetece ir a Horcada a jugar al parchís por la tarde, ¡y hemos hecho tortilla para dar y tomar!",
      attendingUsers: <User>[
        User(
            image: Image.asset(
              "assets/images/users/avatar1.png",
              color: Colors.white,
            ),
            name: "Sergio",
            telephone: 663413312),
        User(
            image: Image.asset(
              "assets/images/users/avatar2.png",
              color: Colors.white,
            ),
            name: "Diego",
            telephone: 667398112),
        User(
            image: Image.asset(
              "assets/images/users/avatar2.png",
              color: Colors.white,
            ),
            name: "Adrián",
            telephone: 669175812),
        User(
            image: Image.asset(
              "assets/images/users/avatar3.png",
              color: Colors.white,
            ),
            name: "Andrea",
            telephone: 612985387),
        User(
            image: Image.asset(
              "assets/images/users/avatar5.png",
              color: Colors.white,
            ),
            name: "Carmen",
            telephone: 661312322),
        User(
            image: Image.asset(
              "assets/images/users/avatar3.png",
              color: Colors.white,
            ),
            name: "Paula",
            telephone: 627328412),
        User(
            image: Image.asset(
              "assets/images/users/avatar4.png",
              color: Colors.white,
            ),
            name: "Andrés",
            telephone: 661341312),
      ],
    ),
    Activity(
      category: ActivityCategory(
        "Juegos de estrategia",
        Image.asset(ImageReferences.chessCategory, color: Colors.white),
      ),
      host: "Sergio Pascual",
      date: DateTime(2019, 11, 18, 15, 15),
      location: "Vegas del Condado",
      title: "Ajedrez",
      description:
      "Me gustaría encontrar una pareja de juegos para estudiar ajedrez.",
      attendingUsers: <User>[
        User(
            image: Image.asset(
              "assets/images/users/avatar2.png",
              color: Colors.white,
            ),
            name: "Adrián",
            telephone: 661341312),
      ],
    ),
    Activity(
      category: ActivityCategory(
        "Juegos de mesa",
        Image.asset(ImageReferences.gamesCategory, color: Colors.white),
      ),
      host: "Andrea Colina",
      date: DateTime(2019, 11, 18, 15, 15),
      location: "Villahibiera",
      title: "Risk",
      description:
      "Necesito dos personas más para jugar al Risk, interesados llamad a mi teléfono.",
      attendingUsers: <User>[
        User(
            image: Image.asset(
              "assets/images/users/avatar3.png",
              color: Colors.white,
            ),
            name: "Andrea",
            telephone: 661341312),
      ],
    ),
    Activity(
      category: ActivityCategory(
        "Espectáculos",
        Image.asset(ImageReferences.theatreCategory, color: Colors.white),
      ),
      host: "Andrea Colina",
      date: DateTime(2019, 11, 23, 15, 15),
      location: "San Pedro Mallo",
      title: "Baile",
      description:
      "Este sábado vamos a bajar a León a tomar unas tapas y bailar un poco, ¿quién se une?.",
      attendingUsers: <User>[
        User(
            image: Image.asset(
              "assets/images/users/avatar3.png",
              color: Colors.white,
            ),
            name: "Andrea",
            telephone: 661341312),
        User(
            image: Image.asset(
              "assets/images/users/avatar1.png",
              color: Colors.white,
            ),
            name: "Adrián",
            telephone: 661334312),
      ],
    ),
  ];

  static final _MockActivityStorage _singleton =
      _MockActivityStorage._internal();

  factory _MockActivityStorage() {
    return _singleton;
  }

  _MockActivityStorage._internal();
}
