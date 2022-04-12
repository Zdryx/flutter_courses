import 'package:flutter/material.dart';

class AppBarScreen extends StatefulWidget{
  const AppBarScreen({Key? key}) : super (key: key);

  @override
  _AppBarScreenState createState() => _AppBarScreenState();
}

class _AppBarScreenState extends State<AppBarScreen>{
  @override
  Widget build(BuildContext context) {
    final ButtonStyle buttonStyle = TextButton.styleFrom(primary: Theme.of(context).colorScheme.onPrimary);

   // return MaterialApp(
      return Scaffold (
        appBar: AppBar(
          title: const Text("AppBar"),
          actions: <Widget>[
            IconButton(
              onPressed: (){},
              icon: const Icon(Icons.phone),
              tooltip: "Звонок",
            ),
            TextButton(
              onPressed: (){},
              child: const Text("ButtonBar"),
              style: buttonStyle,
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(children: const [
            SizedBox(height: 30,),
            LevelSizeStatefulWidget(),
          ],) ,
        ),
     // ),
    );
  }

}

/// ***** Виджет слайдера ******
class LevelSizeStatefulWidget extends StatefulWidget{
  const LevelSizeStatefulWidget({Key? key}) : super (key: key);

  @override
  State<LevelSizeStatefulWidget> createState() => _LevelSizeStatefulWidgetState();
}

class _LevelSizeStatefulWidgetState extends State<LevelSizeStatefulWidget>{
  double _currentLevelValue = 20;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(children: [
        Expanded(
          child: SliderTheme(
            data: SliderTheme.of(context).copyWith(
              trackHeight: 1.0,
              trackShape: RectangularSliderTrackShape(),
              activeTrackColor: Colors.green.shade800,
              inactiveTrackColor: Colors.red.shade400,
              thumbColor: Colors.amberAccent,
              overlayColor: Colors.pink.withOpacity(0.2),
              overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),
              tickMarkShape: RoundSliderTickMarkShape(),
              activeTickMarkColor: Colors.amberAccent,
              inactiveTickMarkColor: Colors.white,
            ),
            child: Slider(
              value: _currentLevelValue,
              max: 50,
              min: 20,
              divisions: 100,
              onChanged: (double value) {
                setState(() {
                  _currentLevelValue = value;
                  print(_currentLevelValue);
                });
              },
            ),
          ),
        ),
      ],
        mainAxisAlignment: MainAxisAlignment.center,
      ),
    );
    throw UnimplementedError();
  }

}
