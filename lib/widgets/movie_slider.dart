import 'package:flutter/material.dart';

class MoviesSlider extends StatelessWidget {
  const MoviesSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 260,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Populars',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              )),
          SizedBox(height: 5),
          _MoviePoster()
        ],
      ),
    );
  }
}

class _MoviePoster extends StatelessWidget {
  const _MoviePoster({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 20,
        itemBuilder: (context, index) {
          return Container(
            width: 130,
            height: 190,
            margin: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, 'details',
                        arguments: 'movie-instances');
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: FadeInImage(
                      placeholder: AssetImage('assets/no-image.jpg'),
                      image:
                          NetworkImage('https://via.placeholder.com/300x400'),
                      height: 190,
                      width: 130,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  'Star Wars: El retorno de todos los personajes',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  textAlign: TextAlign.center,
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
