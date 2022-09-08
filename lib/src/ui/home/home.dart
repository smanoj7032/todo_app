import 'package:flutter/material.dart';
import 'package:todo_app/src/ui/add_todo/add_todo.dart';
import 'package:todo_app/src/ui/all_todo/all_todo.dart';
import 'package:todo_app/src/ui/dashboard/dashboard.dart';
import 'package:todo_app/src/ui/setting/setting.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}
class _HomeState extends State<Home> {
  int index=0;
  List<Widget> list = [
    AllTodo(),

    Setting(),

  ];
  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return Scaffold(
      drawer: Drawer(
        
      ),

        body: Container(
        height: size.height,
        width: size.width,
      child: list[index],
    ),
        bottomNavigationBar:BottomNavigationBar(
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home,size: 35,),label: 'Home',),

            BottomNavigationBarItem(icon: Icon(Icons.settings,size: 35,),label: 'Setting'),

          ],
          currentIndex: index,
          onTap: (value){
            setState(() {
              index=value;
            });
          },
        )


    );
  }
}


