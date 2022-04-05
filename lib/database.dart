import 'mood_Record.dart';
import 'users.dart';

class Database{

  final List<User> _usersList = [];

  final List<MoodRecord> _moodRecord = [];

  void findUser(String _email, String _password) {
  }

  void addMoodRecord(String _moodType, DateTime _date ){
    _moodRecord.add(MoodRecord(moodType: _moodType, date: _date));
  }

}
