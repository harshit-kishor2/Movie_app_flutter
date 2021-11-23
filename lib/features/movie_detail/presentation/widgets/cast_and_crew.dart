import 'package:cached_network_image/cached_network_image.dart';
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
        _getHeaderTitle("Cast"),
        _getCastCrewList(cast),
        _getHeaderTitle("Crew"),
        _getCastCrewList(crew),
      ],
    );
  }

  _getHeaderTitle(txt) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 20, bottom: 10),
      child: Text(
        txt,
        style: const TextStyle(
            color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
      ),
    );
  }

  _getCastCrewList(prop) {
    return SizedBox(
      height: 160,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: prop.length,
        itemBuilder: (context, index) => Container(
          margin: const EdgeInsets.symmetric(horizontal: 20.0),
          width: 80,
          child: Column(
            children: <Widget>[
              CachedNetworkImage(
                imageUrl: _getImageUrl(prop[index]),
                imageBuilder: (context, imageProvider) => Container(
                  height: 80,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
              const SizedBox(height: 10.0),
              Text(
                prop[index].originalName,
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
    );
  }

  _getImageUrl(props) {
    if (props.profilePath != null) {
      return 'https://image.tmdb.org/t/p/original/${props.profilePath}';
    } else {
      return 'https://iconape.com/wp-content/png_logo_vector/avatar-4.png';
    }
  }

  //End
}
