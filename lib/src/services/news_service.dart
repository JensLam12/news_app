import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:news_app/src/models/category.dart';
import 'package:news_app/src/models/models.dart';
import 'package:http/http.dart' as http;

class NewsService extends ChangeNotifier {

	final _URL_NEWS = 'newsapi.org';
	final _APIKEY  = 'APIKEY';
	List<Article> headlines = [];
  	String _selectedCategory = 'business';
	List<Category> categories = [
		Category( icon: FontAwesomeIcons.building, name: 'business'),
		Category( icon: FontAwesomeIcons.tv, name: 'entertainment'),
		Category( icon: FontAwesomeIcons.addressCard, name: 'general'),
		Category( icon: FontAwesomeIcons.headSideVirus, name: 'health'),
		Category( icon: FontAwesomeIcons.vials, name: 'science'),
		Category( icon: FontAwesomeIcons.volleyball, name: 'sports'),
		Category( icon: FontAwesomeIcons.memory, name: 'technology'),
	];
	Map<String, List<Article>> categoryArticles = {};

	NewsService() {
    	getTopHeadlines();
		categories.forEach((element) { 
			categoryArticles[ element.name ] = []; 
		});
	}

	String get selectedCategory => _selectedCategory;
	set selectedCategory( String value ) {
		_selectedCategory = value;
		getTopHeadlinesByCategory( value );
		notifyListeners();
	}

	List<Article> get getArticlesByCategory => categoryArticles[ selectedCategory]!;

	getTopHeadlines() async {
		try {
			final url = Uri.https( _URL_NEWS, '/v2/top-headlines', {
				'country': 'ar',
				'apiKey': _APIKEY
			});

			final response = await http.get(url);
			final newsResponse = NewsResponse.fromJson( response.body);
			headlines.addAll(newsResponse.articles);
			notifyListeners();
		}catch( ex) {
			print(ex.toString());
		}
	}

	getTopHeadlinesByCategory( String category )  async {
		try {
			if( categoryArticles[category]!.length > 0) {
				return categoryArticles[category];
			}
			
			final url = Uri.https( _URL_NEWS, '/v2/top-headlines', {
				'country': 'ar',
				'apiKey': _APIKEY,
				'category': category
			});

			final response = await http.get(url);
			final newsResponse = NewsResponse.fromJson( response.body);
			categoryArticles[category]!.addAll( newsResponse.articles);
			notifyListeners();
		}catch( ex) {
			print(ex.toString());
		}
	}
}