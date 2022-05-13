import 'dart:async';
import 'movie_api_provider.dart';
import 'job_category_provider.dart';
import '../models/item_model.dart';

class Repository {
  final jobCategoryProvider = JobCategoryProvider();
  // var query = """
  //         query jobCategories(\$categoryType: categoryTypeEnum){
  //           jobCategories(categoryType: \$categoryType){
  //               id
  //               name
  //           }
  //         }
  //       """;
  var categoryType = "work";
  // var query = """
  //         query jobCategories(\$categoryType: categoryTypeEnum){
  //           jobCategories(categoryType: \$categoryType){
  //               id
  //               name
  //           }
  //         }
  //       """;

  var query = """
          query{
            jobCategories(categoryType: "work"){
                id
                name
            }
          }
        """;

  Future<dynamic> fetchAllJobCategories() => jobCategoryProvider.query(query, {});

  final moviesApiProvider = MovieApiProvider();
  Future<ItemModel> fetchAllMovies() => moviesApiProvider.fetchMovieList();




}