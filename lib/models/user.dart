class User {
  final String name, surname, sifre, userName;
  final bool type;
  final int userId;
  User(
      {required this.userId,
      required this.name,
      required this.surname,
      required this.sifre,
      required this.userName,
      required this.type});
}

enum UserType { calisan, yonetici }
