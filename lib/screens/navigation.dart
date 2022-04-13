import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lite_version/screens/auth_screen.dart';
import 'package:lite_version/screens/app_bar.dart';
import 'package:lite_version/screens/theme_page.dart';
import 'package:lite_version/utils/global_theme.dart';

import 'case_3_1.dart';
import 'case_3_2.dart';
import 'lists.dart';

class NavigationDemo extends StatefulWidget{
  const NavigationDemo({Key? key}) : super (key: key);

  @override
  _NavigationDemoState createState() => _NavigationDemoState();
}


class _NavigationDemoState extends State<NavigationDemo>{
  //final _messengerKey = GlobalKey<ScaffoldMessengerState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme:globalTheme(),
        initialRoute: '/',
        routes: {
          '/': (context) => const NavigationScreen(),
          '/auth': (context) => const AuthScreen(),
          '/appbar': (context) => const AppBarScreen(),
          '/theme' :(context) => const ThemeDataDemo(),
          '/lists' :(context) => const ListsBuilder(),
          '/case_3_1' :(context) => const SafetyStatefulWidget(storage: CounterStorage()),
          '/case_3_2' :(context) => const HTTPStatefulWidget(),
        },
      //scaffoldMessengerKey: _messengerKey,
    );
  }
}




class NavigationScreen extends StatefulWidget{
  const NavigationScreen({Key? key}) : super (key: key);

  @override
  _NavigationScreenState createState() => _NavigationScreenState();
}


class _NavigationScreenState extends State<NavigationScreen>{
  final _messengerKey = GlobalKey<ScaffoldMessengerState>();

  @override
  Widget build(BuildContext context) {

    return Scaffold (
        appBar: AppBar(),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: const BoxDecoration(
                  color:Colors.blue,
                ),
                child: Container(
                  height: 200,
                  child: Column(
                    children:  [
                      Container(
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(50.0)),
                        ),
                        child: SizedBox(
                            width: 100,
                            height: 100,
                            child: Image.network("https://miro.medium.com/max/1400/1*C1ovjT9NFzgFr_r5-E9shw.png")),
                    ),
                      const Text("Навигация во Flutter", ),

                    ],
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                  ),

                ),
              ),
              ListTile(
                leading: const Icon(Icons.one_k_plus),
                title: const Text("Авторизация"),
                onTap:(){
                  //_messengerKey.currentState!.showSnackBar(
                  //  const SnackBar(content: Text("Переход в экран авторизации"),)
                //  );
                  Navigator.pushNamed(context, '/auth');
                },
              ),
              ListTile(
                leading: const Icon(Icons.two_k_plus),
                title: const Text("AppBar"),
                onTap:(){
                  Navigator.pushNamed(context, '/appbar');
                },
              ),
              const Divider(),
              const Padding(
                padding: EdgeInsets.only(top: 20, left: 20),
                child: Text("Профиль", ),
              ),
              ListTile(
                leading: const Icon(Icons.settings_accessibility),
                title: const Text("Тема"),
                onTap:(){
                  Navigator.pushNamed(context, '/theme');
                },
              ),
              ListTile(
                leading: const Icon(Icons.list),
                title: const Text("Списки"),
                onTap:(){
                  Navigator.pushNamed(context, '/lists');
                },
              ),
              ListTile(
                leading: const Icon(Icons.cases),
                title: const Text("Кейс 3.1"),
                onTap:(){
                  Navigator.pushNamed(context, '/case_3_1');
                },
              ),
              ListTile(
                leading: const Icon(Icons.cases),
                title: const Text("Кейс 3.2"),
                onTap:(){
                  Navigator.pushNamed(context, '/case_3_2');
                },
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Column(children: const [
            SizedBox(height: 30,),
          ],) ,
        ),
    );
  }
}