import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sambaternak_baru_2024/constants/constants.dart';
import 'package:sambaternak_baru_2024/themes/theme.dart';

class CardHorizontal extends StatelessWidget {
  const CardHorizontal(
      {super.key,
      this.title = "Placeholder Title",
      this.cta = "",
      this.img = "https://via.placeholder.com/200",
      this.tap = defaultFunc});

  final String cta;
  final String img;
  final Function() tap;
  final String title;

  static void defaultFunc() {
    if (kDebugMode) {
      print("the function works!");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 140,
        padding: const EdgeInsets.all(14.0),
        child: GestureDetector(
          onTap: tap,
          child: Card(
            elevation: 0.6,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(6.0))),
            child: Row(
              children: [
                Flexible(
                  flex: 1,
                  child: Container(
                      decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(6.0),
                              bottomLeft: Radius.circular(6.0)),
                          image: DecorationImage(
                            image: AssetImage(img),
                            fit: BoxFit.cover,
                          ))),
                ),
                Flexible(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(title,
                              style: const TextStyle(
                                  color: ArgonColors.header, fontSize: 14)),
                          Text(cta,
                              style: const TextStyle(
                                  color: kPrimaryColor,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600))
                        ],
                      ),
                    ))
              ],
            ),
          ),
        ));
  }
}
