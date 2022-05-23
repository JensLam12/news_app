import 'package:flutter/material.dart';

class NavigationProvider extends ChangeNotifier {
	int _currentPage = 0;
	final _pageController = PageController();

	int get currentPage => _currentPage;

	set currentPage( int value) {
		_currentPage = value;
		pageController.animateToPage( value, duration: const Duration( milliseconds: 250), curve: Curves.easeOut);
		notifyListeners();
	}

	PageController get pageController => _pageController;
}