import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:movie_app/features/movie_detail/domain/entities/detail.dart';

class TitleDurationCategory extends StatelessWidget {
  final DetailEntity detail;

  const TitleDurationCategory({Key? key, required this.detail})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  detail.title,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 26,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10.0),
                Row(
                  children: <Widget>[
                    Text(
                      DateFormat("yyyy").format(
                          DateFormat("yyyy-MM-dd").parse(detail.releaseDate)),
                      style: const TextStyle(
                          color: Color(0xFFFFD700),
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(width: 20.0),
                    Text(
                      detail.runtime.toString() + "min",
                      style: const TextStyle(
                          color: Color(0xFFFFD700),
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
