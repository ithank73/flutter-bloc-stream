import 'package:flutter/material.dart';
import 'package:flutter_bloc_my_movies/models/job_category_model.dart';
import '../models/item_model.dart';

// import '../blocs/movies_bloc.dart';
import '../blocs/job_category_bloc.dart';

class MovieList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // bloc.fetchAllMovies();
    bloc.fetchAllJobCategories();
    return Scaffold(
      appBar: AppBar(
        title: Text('Popular Movies'),
      ),
      body:
          // Text('1')
          // StreamBuilder(
          //   stream: bloc.allMovies,
          //   builder: (context, AsyncSnapshot<ItemModel> snapshot) {
          //     if (snapshot.hasData) {
          //       return buildList(snapshot);
          //     } else if (snapshot.hasError) {
          //       return Text(snapshot.error.toString());
          //     }
          //     return Center(child: CircularProgressIndicator());
          //   },
          // ),
      StreamBuilder(
        stream: bloc.allJobCategories,
        builder: (context, AsyncSnapshot<JobCategory> snapshot) {
          if (snapshot.hasData) {
            return buildList(snapshot);
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  Widget buildList(AsyncSnapshot<JobCategory> snapshot) {
    return GridView.builder(
        itemCount: snapshot.data?.results.length,
        gridDelegate:
            new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index) {
          // return Image.network(
          //   'https://image.tmdb.org/t/p/w185${snapshot.data?.results[index].poster_path}',
          //   fit: BoxFit.cover,
          // );
          return Text(snapshot.data?.results[index].name);
        });
  }
}
