import 'package:flutter/material.dart';
import 'package:todo_app/src/model/todo_model/todo_model.dart';
import 'package:todo_app/src/repo/service/todoservice.dart';
import 'package:todo_app/src/ui/all_todo/all_todo.dart';
import 'package:todo_app/src/ui/home/home.dart';
import 'package:uuid/uuid.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  TextEditingController title = TextEditingController();
  TextEditingController description = TextEditingController();
  String id = Uuid().v4();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: Colors.black26,
          height: size.height,
          width: size.width,
          child: Column(
            children: [
              SizedBox(
                height: size.height * 0.12,
                width: size.width,
              ),
              Container(
                height: size.height * 0.1,
                width: size.width * 1.0,

                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Title',
                    style: TextStyle(fontSize: 30),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: size.height * 0.1,
                  width: size.width,

                  child: TextField(

                    controller: title,
                    maxLength: 25,
                    maxLines: 1,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(24)
                          )
                      ),
                      // label: Center(
                      //   child: Text('Title'),
                      // )
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                    height: size.height * 0.1,
                    width: size.width,
                    child: Text(
                      'Description',
                      style: TextStyle(fontSize: 30),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: size.height * 0.3,
                  width: size.width,
                  decoration: BoxDecoration(border: Border.all()),
                  child: TextField(
                    controller: description,
                    maxLines: 10,
                    minLines: 1,
                    decoration: InputDecoration(
                        border:
                            OutlineInputBorder(borderSide: BorderSide.none)),
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.05,
                width: size.width,
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                          child: TextButton(
                              onPressed: () {
                                setState(() {
                                  title.clear();
                                  description.clear();
                                });
                              },
                              child: Text('Clear'))),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                          child: TextButton(
                        onPressed: () {
                          setState(() {
                            Todomodel todo=Todomodel(title.text.trim(),
                            description.text.trim(),false,id);
                            if(title.text.trim()!=""&&
                            description.text.trim()!=""){

                              Todoservice().addtodo(todo,id);
                              title.clear();
                              description.clear();
                              Navigator.of(context).push(MaterialPageRoute(builder: (context) => Home()));
                            }


                          });
                        },
                        child: Text('Save'),
                      )),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
