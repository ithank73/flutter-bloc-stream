import 'dart:async';
import 'package:flutter_bloc_my_movies/models/job_category_model.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:http/http.dart' show Client;

class JobCategoryProvider{
  static final HttpLink _httpLink = HttpLink("http://192.168.1.24/graphql");
  final GraphQLClient _client = GraphQLClient(
    link: _httpLink,
    cache: GraphQLCache(),
  );

  // Future <dynamic> query(document, Map<String, dynamic>? variables) async {
  Future <dynamic> query(document, Map<String, dynamic>? variables) async {
    // print(document);

    var result = await _client.query(QueryOptions(
      document: gql(document),
      variables: variables ?? {}
    ));

    if (result.hasException) {
      var message = result.exception!.graphqlErrors.first.message;
      throw GraphQLError(message: message);
    }

    var jobCategories = result.data!['jobCategories'];
    return JobCategory.fromJson(jobCategories);
  }


  // Future<ItemModel> fetchJobCategoryList() async {
  //   final response = await client
  //       .get(Uri.parse("${url}api_key=${api_key}&page=3"));
  //
  //
  //   print(response.data);
  //
  //   if (response.statusCode == 200) {
  //     // If the call to the server was successful, parse the JSON
  //     return ItemModel.fromJson(json.decode(response.body));
  //   } else {
  //     // If that call was not successful, throw an error.
  //     throw Exception('Failed to load post');
  //   }
  // }
}