import 'package:flutter/cupertino.dart';
import 'package:news_app/src/models/models.dart';
import 'package:http/http.dart' as http;

class NewsService extends ChangeNotifier {

	final _URL_NEWS = 'newsapi.org';
	final _APIKEY  = '';
	List<Article> headlines = [];

	NewsService() {
    	getTopHeadlines();
	}

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
}