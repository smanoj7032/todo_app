import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/src/model/todo_model/todo_model.dart';
import 'package:todo_app/src/repo/service/todoservice.dart';
import 'package:todo_app/src/ui/add_todo/add_todo.dart';
import 'package:todo_app/src/ui/dashboard/dashboard.dart';
import 'package:uuid/uuid.dart';
class AllTodo extends StatefulWidget {
  const AllTodo({Key? key}) : super(key: key);

  @override
  State<AllTodo> createState() => _AllTodoState();
}

class _AllTodoState extends State<AllTodo> {
  TextEditingController title = TextEditingController();
  TextEditingController description = TextEditingController();
  String id = Uuid().v4();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    CollectionReference ref = FirebaseFirestore.instance.collection("Todo");
    return Scaffold(
      appBar: AppBar(shadowColor: Colors.blue,backgroundColor: Colors.red,centerTitle: true,
        title: Text('TODO',style: TextStyle(fontSize: 34),
        ),

      ),
      body: StreamBuilder(
        stream: ref.get().asStream(),
        builder: (BuildContext context,AsyncSnapshot<QuerySnapshot> snapshot){
          if(snapshot.hasError){
            return SizedBox(
              height: size.height,
              width: size.width,
              child: Center(
                child: Image.asset('assets/images/error.png',height: size.height*0.2,),
              ),
            );
          }
          if(snapshot.connectionState == ConnectionState.waiting){
            return(
            Container(
              height: size.height,
              width: size.width,
              child: Center(
                child: Image.asset('assets/images/loading1.gif'),
              ),
            )
            );
          }
          if(snapshot.data!.docs.isEmpty){

            return(
                Container(
              height: size.height,
              width: size.width,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/images/cat.gif',height: size.height*0.2,),
                    SizedBox(
                      height: size.height*0.02,
                    ),
                    TextButton(onPressed: (){
                      setState(() {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => Dashboard()));

                      });
                    }, child: Text('Create Todo'))
                  ],
                ),
              ),
            )
            );

          }
          return ListView(
            children: snapshot.data!.docs.map((DocumentSnapshot document)
          {
            Map<String, dynamic> data =
            document.data()! as Map<String, dynamic>;
            return
              Card(
                margin: EdgeInsets.all(5),
              color: Colors.lightBlueAccent,
              child: Container(
                margin: EdgeInsets.all(8),
                height: size.height*0.1,
                width: size.width,
                decoration: BoxDecoration(
                  border: Border.all(style: BorderStyle.solid)
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset('assets/images/greentick.png',
                            height: size.height*0.12,
                            width: size.width*0.12,),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 5,
                      child: Container(
                        height: size.height*0.09,
                        width: size.width*0.12,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [Text(data['Title'].toString()),
                            Text(data['description'].toString())

                          ],
                        ),
                      ),
                    ),

                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 16.0),
                        child: IconButton(onPressed: (){ setState(() {
                          Todomodel todo=Todomodel(title.text.trim(), description.text.trim(), false, id);
                          Todoservice().deleteTodo(data['id'],todo);
                        });

                        }, icon: Icon(Icons.delete_forever,size: 50,)),
                      ),
                    )



                  ],
                ),


              ),
            );
          }   ).toList(),);

          }
      ),
      floatingActionButton: FloatingActionButton(
      onPressed: (){
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => Dashboard()));

      },
      child: Icon(Icons.add),
    ),
    );



  }
}
