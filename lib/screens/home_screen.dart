import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:movies/providers/providers.dart';
import 'package:movies/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final moviesProvider = Provider.of<MoviesProvider>(context, listen: true);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Movies'),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.search_outlined))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CardSwiper(movies: moviesProvider.onDisplayMovies),
            MoviesSlider(
              movies: moviesProvider.popularMovies,
              title: 'Populares!',
              onNextPage: () => moviesProvider.getPopularMovies(),
            )
          ],
        ),
      ),
    );
  }
}
