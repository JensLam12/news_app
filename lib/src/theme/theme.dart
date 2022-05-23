import 'package:flutter/material.dart';

final theme = ThemeData.dark();
 
final globalTheme = ThemeData(
	colorScheme: theme.colorScheme.copyWith(
		secondary: Colors.indigo,
	),
);