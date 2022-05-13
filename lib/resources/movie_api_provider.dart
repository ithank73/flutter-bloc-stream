import 'dart:async';
import 'package:http/http.dart' show Client;
import 'dart:convert';
import '../models/item_model.dart';

class MovieApiProvider {
  Client client = Client();
  final url = 'http://api.themoviedb.org/3/movie/popular?';
  final api_key = "f2341ef1511430148a6f423dc02db80a";
  final page = 2;


  Future<ItemModel> fetchMovieList() async {
    final response = await client
        .get(Uri.parse("${url}api_key=${api_key}&page=3"));
    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON
      return ItemModel.fromJson(json.decode(response.body));
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }
  }
}