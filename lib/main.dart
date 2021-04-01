import 'package:flutter/cupertino.dart';
import 'package:steakhaus/components/timer/timer.dart';
import 'package:steakhaus/components/typeCard/type_card.dart';
import 'package:steakhaus/components/typeCard/types.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      title: 'Flutter Demo',
      theme: CupertinoThemeData(),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  final List<TypeRoasting> roastingTypes = [
    TypeRoasting(title: 'Blue rare', alias: 'blueRare', secondsOfCooking: 180, icon: 'assets/blue-rare.svg'),
    TypeRoasting(title: 'Medium rare', alias: 'mediumRare', secondsOfCooking: 300, icon: 'assets/medium-rare.svg'),
    TypeRoasting(title: 'Medium', alias: 'medium', secondsOfCooking: 490, icon: 'assets/medium.svg'),
    TypeRoasting(title: 'Medium well', alias: 'mediumWell', secondsOfCooking: 560, icon: 'assets/medium-well.svg'),
    TypeRoasting(title: 'Well done', alias: 'wellDone', secondsOfCooking: 600, icon: 'assets/well-done.svg'),
  ];

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: Color(0xFF1D2335),
      child: SafeArea(
        child: ListView.builder(
            padding: const EdgeInsets.all(24),
            itemCount: roastingTypes.length,
            itemBuilder: (BuildContext context, int index) {
              return TypeCard(
                type: roastingTypes[index],
                onTap: () {
                  Navigator.push(
                    context,
                    CupertinoPageRoute(
                        builder: (context) => CupertinoPageScaffold(
                                child: SafeArea(
                                    child: Column(
                              children: [TimerWidget(time: roastingTypes[index].secondsOfCooking)],
                            )))),
                  );
                },
              );
            }),
      ),
    );
  }
}
