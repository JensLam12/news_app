import 'package:flutter/material.dart';
import 'package:news_app/src/models/models.dart';

class NewsList extends StatelessWidget {
	final List<Article> news;
	const NewsList({Key? key, required this.news}) : super(key: key);

	@override
	Widget build(BuildContext context) {
		return ListView.builder(
			itemCount: news.length,
			itemBuilder: ( BuildContext context, int index) {
				return Text( news[index].title);
			},
		);
	}
}