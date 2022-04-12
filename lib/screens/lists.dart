import 'package:flutter/material.dart';

class ListsBuilder extends StatefulWidget{
  const ListsBuilder({Key? key}) : super (key: key);

  @override
  _ListsBuilderState createState() => _ListsBuilderState();
}


class _ListsBuilderState extends State<ListsBuilder>{

  @override
  Widget build(BuildContext context) {
    const textFieldStyle = OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(36)),
      borderSide: BorderSide(
        width:0,
        color: Color(0xFFECEFF1),
      ),
    );
    const linkStyle = TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.bold,
      color: Color(0xFF0079D0),

    );

    // return MaterialApp(
    //   theme: ThemeData(
    //    fontFamily: 'Semi',
    //  ),
    //     home: Scaffold (
    return Scaffold (
        body: ListViewBuilder(),
    );
  }
}

/// ***** Виджет списка ******
class ListViewStatefulWidget extends StatefulWidget{
  const ListViewStatefulWidget({Key? key}) : super (key: key);

  @override
  State<ListViewStatefulWidget> createState() => _ListViewStatefulWidgetState();
}

class _ListViewStatefulWidgetState extends State<ListViewStatefulWidget>{

  @override
  Widget build(BuildContext context) {
      return ListView(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        children: const [
          MyListItem(number: 1),
          MyListItem(number: 2),
          MyListItem(number: 3),
          MyListItem(number: 4),
          MyListItem(number: 5),
          MyListItem(number: 6),
          MyListItem(number: 7),
          MyListItem(number: 8),
          MyListItem(number: 9),
          MyListItem(number: 10),
          MyListItem(number: 11),

        ],
    );
    throw UnimplementedError();
  }

}

/// ***** Айтем списка ******
class MyListItem extends StatelessWidget{
  const MyListItem({Key? key, required this.number}) : super (key: key);

  final int number;

  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.all(5),
      decoration:  BoxDecoration(
        color: Colors.lightBlueAccent,
        border: Border.all(),
        borderRadius: const BorderRadius.all(Radius.circular(10.0)),
      ),
      height: 100,
      //color: Theme.of(context).colorScheme.secondary,
      child: Text("Элемент № $number", style: Theme.of(context).textTheme.headline6),
    );
    throw UnimplementedError();
  }
}

/// ***** Виджет билдера ******
class ListViewBuilder extends StatefulWidget{
  const ListViewBuilder({Key? key}) : super (key: key);

  @override
  State<ListViewBuilder> createState() => _ListViewBuilderState();
}

class _ListViewBuilderState extends State<ListViewBuilder>{

 int _selectedIndex =0;
 // var list = new List<int>.generate(50, (i) => i++);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.all(20),
      itemCount: 20,
      itemBuilder: (BuildContext context, int index){
        return ListTile(
          leading: Icon(Icons.ac_unit),
          title: Text("Элемент Tile № $index"),
          selected: index == _selectedIndex,
          onTap: () {
            setState(() {
              _selectedIndex = index;
              print(_selectedIndex);
            });
          },
        );
      },
    );
    throw UnimplementedError();
  }
}




