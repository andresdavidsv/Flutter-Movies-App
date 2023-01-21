import 'package:flutter/material.dart';
import 'package:movies/models/models.dart';

class MoviesSlider extends StatelessWidget {
  final String? title;
  final List<Movie> movies;
  final Function onNextPage;
  const MoviesSlider(
      {super.key, this.title, required this.movies, required this.onNextPage});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 260,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (title != null)
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  title!,
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                )),
          const SizedBox(height: 5),
          _MoviePoster(
            movies: movies,
            onNextPage: () => onNextPage(),
          )
        ],
      ),
    );
  }
}

class _MoviePoster extends StatefulWidget {
  final List<Movie> movies;
  final Function onNextPage;
  const _MoviePoster({
    Key? key,
    required this.movies,
    required this.onNextPage,
  }) : super(key: key);

  @override
  State<_MoviePoster> createState() => _MoviePosterState();
}

class _MoviePosterState extends State<_MoviePoster> {
  final ScrollController scrollController = ScrollController();
  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      if (scrollController.position.pixels >=
          scrollController.position.maxScrollExtent - 500) {
        widget.onNextPage();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        controller: scrollController,
        scrollDirection: Axis.horizontal,
        itemCount: widget.movies.length,
        itemBuilder: (context, index) {
          return _MoviePosterSingle(movie: widget.movies[index]);
        },
      ),
    );
  }
}

class _MoviePosterSingle extends StatelessWidget {
  final Movie movie;
  const _MoviePosterSingle({
    Key? key,
    required this.movie,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 130,
      height: 190,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, 'details', arguments: movie);
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: FadeInImage(
                placeholder: const AssetImage('assets/no-image.jpg'),
                image: NetworkImage(movie.fullPosterImg),
                height: 190,
                width: 130,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 5),
          Text(
            movie.title,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
