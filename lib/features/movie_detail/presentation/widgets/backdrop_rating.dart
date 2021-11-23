import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movie_app/core/constant/constant.dart';
import 'package:movie_app/features/home/domain/entities/result_entity.dart';

class BackdropAndRating extends StatelessWidget {
  const BackdropAndRating({Key? key, required this.size, required this.movie})
      : super(key: key);

  final Size size;
  final ResultEntity movie;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // 40% of our total height
      height: size.height * 0.4,
      child: Stack(
        children: <Widget>[
          _getBgImage(), //backgroundImage
          _getRatingPosition(), // Rating Box
          _getBackButton(context), // Back Button
        ],
      ),
    );
  }

//! backgroundImage
  _getBgImage() {
    return Container(
      height: size.height * 0.4 - 50,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(50)),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(
              'https://image.tmdb.org/t/p/original/${movie.backdropPath}'),
        ),
      ),
    );
  }

//! Back Button
  _getBackButton(context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () => Navigator.maybePop(context),
        child: const Icon(
          Icons.chevron_left,
          size: 44,
          color: Colors.white,
        ),
      ),
    );
  }

//! Rating Box
  _getRatingPosition() {
    return Positioned(
      bottom: 0,
      right: 0,
      child: Container(
        width: size.width * 0.3,
        height: 100,
        decoration: _getBoxDecoration(), //Box Decoration for rating portion
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SvgPicture.asset(AssetsConst.starIcon),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                style: const TextStyle(color: Colors.black),
                children: [
                  TextSpan(
                    text: "${movie.voteAverage}/",
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  const TextSpan(text: "10\n"),
                  TextSpan(
                    text: "${movie.voteCount}",
                    style: const TextStyle(color: Color(0xFF9A9BB2)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

//! Box Decoration for rating portion
  _getBoxDecoration() {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: const BorderRadius.only(
        bottomLeft: Radius.circular(50),
        topLeft: Radius.circular(50),
      ),
      boxShadow: [
        BoxShadow(
          offset: const Offset(0, 5),
          blurRadius: 50,
          color: const Color(0xFF12153D).withOpacity(0.2),
        ),
      ],
    );
  }
  //End
}
