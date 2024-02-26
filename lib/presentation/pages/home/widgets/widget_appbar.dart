import 'package:flutter/material.dart';

import 'home_widgets.dart';

class AppBarRick extends StatelessWidget {
  const AppBarRick({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      bottom: false,
      child: Padding(
        padding: EdgeInsets.only(left: 5),
        child: Row(
          // crossAxisAlignment: CrossAxisAlignment.end,
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ImagenAppbar(),
            TitleImageRick(),
            Spacer(),
            IconButtonRick(),
          ],
        ),
      ),
    );
  }
}
