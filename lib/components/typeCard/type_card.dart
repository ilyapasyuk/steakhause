import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:steakhaus/components/typeCard/types.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TypeCard extends StatelessWidget {
  final TypeRoasting type;
  final Function onTap;

  TypeCard({Key key, this.type, this.onTap}) : super(key: key);

  final String timerIcon = 'assets/alarm-clock.svg';

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(24),
        margin: EdgeInsets.only(bottom: 24),
        decoration: BoxDecoration(
          border: Border.all(color: Color(0xFF283048), width: 1),
          color: Color(0xFF181D2D),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 12),
                      child: Text(
                        type.title,
                        style: TextStyle(color: Color(0xFFFFFFFF), fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                    ),
                    Text(
                      '${(type.secondsOfCooking / 60).round()} min',
                      style: TextStyle(color: Color(0xFF8E9CB6), fontSize: 14, fontWeight: FontWeight.normal),
                    )
                  ],
                ),
                Spacer(),
                SvgPicture.asset(type.icon)
              ],
            ),
          ],
        ),
      ),
    );
  }
}
