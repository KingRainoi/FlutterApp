part of 'theme_cubit.dart';

@immutable
sealed class ThemeState {}

//Iinitial state of the app
final class ThemeInitial extends ThemeState {}

//Theme controller state
final class ThemeChanged extends ThemeState {}
