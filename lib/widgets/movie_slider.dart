import 'package:flutter/material.dart';

class MoviesSlider extends StatelessWidget {
  const MoviesSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 250,
      color: Colors.red,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Populars',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              )),
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
            color: Colors.green,
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          );
        },
      ),
    );
  }
}
