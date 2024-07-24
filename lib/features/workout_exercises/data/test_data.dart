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
  },
  "workout-exercises": [
      {
      "name": {
        "en": "Cardio Exercises",
        "ar": "تمارين القلب"
      },
      "image": "https://kimofit-production.up.railway.app/media/sponsers/club30_xzkc0cr.jpg",
      "video": "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerFun.mp4",
      "logs": [
        {"sets": 5, "reps": 30, "weight": 1.5},
        {"sets": 5, "reps": 25, "weight": 1.2}
      ],
      "notes": [
        "استشارة المدرب في حالة الشعور بأي ألم أثناء التمرين.",
        "التأكد من أخذ يوم راحة بين التمارين لتجنب الإجهاد."
      ],
      "description": [
        "قف بشكل مستقيم وابدأ الجري في مكانك.",
        "قم بزيادة السرعة تدريجيًا للحفاظ على معدل ضربات القلب.",
        "كرر التمرين بالعدد المحدد من المرات."
      ]
    },
    {
      "name": {
        "en": "Lower Body Exercises",
        "ar": "تمارين الجزء السفلي"
      },
      "image": "https://kimofit-production.up.railway.app/media/sponsers/club30_xzkc0cr.jpg",
      "video": "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4",
      "logs": [
        {"sets": 1, "reps": 15, "weight": 10},
        {"sets": 2, "reps": 20, "weight": 15},
        {"sets": 3, "reps": 5, "weight": 20.0},
        {"sets": 4, "reps": 15, "weight": 25.0},
        {"sets": 5, "reps": 15, "weight": 7.5}
      ],
      "notes": [
        "لا تنسى الإحماء قبل بدء التمارين.",
        "شرب الماء بكثرة خلال اليوم.",
        "الحفاظ على تناول غذاء متوازن للحصول على أفضل النتائج.",
        "استشارة المدرب في حالة الشعور بأي ألم أثناء التمرين.",
        "التأكد من أخذ يوم راحة بين التمارين لتجنب الإجهاد.",
        "تسجيل التقدم والأوزان المستخدمة في كل تمرين."
      ],
      "description": [
        "اضبط مقعد الآلة بحيث تكون ركبتيك في نفس مستوى المحور.",
        "اجلس بشكل مستقيم وقدميك تحت الوسادة.",
        "ثبت قدميك بإحكام وامسك بمقابض الآلة للدعم.",
        "قم بتمديد ساقيك للأمام ببطء حتى تكون في وضع مستقيم.",
        "احتفظ بالوضع النهائي للحظة قبل أن تعود إلى وضع البداية ببطء.",
        "تأكد من التنفس بشكل صحيح، استنشق عند الخفض وزفر عند التمديد.",
        "ابدأ بأوزان خفيفة لضمان القيام بالحركة بشكل صحيح وتجنب الإصابات."
      ],
      "group-id": 3
    },
    {
      "name": {
        "en": "Upper Body Exercises",
        "ar": "تمارين الجزء العلوي"
      },
      "image": "https://kimofit-production.up.railway.app/media/sponsers/club30_xzkc0cr.jpg",
      "video": "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4",
      "logs": [
        {"sets": 3, "reps": 12, "weight": 15},
        {"sets": 3, "reps": 10, "weight": 20},
        {"sets": 3, "reps": 8, "weight": 25}
      ],
      "notes": [
        "الإحماء ضروري قبل بدء التمارين.",
        "تأكد من التنفس بشكل صحيح أثناء التمرين.",
        "الحفاظ على وضعية جيدة لتجنب الإصابات."
      ],
      "description": [
        "قف بشكل مستقيم مع قدميك على عرض الكتفين.",
        "امسك الأوزان بكلتا يديك وابدأ برفعها للأعلى.",
        "تأكد من تثبيت المرفقين وعدم تحريكهم كثيرًا أثناء الرفع.",
        "كرر التمرين بالعدد المحدد من المرات."
      ],
      "group-id": 3
    },
    {
      "name": {
        "en": "Core Exercises",
        "ar": "تمارين البطن"
      },
      "image": "https://kimofit-production.up.railway.app/media/sponsers/club30_xzkc0cr.jpg",
      "video": "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/Sintel.mp4",
      "logs": [
        {"sets": 4, "reps": 20, "weight": 0},
        {"sets": 4, "reps": 15, "weight": 0},
        {"sets": 4, "reps": 10, "weight": 0}
      ],
      "notes": [
        "شرب الماء بكثرة خلال اليوم.",
        "الحفاظ على تناول غذاء متوازن للحصول على أفضل النتائج."
      ],
      "description": [
        "استلقِ على ظهرك وضع يديك خلف رأسك.",
        "ارفع جذعك ببطء باتجاه ركبتيك.",
        "حافظ على وضعية مريحة خلال التمرين.",
        "كرر التمرين بالعدد المحدد من المرات."
      ],
      "group-id": 3
    },
    {
      "name": {
        "en": "Cardio Exercises",
        "ar": "تمارين القلب"
      },
      "image": "https://kimofit-production.up.railway.app/media/sponsers/club30_xzkc0cr.jpg",
      "video": "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerFun.mp4",
      "logs": [
        {"sets": 5, "reps": 30, "weight": 1.5},
        {"sets": 5, "reps": 25, "weight": 1.2}
      ],
      "notes": [
        "استشارة المدرب في حالة الشعور بأي ألم أثناء التمرين.",
        "التأكد من أخذ يوم راحة بين التمارين لتجنب الإجهاد."
      ],
      "description": [
        "قف بشكل مستقيم وابدأ الجري في مكانك.",
        "قم بزيادة السرعة تدريجيًا للحفاظ على معدل ضربات القلب.",
        "كرر التمرين بالعدد المحدد من المرات."
      ]
    },
    {
      "name": {
        "en": "Stretching Exercises",
        "ar": "تمارين الإطالة"
      },
      "image": "https://kimofit-production.up.railway.app/media/sponsers/club30_xzkc0cr.jpg",
      "video": "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerJoyrides.mp4",
      "logs": [
        {"sets": 2, "reps": 15, "weight": 10},
        {"sets": 3, "reps": 20, "weight": 15}
      ],
      "notes": [
        "التأكد من الحفاظ على التنفس بشكل صحيح خلال التمرين.",
        "ابدأ بأوزان خفيفة لضمان القيام بالحركة بشكل صحيح وتجنب الإصابات."
      ],
      "description": [
        "ابدأ بوضعية الوقوف بشكل مستقيم.",
        "قم بثني الجسم للأمام ولمس أصابع القدمين.",
        "حافظ على الوضعية لعدة ثوانٍ.",
        "كرر التمرين بالعدد المحدد من المرات."
      ],
      "group-id": 2
    },
    {
      "name": {
        "en": "Balance Exercises",
        "ar": "تمارين التوازن"
      },
      "image": "https://kimofit-production.up.railway.app/media/sponsers/club30_xzkc0cr.jpg",
      "video": "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerEscapes.mp4",
      "logs": [
        {"sets": 3, "reps": 10, "weight": 5},
        {"sets": 3, "reps": 15, "weight": 10}
      ],
      "notes": [
        "حافظ على وضعية مريحة خلال التمرين.",
        "التأكد من الحفاظ على التنفس بشكل صحيح خلال التمرين."
      ],
      "description": [
        "ابدأ بالوقوف على ساق واحدة.",
        "حافظ على التوازن لأطول فترة ممكنة.",
        "كرر التمرين بالعدد المحدد من المرات."
      ],
      "group-id": 2
    }
  ],
  "abs-exercises": [
      {
      "name": {
        "en": "Cardio Exercises",
        "ar": "تمارين القلب"
      },
      "image": "https://kimofit-production.up.railway.app/media/sponsers/club30_xzkc0cr.jpg",
      "video": "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerFun.mp4",
      "logs": [
        {"sets": 5, "reps": 30, "weight": 1.5},
        {"sets": 5, "reps": 25, "weight": 1.2}
      ],
      "notes": [
        "استشارة المدرب في حالة الشعور بأي ألم أثناء التمرين.",
        "التأكد من أخذ يوم راحة بين التمارين لتجنب الإجهاد."
      ],
      "description": [
        "قف بشكل مستقيم وابدأ الجري في مكانك.",
        "قم بزيادة السرعة تدريجيًا للحفاظ على معدل ضربات القلب.",
        "كرر التمرين بالعدد المحدد من المرات."
      ]
    },
    {
      "name": {
        "en": "Lower Body Exercises",
        "ar": "تمارين الجزء السفلي"
      },
      "image": "https://kimofit-production.up.railway.app/media/sponsers/club30_xzkc0cr.jpg",
      "video": "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4",
      "logs": [
        {"sets": 1, "reps": 15, "weight": 10},
        {"sets": 2, "reps": 20, "weight": 15},
        {"sets": 3, "reps": 5, "weight": 20.0},
        {"sets": 4, "reps": 15, "weight": 25.0},
        {"sets": 5, "reps": 15, "weight": 7.5}
      ],
      "notes": [
        "لا تنسى الإحماء قبل بدء التمارين.",
        "شرب الماء بكثرة خلال اليوم.",
        "الحفاظ على تناول غذاء متوازن للحصول على أفضل النتائج.",
        "استشارة المدرب في حالة الشعور بأي ألم أثناء التمرين.",
        "التأكد من أخذ يوم راحة بين التمارين لتجنب الإجهاد.",
        "تسجيل التقدم والأوزان المستخدمة في كل تمرين."
      ],
      "description": [
        "اضبط مقعد الآلة بحيث تكون ركبتيك في نفس مستوى المحور.",
        "اجلس بشكل مستقيم وقدميك تحت الوسادة.",
        "ثبت قدميك بإحكام وامسك بمقابض الآلة للدعم.",
        "قم بتمديد ساقيك للأمام ببطء حتى تكون في وضع مستقيم.",
        "احتفظ بالوضع النهائي للحظة قبل أن تعود إلى وضع البداية ببطء.",
        "تأكد من التنفس بشكل صحيح، استنشق عند الخفض وزفر عند التمديد.",
        "ابدأ بأوزان خفيفة لضمان القيام بالحركة بشكل صحيح وتجنب الإصابات."
      ],
      "group-id": 3
    },
    {
      "name": {
        "en": "Upper Body Exercises",
        "ar": "تمارين الجزء العلوي"
      },
      "image": "https://kimofit-production.up.railway.app/media/sponsers/club30_xzkc0cr.jpg",
      "video": "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4",
      "logs": [
        {"sets": 3, "reps": 12, "weight": 15},
        {"sets": 3, "reps": 10, "weight": 20},
        {"sets": 3, "reps": 8, "weight": 25}
      ],
      "notes": [
        "الإحماء ضروري قبل بدء التمارين.",
        "تأكد من التنفس بشكل صحيح أثناء التمرين.",
        "الحفاظ على وضعية جيدة لتجنب الإصابات."
      ],
      "description": [
        "قف بشكل مستقيم مع قدميك على عرض الكتفين.",
        "امسك الأوزان بكلتا يديك وابدأ برفعها للأعلى.",
        "تأكد من تثبيت المرفقين وعدم تحريكهم كثيرًا أثناء الرفع.",
        "كرر التمرين بالعدد المحدد من المرات."
      ],
      "group-id": 3
    },
    {
      "name": {
        "en": "Core Exercises",
        "ar": "تمارين البطن"
      },
      "image": "https://kimofit-production.up.railway.app/media/sponsers/club30_xzkc0cr.jpg",
      "video": "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/Sintel.mp4",
      "logs": [
        {"sets": 4, "reps": 20, "weight": 0},
        {"sets": 4, "reps": 15, "weight": 0},
        {"sets": 4, "reps": 10, "weight": 0}
      ],
      "notes": [
        "شرب الماء بكثرة خلال اليوم.",
        "الحفاظ على تناول غذاء متوازن للحصول على أفضل النتائج."
      ],
      "description": [
        "استلقِ على ظهرك وضع يديك خلف رأسك.",
        "ارفع جذعك ببطء باتجاه ركبتيك.",
        "حافظ على وضعية مريحة خلال التمرين.",
        "كرر التمرين بالعدد المحدد من المرات."
      ],
      "group-id": 3
    },
    {
      "name": {
        "en": "Cardio Exercises",
        "ar": "تمارين القلب"
      },
      "image": "https://kimofit-production.up.railway.app/media/sponsers/club30_xzkc0cr.jpg",
      "video": "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerFun.mp4",
      "logs": [
        {"sets": 5, "reps": 30, "weight": 1.5},
        {"sets": 5, "reps": 25, "weight": 1.2}
      ],
      "notes": [
        "استشارة المدرب في حالة الشعور بأي ألم أثناء التمرين.",
        "التأكد من أخذ يوم راحة بين التمارين لتجنب الإجهاد."
      ],
      "description": [
        "قف بشكل مستقيم وابدأ الجري في مكانك.",
        "قم بزيادة السرعة تدريجيًا للحفاظ على معدل ضربات القلب.",
        "كرر التمرين بالعدد المحدد من المرات."
      ]
    },
    {
      "name": {
        "en": "Stretching Exercises",
        "ar": "تمارين الإطالة"
      },
      "image": "https://kimofit-production.up.railway.app/media/sponsers/club30_xzkc0cr.jpg",
      "video": "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerJoyrides.mp4",
      "logs": [
        {"sets": 2, "reps": 15, "weight": 10},
        {"sets": 3, "reps": 20, "weight": 15}
      ],
      "notes": [
        "التأكد من الحفاظ على التنفس بشكل صحيح خلال التمرين.",
        "ابدأ بأوزان خفيفة لضمان القيام بالحركة بشكل صحيح وتجنب الإصابات."
      ],
      "description": [
        "ابدأ بوضعية الوقوف بشكل مستقيم.",
        "قم بثني الجسم للأمام ولمس أصابع القدمين.",
        "حافظ على الوضعية لعدة ثوانٍ.",
        "كرر التمرين بالعدد المحدد من المرات."
      ],
      "group-id": 2
    },
    {
      "name": {
        "en": "Balance Exercises",
        "ar": "تمارين التوازن"
      },
      "image": "https://kimofit-production.up.railway.app/media/sponsers/club30_xzkc0cr.jpg",
      "video": "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerEscapes.mp4",
      "logs": [
        {"sets": 3, "reps": 10, "weight": 5},
        {"sets": 3, "reps": 15, "weight": 10}
      ],
      "notes": [
        "حافظ على وضعية مريحة خلال التمرين.",
        "التأكد من الحفاظ على التنفس بشكل صحيح خلال التمرين."
      ],
      "description": [
        "ابدأ بالوقوف على ساق واحدة.",
        "حافظ على التوازن لأطول فترة ممكنة.",
        "كرر التمرين بالعدد المحدد من المرات."
      ],
      "group-id": 2
    }
  ],
  "cardio-exercises": [
    {
      "name": {
        "en": "Jumping Jacks",
        "ar": "القفز بالأرجل"
      },
      "image": "https://kimofit-production.up.railway.app/media/sponsers/club30_xzkc0cr.jpg",
      "reps": 15,
      "sets": 3,
      "weight": 0,
      "duration": "1 min",
      "notes": ["Keep your back straight", "Land softly"],
      "description": [
        "Stand straight and start running in place.",
        "Gradually increase the speed to maintain your heart rate.",
        "Repeat the exercise for the specified number of times."
      ],
      "group-id": 2
    },
    {
      "name": {
        "en": "Jumping Jacks",
        "ar": "القفز بالأرجل"
      },
      "image": "https://kimofit-production.up.railway.app/media/sponsers/club30_xzkc0cr.jpg",
      "reps": 15,
      "sets": 3,
      "weight": 0,
      "duration": "1 min",
      "notes": ["Keep your back straight", "Land softly"],
      "description": [
        "Stand straight and start running in place.",
        "Gradually increase the speed to maintain your heart rate.",
        "Repeat the exercise for the specified number of times."
      ]
    }
  ]

}
''';

Map<String, dynamic> jsonData = jsonDecode(jsonString);

WorkoutBodyResponseModel workoutBodyResponse =
    WorkoutBodyResponseModel.fromJson(jsonData);
