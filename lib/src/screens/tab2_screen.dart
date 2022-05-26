import 'package:flutter/material.dart';
import 'package:news_app/src/models/category.dart';
import 'package:news_app/src/services/news_service.dart';
import 'package:provider/provider.dart';

import '../widgets/widgets.dart';

class Tab2Screen extends StatelessWidget {
   
	const Tab2Screen({Key? key}) : super(key: key);
	
	@override
	Widget build(BuildContext context) {

		final newsService = Provider.of<NewsService>(context);
		final articles = newsService.getArticlesByCategory;

		return SafeArea(
			child: Scaffold(
				body: Column(
					children:  [
						const _CategoryList(),
						Expanded(
							child: ( articles.length <= 0)
							? const Center( child: CircularProgressIndicator() )
							: NewsList(news: articles)
						)
					],
				),
			),
		);
	}
}

class _CategoryList extends StatelessWidget {

	const _CategoryList({
		Key? key,
	}) : super(key: key);

	@override
	Widget build(BuildContext context) {
		final categories = Provider.of<NewsService>(context).categories;

		return Container(
			width: double.infinity,
			height: 80,
				  child: ListView.builder(
					  physics: const BouncingScrollPhysics(),
					  scrollDirection: Axis.horizontal,
					  itemCount: categories.length,
					  itemBuilder: ( BuildContext context, int index) {
						  final cName = categories[index].name;
		
						  return Padding(
							  padding: const EdgeInsets.all(8),
							  child: Column(
								  children: [
									  _CategoryButton(category: categories[index]),
									  const SizedBox( height: 5 ),
									  Text( '${ cName[0].toUpperCase()}${cName.substring(1)}')
								  ],
							  ),
						  );
					  } 
				  ),
				);
	}
}

class _CategoryButton extends StatelessWidget {
	final Category category;

	const _CategoryButton({
		Key? key,
		required this.category,
	}) : super(key: key);

	@override
	Widget build(BuildContext context) {

		final newsService = Provider.of<NewsService>(context, listen: false);

		return GestureDetector(
			onTap: () {
				final newsService = Provider.of<NewsService>(context, listen: false);
				newsService.selectedCategory = category.name;
			},
			child: Container(
				width: 40,
				height: 40,
				decoration: const BoxDecoration(
					shape: BoxShape.circle,
					color: Colors.white
				),
				child: Icon(
					category.icon,
					color: ( newsService.selectedCategory == category.name ) ?Colors.indigo : Colors.black54,
				),
			),
		);
	}
}