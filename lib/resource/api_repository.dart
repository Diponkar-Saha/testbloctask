import 'package:testbloctask/model/product_response.dart';
import 'package:testbloctask/model/search_response.dart';

import 'api_provider.dart';

class ApiRepository {

  final _provider = ApiProvider();


  Future<SearchResponse> fetchCovidList(String slug) {
    return _provider.fetchCovidList(slug);
  }

  Future<ProductResponse> fetchProduct(String slug) {
    return _provider.fetchProduct(slug);
  }
}

class NetworkError extends Error {}