import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:tolon_app/widgets/ActivityFormLayout.dart';
import 'package:tolon_app/widgets/ActivityHeader.dart';
import 'package:tolon_app/styles/TolonTheme.dart' as theme;
import 'package:tolon_app/screens/home/models/ActivityCategory.dart';

class AddActivityIB {
  static Widget build(
    BuildContext context,
    Function onAdd,
    TextEditingController activityTitleController,
    TextEditingController locationController,
    TextEditingController descriptionController,
    DateTime date,
    Function(DateTime date) onDateSelected,
    Function(bool value) onJoinMe,
    bool joinMe,
    List<ActivityCategory> categories,
    ActivityCategory selectedCategory,
    Function(ActivityCategory) onSelectedCategory,
  ) =>
      Scaffold(
        appBar: AppBar(
          title: Text(
            "Crear actividad",
            style: theme.titleStyleBright(context),
          ),
        ),
        body: ActivityFormLayout(
          header: ActivityHeader(
            image: selectedCategory.image,
            title: TextField(
              style: theme.headlineStyle(context),
              controller: activityTitleController,
              decoration: InputDecoration(
                hintText: "Título...",
              ),
            ),
          ),
          action: RaisedButton(
            child: Text(
              "Añadir evento",
              style: theme.getThemeData().textTheme.button,
            ),
            onPressed: () => onAdd(),
          ),
          category: ListTile(
            title: DropdownButton(
                value: selectedCategory,
                underline: Container(),
                items: categories
                    .map((value) => DropdownMenuItem(
                          value: value,
                          child: Row(
                            children: <Widget>[
                              ClipOval(
                                child: Container(
                                  color: Theme.of(context).primaryColor,
                                  width: 40,
                                  height: 40,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: value.image,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 16,
                              ),
                              Text(value.name),
                            ],
                          ),
                        ))
                    .toList(),
                onChanged: (value) => onSelectedCategory(value)),
          ),
          time: ListTile(
            leading: Icon(Icons.access_time),
            title: Text(
              "Fecha y hora",
            ),
            subtitle: Text(
              date != null
                  ? "${date.day.toString().padLeft(2, "0")}/${date.month.toString().padLeft(2, "0")}/${date.year} - ${date.hour.toString().padLeft(2, "0")}:${date.minute.toString().padLeft(2, "0")}"
                  : "Seleccione una fecha...",
            ),
            onTap: () => DatePicker.showDateTimePicker(
              context,
              currentTime: date,
              minTime: DateTime.now(),
              locale: LocaleType.es,
              onConfirm: (date) {
                onDateSelected(date);
              },
            ),
          ),
          location: ListTile(
            leading: Icon(Icons.location_on),
            title: Text(
              "Lugar",
            ),
            subtitle: TextField(
              style: Theme.of(context).textTheme.subtitle,
              controller: locationController,
              decoration: InputDecoration(
                  hintStyle: Theme.of(context).textTheme.subtitle,
                  hintText: "Introduzca el lugar del evento...",
                  contentPadding: EdgeInsets.zero,
                  border: InputBorder.none),
            ),
          ),
          host: ListTile(
            contentPadding: const EdgeInsets.symmetric(horizontal: 4),
            leading:
                Checkbox(value: joinMe, onChanged: (value) => onJoinMe(value)),
            title: Text(
              "Unirme al evento",
            ),
          ),
          body: TextField(
            style: Theme.of(context).textTheme.subtitle,
            keyboardType: TextInputType.multiline,
            minLines: 1,
            maxLines: 5,
            controller: descriptionController,
            decoration: InputDecoration(
              labelText: "Descripción del evento:",
              labelStyle: Theme.of(context).textTheme.subtitle.copyWith(
                    fontSize: 16,
                  ),
              border: OutlineInputBorder(),
            ),
          ),
        ),
      );
}
