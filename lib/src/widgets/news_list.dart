import 'package:flutter/material.dart';
import 'package:news_app/src/models/models.dart';
import 'package:news_app/src/theme/theme.dart';

class NewsList extends StatelessWidget {
	final List<Article> news;
	const NewsList({Key? key, required this.news}) : super(key: key);

	@override
	Widget build(BuildContext context) {
		return ListView.builder(
			itemCount: news.length,
			itemBuilder: ( BuildContext context, int index) {
				return _New(news: news[index], index: index);
			},
		);
	}
}

class _New extends StatelessWidget {
	final Article news;
	final int index;
	const _New({Key? key, required this.news, required this.index}) : super(key: key);

	@override
	Widget build(BuildContext context) {
		return Column(
			children: [
				_CardTopBar( news: news, index: index ),
				_CardTitle( news: news ),
				_CardImage( news: news),
				_CardBody( news: news ),
				_CardButtons(),
				const SizedBox( height: 10),
				const Divider()
			],
		);
	}
}

class _CardImage extends StatelessWidget {
	final Article news;
	const _CardImage({
		Key? key, 
		required this.news,
	}) : super(key: key);

	@override
	Widget build(BuildContext context) {
		return Container(
			margin: const EdgeInsets.symmetric( vertical: 10),
			child: ClipRRect(
				borderRadius: const BorderRadius.only( topLeft: Radius.circular(50) ,bottomRight: Radius.circular(50)),
				child: Container(
					child: ( news.urlToImage != null )
						? FadeInImage(
							placeholder: const AssetImage( 'assets/img/giphy.gif' ),
							image: NetworkImage( news.urlToImage! ) )
						: const Image( image: AssetImage('assets/img/no-image.png') ),
				),
			),
		);
	}
}

class _CardTitle extends StatelessWidget {
	final Article news;
	const _CardTitle({
		Key? key, 
		required this.news,
	}) : super(key: key);

	@override
	Widget build(BuildContext context) {
		
		return Container(
			padding: const EdgeInsets.symmetric( horizontal: 15),
			child: Text( news.title, style: const TextStyle( fontSize: 20, fontWeight: FontWeight.w700) ),
		);
	}
}

class _CardTopBar extends StatelessWidget {
	final Article news;
	final int index;

	const _CardTopBar({
		Key? key, 
		required this.news, 
		required this.index,
	}) : super(key: key);

	@override
	Widget build(BuildContext context) {
		return Container(
			padding: const EdgeInsets.symmetric( horizontal: 10),
			margin: const EdgeInsets.only( bottom: 10),
			child: Row(
				children: [
					Text('${index + 1}, ', style: TextStyle( color: globalTheme.colorScheme.secondary) ),
					Text('${news.source.name}')
				],
			),
		);
	}
}

class _CardBody extends StatelessWidget {
	final Article news;
	const _CardBody({
		Key? key, 
		required this.news,
	}) : super(key: key);

	@override
	Widget build(BuildContext context) {
		return Container( 
			padding: const EdgeInsets.symmetric( horizontal: 20),
			child: Text( ( news.description != null)  ? news.description! : ''),
		);
	}
}


class _CardButtons extends StatelessWidget {
	const _CardButtons({
		Key? key,
	}) : super(key: key);

	@override
	Widget build(BuildContext context) {
		return Container(
			child: Row(
				mainAxisAlignment: MainAxisAlignment.center,
				children: [
					RawMaterialButton(
						onPressed: () {},
						shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(20) ),
						fillColor: Colors.red,
						child: const Icon( Icons.star_border),
					),
					const SizedBox( width: 10 ),
					RawMaterialButton(
						onPressed: () {},
						shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(20) ),
						fillColor: globalTheme.colorScheme.secondary,
						child: const Icon( Icons.more),
					),
				],
			),
		);
	}
}