import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Item extends StatelessWidget {
  @required
  final String text;
  @required
  final String icon;

  const Item({Key key, this.text, this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(bottom: 8),
          child: SvgPicture.asset(
            icon,
            width: 22,
          ),
        ),
        Text(
          text,
          style: TextStyle(color: Color(0xFFFFFFFF), fontSize: 13),
        )
      ],
    );
  }
}
