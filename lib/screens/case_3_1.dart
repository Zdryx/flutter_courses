import 'dart:io';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:path_provider/path_provider.dart';

class CounterStorage {
  const CounterStorage();
  Future<String> get _localPath async{
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<File> get _localFile async{
    final path = await _localPath;
    return File('$path/counters.txt');
  }

  Future<int> readCounter() async{
    try{
      final file = await _localFile;
      final contents = await file.readAsString();
      return int.parse(contents);
    }catch(e){
      return 0;
    }
  }

  Future<File> writeCounter(int counter) async{
      final file = await _localFile;
      return file.writeAsString('$counter');
  }

}


// Виджет
class SafetyStatefulWidget extends StatefulWidget{
  const SafetyStatefulWidget({Key? key, required this.storage}) : super (key: key);
  final CounterStorage storage;
  @override
  State<SafetyStatefulWidget> createState() => _SafetyStatefulWidgetState();
}

class _SafetyStatefulWidgetState extends State<SafetyStatefulWidget>{
  int _count1 = 0;
  int _count2 = 0;
  Map<String, Object> values = <String, Object>{'counter1': 0};


  @override
  void initState(){
    super.initState();
    //init path_provider
    widget.storage.readCounter().then((int value) {
      setState(() {
        _count2 = value;
      });
    });
    //init shared_preferences
    _loadCounter();
  }

  //Загружаем переменные
  void _loadCounter() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _count1 = (prefs.getInt('counter1') ?? 0);
      print("$_count1");
    });
  }

  //Инкрементируем
  void _incrementCounter1() async {
    //SharedPreferences.setMockInitialValues(values);
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _count1 = (prefs.getInt('counter1') ?? 0) +1;
      prefs.setInt("counter1", _count1);
    });
  }

  Future<File> _incrementCounter2() {
    setState(() {
      _count2++;
    });
    return widget.storage.writeCounter(_count2);
  }
 @override
  Widget build(BuildContext context) {
    return Scaffold (
      appBar: AppBar(
        title: const Text("Кейс 3.1"),
      ),
      body: Center(
        child: Column(children: [
          const SizedBox(height: 30,),
          Row(children: [
            Expanded(flex: 1,
              child: Center(
                child: Text(
                  '$_count1',
                  style: Theme.of(context).textTheme.headline4,
                ),
              ),
            ),
            Expanded(flex: 1,
              child: ElevatedButton(
                onPressed: _incrementCounter1,
                child:  const Icon(Icons.add),
              ),
            ),
          ],),
          const SizedBox(height: 30,),
          Row(children: [
            Expanded(flex: 1,
              child: Center(
                child: Text(
                  '$_count2',
                  style: Theme.of(context).textTheme.headline4,
                ),
              ),
            ),
            Expanded(flex: 1,
              child: ElevatedButton(
                onPressed: _incrementCounter2,
                child:  const Icon(Icons.add),
              ),
            ),
          ],),
        ],) ,
      ),
      // ),
    );
    throw UnimplementedError();
  }
}