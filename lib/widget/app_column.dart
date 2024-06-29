import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_moi/widget/small_text.dart';

import '../utils/dimensions.dart';
import 'Icon_and_text_widget.dart';
import 'big_text.dart';

class AppColumn extends StatelessWidget {
  final String text;
  const AppColumn({super.key,
    required this.text
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children:[
        BigText(text: text, size: Dimensions.font26,),
        SizedBox(height: Dimensions.height10,),

        Row(
          children: [
            Wrap(
              children: List.generate(5, (index) => Icon(Icons.star, color: Colors.green, size: 15)),
            ),
            SizedBox(width: 10,),
            SmallText(text: "4.5"),
            SizedBox(width: 10,),
            SmallText(text: "1287"),
            SizedBox(width: 10,),
            SmallText(text: "commentaires"),
          ],
        ),
        SizedBox(height: Dimensions.height20,),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconAndTextWidget(icon: Icons.circle_sharp,
                text: "Normal",
                iconColor: Colors.amberAccent),

            IconAndTextWidget(icon: Icons.location_on,
                text: "1.7km",
                iconColor: Colors.indigo),

            IconAndTextWidget(icon: Icons.access_time_rounded,
                text: "32min",
                iconColor: Colors.redAccent)
          ],
        )
      ],
    );
  }
}
