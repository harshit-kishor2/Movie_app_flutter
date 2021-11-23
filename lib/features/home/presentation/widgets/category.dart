import 'package:flutter/material.dart';
import 'package:movie_app/core/constant/string_constant.dart';

class Category extends StatelessWidget {
  final int selected;
  final Function(int) onSelectChange;

  const Category({
    Key? key,
    required this.selected,
    required this.onSelectChange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      margin: const EdgeInsets.symmetric(vertical: 5.0),
      padding: const EdgeInsets.symmetric(vertical: 3.0),
      height: 60,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 2,
        itemBuilder: (context, index) => buildCategory(index, context),
      ),
    );
  }

  Padding buildCategory(int index, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: GestureDetector(
        onTap: () => onSelectChange(index),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              [
                StringConst.movie_now_playing,
                StringConst.movie_coming_soon,
              ][index],
              style: Theme.of(context).textTheme.headline5!.copyWith(
                    fontWeight: FontWeight.w600,
                    color: index == selected ? Colors.white : Colors.white38,
                  ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10.0),
              height: 5,
              width: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: index == selected ? Colors.white : Colors.transparent,
              ),
            )
          ],
        ),
      ),
    );
  }
}
