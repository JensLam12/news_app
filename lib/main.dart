import 'package:flutter/material.dart';
import 'package:news_app/src/screens/screens.dart';
import 'package:news_app/src/services/services.dart';
import 'package:news_app/src/theme/theme.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
	const MyApp({Key? key}) : super(key: key);

	@override
	Widget build(BuildContext context) {
		return MultiProvider(
			providers: [
				ChangeNotifierProvider(create: ( _ ) => NewsService() )
			],
			child: MaterialApp(
				debugShowCheckedModeBanner: false,
				title: 'Material App',
				home: const TabsScreen(),
				theme: globalTheme,
			),
		);
	}
}