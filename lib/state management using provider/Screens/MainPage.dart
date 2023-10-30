import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Provider111/Movie_provider.dart';
import 'WishListPage.dart';

void main() {
  runApp(ChangeNotifierProvider<MovieProvider>(
    create: (BuildContext context) => MovieProvider(),
    child: MaterialApp(
      home: MovieMain(),
    ),
  ));
}

class MovieMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var movies = context.watch<MovieProvider>().movies;
    var wishmovies = context.watch<MovieProvider>().moviesWishList;

    return Scaffold(
      appBar: AppBar(
        title: Text("Movies"),
      ),
      body: Column(
        children: [
          ElevatedButton.icon(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => WishListPage()));
              },
              icon: Icon(Icons.favorite_border),
              label: Text("GoTo WishList( ${wishmovies.length})")),
          Expanded(
              child: ListView.builder(
                  itemCount: movies.length,
                  itemBuilder: (context, index) {
                    final currentMovie = movies[index];
                    return Card(
                        child: ListTile(
                      title: Text(currentMovie.title),
                      subtitle: Text(currentMovie.time!),
                      trailing: IconButton(
                        icon: Icon(
                          Icons.favorite,
                          color: wishmovies.contains(currentMovie)
                              ? Colors.red
                              : Colors.grey,
                        ),
                        onPressed: () {
                          if (!wishmovies.contains(currentMovie)) {
                            context
                                .read<MovieProvider>()
                                .addtoWishList(currentMovie);
                          } else {
                            context
                                .read<MovieProvider>()
                                .removeFromWishList(currentMovie);
                          }
                        },
                      ),
                    ));
                  }))
        ],
      ),
    );
  }
}
