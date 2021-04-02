import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:steakhaus/components/timer/timer.dart';
import 'package:steakhaus/components/typeCard/types.dart';

class Steak extends StatelessWidget {
  final TypeRoasting type;

  const Steak({Key key, this.type}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1D2335),
      body: SafeArea(
        top: false,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: 60, right: 24, bottom: 24, left: 24),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30), bottomRight: Radius.circular(30)),
                color: Color(0xFF181D2D),
              ),
              child: Column(
                children: [
                  Text(
                    type.title,
                    style: TextStyle(color: Color(0xFFFFFFFF), fontSize: 24, fontWeight: FontWeight.w500),
                  ),
                  Container(
                    padding: EdgeInsets.only(bottom: 32, top: 32),
                    child: Row(
                      children: [
                        Spacer(),
                        SvgPicture.asset(
                          type.icon,
                          width: 200,
                        ),
                        Spacer(),
                      ],
                    ),
                  )
                ],
              ),
            ),
            TimerWidget(time: type.secondsOfCooking)
          ],
        ),
      ),
    );
  }
}
