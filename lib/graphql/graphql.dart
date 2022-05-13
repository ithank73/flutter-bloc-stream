import 'package:graphql_flutter/graphql_flutter.dart';

class Graphql{
    static final HttpLink _httpLink = HttpLink("http://192.168.1.4/graphql");
    final GraphQLClient _client = GraphQLClient(
        link: _httpLink,
        cache: GraphQLCache(),
    );

    late Future<dynamic> future;

    Future <dynamic> query(document) async {
        var result = await _client.query(QueryOptions(
            document: gql(document),
        ));

        if (result.hasException) {
            var message = result.exception!.graphqlErrors.first.message;
            throw GraphQLError(message: message);
        }
        return result.data;
    }



}