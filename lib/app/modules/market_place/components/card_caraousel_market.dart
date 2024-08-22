import 'package:flutter/cupertino.dart';
import 'package:sambaternak_baru_2024/configs/configs.dart';
import 'package:sambaternak_baru_2024/constants/constants.dart';

class CardCaraouselMarket extends StatelessWidget {
  const CardCaraouselMarket({
    super.key,
    required this.img,
  });

  final String img;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeConfig.screenWidth,
      margin: EdgeInsets.symmetric(
        horizontal: getProperWidht(16.0),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(28),
        color: kPrimaryLightColor,
      ),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Align(
              alignment: Alignment.center,
              child: Image.asset(img),
            ),
          ),
        ],
      ),
    );
  }
}
