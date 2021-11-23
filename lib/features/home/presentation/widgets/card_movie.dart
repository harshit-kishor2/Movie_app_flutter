import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movie_app/core/constant/constant.dart';
import 'package:movie_app/core/shared_component/widget_helper.dart';
import 'package:movie_app/features/home/data/models/result_model.dart';
import 'package:movie_app/features/movie_detail/presentation/pages/details_page.dart';

class CardMovie extends StatelessWidget {
  const CardMovie({
    Key? key,
    required this.item,
  }) : super(key: key);

  final ResultModel item;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 40),
        child: OpenContainer(
          closedElevation: 0,
          openElevation: 0,
          closedBuilder: (context, action) => Container(
            color: const Color(0xff6b7688),
            child: Column(
              children: <Widget>[
                Expanded(
                    child: Image.network(
                  'https://image.tmdb.org/t/p/w500/${item.posterPath}',
                  fit: BoxFit.fill,
                )),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SvgPicture.asset(
                        AssetsConst.starIcon,
                        height: 20,
                      ),
                      getSizeBox(height: 15),
                      Text(
                        "${item.voteAverage}",
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          openBuilder: (context, action) => DetailsPage(movie: item),
        ),
      ),
    );
  }
}
