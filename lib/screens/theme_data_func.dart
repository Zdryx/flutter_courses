import 'package:flutter/material.dart';

class ThemeDataDemo extends StatefulWidget{
  const ThemeDataDemo({Key? key}) : super (key: key);

  @override
  _ThemeDataDemoState createState() => _ThemeDataDemoState();
}


class _ThemeDataDemoState extends State<ThemeDataDemo>{

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
      body: SingleChildScrollView(
        child: Column(children: [
          const SizedBox(height: 81,),
          Container(
            height: 100,
            color: Theme.of(context).colorScheme.secondary,
          ),

          const SizedBox(height: 19,),
          Row(children: const[
            Text(
              "Введите логин в виде 10 цифр \nномера телефона",
              textAlign: TextAlign.center,
              softWrap: true,
              style:TextStyle(
                fontWeight: FontWeight.normal,
                overflow: TextOverflow.visible,
                fontSize:16,
                color: Color(0x80000000),
              ) ,
            ),
          ],
            mainAxisAlignment: MainAxisAlignment.center,
          ),
          const SizedBox(height: 33,),
          Row(children: const[
            SizedBox( width: 244,
              child: TextField(
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Color(0xFFECEFF1),
                  labelText: "Телефон",
                  enabledBorder: textFieldStyle,
                  focusedBorder: textFieldStyle,
                ),
              ),
            ),
          ],
            mainAxisAlignment: MainAxisAlignment.center,
          ),
          const SizedBox(height: 20,),
          Row(children: const[
            SizedBox( width: 244,
              child: TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Color(0xFFECEFF1),
                  labelText: "Пароль",
                  enabledBorder: textFieldStyle,
                  focusedBorder: textFieldStyle,
                ),
              ),
            ),
          ],
            mainAxisAlignment: MainAxisAlignment.center,
          ),
          const SizedBox(height: 28,),
          Row(children: [
            SizedBox( width: 154, height:42,
              child: ElevatedButton(
                child: const Text("Войти"),
                style: ElevatedButton.styleFrom(
                  primary: const Color(0xFF0079D0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(36.0),
                  ),),
                onPressed: () { print("Enter"); },
              ),
            ),
          ],
            mainAxisAlignment: MainAxisAlignment.center,
          ),
          const SizedBox(height: 62,),
          Row(children: [
            InkWell(
              child: const Text("Регистрация", style: linkStyle),
              onTap: () { print("registration"); },
            ),
          ],
            mainAxisAlignment: MainAxisAlignment.center,
          ),
          const SizedBox(height: 19,),
          Row(children: [
            InkWell(
              child: const Text("Забыли пароль?", style: linkStyle),
              onTap: () { print("registration"); },
            ),
          ],
            mainAxisAlignment: MainAxisAlignment.center,
          ),

        ],),
      ),
      //  ),
    );
  }
}