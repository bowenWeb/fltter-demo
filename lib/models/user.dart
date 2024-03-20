import 'package:equatable/equatable.dart';

final class User extends Equatable {
  const User({required this.username, required this.age});
  final String username;
  final String age;

  @override
  List<Object> get props => [username, age];
}