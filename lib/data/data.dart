import 'package:flutter_task/Model/datamodel.dart';
import 'dart:convert';

Future<DataModel> fetchActivities() async {
  // Simulated JSON data
  String jsonData = '''
      {
        "dailyactivity": [
          {
            "section": "Start your day",
            "activity": [
              {
                "image": "assets/Rectangle 5.png",
                "header": "Chennai Mornings",
                "subheader": "Fresh Floral"
              },
              {
                "image": "assets/Rectangle 5 (1).png",
                "header": "Morning Coffee",
                "subheader": "Coffee"
              }
            ]
          },
          {
            "section": "Take an afternoon breather!",
            "activity": [
              {
                "image": "assets/Rectangle 5 (3).png",
                "header": "Pause",
                "subheader": "Vanilla Oud"
              },
              {
                "image": "assets/Rectangle 5 (4).png",
                "header": "Monsoon Evening",
                "subheader": "Rain"
              }
            ]
          },
          {
            "section": "At night",
            "activity": [
              {
                "image": "assets/Rectangle 5 (4).png",
                "header": "Stroll in the Tropics",
                "subheader": "Patchouli"
              }
            ]
          }
        ]
      }
    ''';
  final Map<String, dynamic> parsedJson = json.decode(jsonData);
  return DataModel.fromJson(parsedJson);
}
