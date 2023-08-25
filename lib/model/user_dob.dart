class UserDob {
  final DateTime date;
  final int age;
  UserDob({
    required this.date,
    required this.age,
  });
  factory UserDob.fromMap(Map<String, dynamic> e) {
    final date = e['date'];
    return UserDob(
      date: DateTime.parse(date),
      age: e['age'],
    );
  }
}
