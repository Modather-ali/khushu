import '../package.dart';

ThemeData lightTheme = ThemeData(
  fontFamily: 'Tajawal',
  appBarTheme: const AppBarTheme(
    backgroundColor: Color(0xFFF9F9F9),
    iconTheme: IconThemeData(color: Colors.black),
    centerTitle: true,
  ),
  drawerTheme: const DrawerThemeData(
    backgroundColor: Color(0xFFF9F9F9),
  ),
  useMaterial3: true,
  colorScheme: const ColorScheme.light(
    primary: Constants.primaryColor,
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: Constants.primaryColor,
  ),
);

ThemeData darkTheme = ThemeData(
  fontFamily: 'Tajawal',
  appBarTheme: const AppBarTheme(
    backgroundColor: Constants.primaryColor,
  ),
  drawerTheme: const DrawerThemeData(
    backgroundColor: Constants.primaryColor,
  ),
  cardTheme: const CardTheme(
    color: Constants.primaryColor,
  ),
  colorScheme: const ColorScheme.dark(
    primary: Constants.primaryColor,
  ),
  useMaterial3: true,
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: Constants.primaryColor,
  ),
);
