import 'package:flutter/material.dart';
import 'package:movie_app/features/movie_detail/domain/entities/cast.dart';
import 'package:movie_app/features/movie_detail/domain/entities/crew.dart';

class CastAndCrew extends StatelessWidget {
  final List<CastEntity> cast;
  final List<CrewEntity> crew;

  const CastAndCrew({Key? key, required this.cast, required this.crew})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Padding(
          padding: EdgeInsets.only(top: 40, left: 20, bottom: 20),
          child: Text(
            "Cast",
            style: TextStyle(
                color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(
          height: 160,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: cast.length,
            itemBuilder: (context, index) => Container(
              margin: const EdgeInsets.symmetric(horizontal: 20.0),
              width: 80,
              child: Column(
                children: <Widget>[
                  Container(
                    height: 80,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                            'https://image.tmdb.org/t/p/original/${cast[index].profilePath}'),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  Text(
                    cast[index].originalName,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontSize: 12,
                        color: Colors.white,
                        fontWeight: FontWeight.w500),
                    maxLines: 2,
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
