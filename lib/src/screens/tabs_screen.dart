import 'package:flutter/material.dart';
import 'package:news_app/src/providers/providers.dart';
import 'package:news_app/src/screens/tab1_screen.dart';
import 'package:provider/provider.dart';

class TabsScreen extends StatelessWidget {
   
	const TabsScreen({Key? key}) : super(key: key);
	
	@override
	Widget build(BuildContext context) {
		return ChangeNotifierProvider(
			create: ( _ ) => NavigationProvider(),
			child: const Scaffold(
				body: _Pages(),
				bottomNavigationBar: _Navigation(),
			),
		);
	}
}

class _Pages extends StatelessWidget {
	const _Pages({
		Key? key,
	}) : super(key: key);

	@override
	Widget build(BuildContext context) {

		final navigationProvider = Provider.of<NavigationProvider>(context);

		return PageView(
			// physics: const BouncingScrollPhysics(),
			controller: navigationProvider.pageController,
			physics: const NeverScrollableScrollPhysics(),
			children: [
				const Tab1Screen(),
				Container( color: Colors.green ),
			],
		);
	}
}

class _Navigation extends StatelessWidget {
	const _Navigation({
		Key? key,
	}) : super(key: key);

	@override
	Widget build(BuildContext context) {

		final navigationModel = Provider.of<NavigationProvider>(context);

		return BottomNavigationBar( 
			currentIndex: navigationModel.currentPage,
			onTap: (i) => navigationModel.currentPage = i,
			items: const [
				BottomNavigationBarItem(icon: Icon( Icons.person_outline), label: 'For you' ) ,
				BottomNavigationBarItem(icon: Icon( Icons.public), label: 'All' )
			] 
		);
	}
}