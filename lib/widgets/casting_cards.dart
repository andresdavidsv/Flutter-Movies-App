import 'package:flutter/cupertino.dart';
import 'package:movies/models/models.dart';
import 'package:movies/providers/providers.dart';
import 'package:provider/provider.dart';

class CastingCards extends StatelessWidget {
  final int movieId;
  const CastingCards({super.key, required this.movieId});

  @override
  Widget build(BuildContext context) {
    final moviesProvider = Provider.of<MoviesProvider>(context, listen: false);
    return FutureBuilder(
      future: moviesProvider.getMovieCast(movieId),
      builder: (_, AsyncSnapshot<List<Cast>> snapshot) {
        if (!snapshot.hasData) {
          return Container(
            constraints: const BoxConstraints(maxWidth: 150),
            height: 180,
            child: const CupertinoActivityIndicator(),
          );
        }
        final List<Cast> cast = snapshot.data!;
        return Container(
          margin: const EdgeInsets.only(bottom: 30),
          width: double.infinity,
          height: 180,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: cast.length,
            itemBuilder: (context, index) {
              return _CastCard(cast[index]);
            },
          ),
        );
      },
    );
  }
}

class _CastCard extends StatelessWidget {
  final Cast actor;
  const _CastCard(this.actor);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      width: 110,
      height: 100,
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: FadeInImage(
                placeholder: const AssetImage('assets/no-image.jpg'),
                image: NetworkImage(actor.fullProfilePath),
                height: 140,
                width: 100,
                fit: BoxFit.cover),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            actor.name,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
