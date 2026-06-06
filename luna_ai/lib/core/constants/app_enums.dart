enum CyclePhase {
  menstrual,
  follicular,
  ovulation,
  luteal;

  String get label => switch (this) {
        menstrual => 'Menstrual',
        follicular => 'Follicular',
        ovulation => 'Ovulation',
        luteal => 'Luteal',
      };

  String get description => switch (this) {
        menstrual => 'Rest and restore. Your body is renewing.',
        follicular => 'Rising energy. Great time for new projects.',
        ovulation => 'Peak energy and confidence.',
        luteal => 'Wind down. Focus on self-care and completion.',
      };

  String get emoji => switch (this) {
        menstrual => '🌙',
        follicular => '🌱',
        ovulation => '✨',
        luteal => '🍂',
      };
}

enum MoodType {
  happy,
  calm,
  neutral,
  anxious,
  stressed,
  sad,
  energetic;

  String get label => switch (this) {
        happy => 'Happy',
        calm => 'Calm',
        neutral => 'Neutral',
        anxious => 'Anxious',
        stressed => 'Stressed',
        sad => 'Sad',
        energetic => 'Energetic',
      };

  String get emoji => switch (this) {
        happy => '😊',
        calm => '😌',
        neutral => '😐',
        anxious => '😰',
        stressed => '😣',
        sad => '😢',
        energetic => '⚡',
      };
}

enum TaskPriority { low, medium, high }

enum TaskStatus { pending, completed }

enum TaskSource { user, ai }

enum SuggestionStatus { pending, approved, rejected }
