import 'dart:convert';

import 'package:kimofit/features/workout_exercises/data/models/workout_body_response_model.dart';

String jsonString = '''
  {
    "warmup-exercise": {
      "name": {
        "en": "Lower Body Exercises",
        "ar": "تمارين الجزء السفلي"
      },
      "warm_up_category": "lower",
      "attachment": "https://kimofit-production.up.railway.app/media/warm_ups/WarmUpExercises_usCUhxe.jpg"
    }
  }
  ''';

Map<String, dynamic> jsonData = jsonDecode(jsonString);

WorkoutBodyResponseModel workoutBodyResponse =
    WorkoutBodyResponseModel.fromJson(jsonData);
