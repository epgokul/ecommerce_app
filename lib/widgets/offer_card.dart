import 'package:flutter/material.dart';

class OfferCard extends StatelessWidget {
  const OfferCard(
      {super.key,
      required this.percent,
      required this.code,
      required this.image});
  final String percent;
  final String code;
  final String image;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Stack(children: [
      Align(
          alignment: Alignment.centerRight,
          child: Container(
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
            child: Image.asset(
              image,
              width: size.width * 4 / 5,
              height: size.height / 4,
              fit: BoxFit.fitWidth,
            ),
          )),
      Padding(
        padding: const EdgeInsets.only(left: 15.0, top: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "$percent% Off",
              style: const TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
            ),
            const Text(
              "On Everything Today",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "With code:$code",
              style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: Color.fromARGB(255, 103, 103, 103)),
            ),
          ],
        ),
      ),
    ]);
  }
}
