import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

void main() async {
  await Hive.initFlutter(); //hive is initialised
  await Hive.openBox('to_do_Box'); //open box
  runApp(MaterialApp(
    home: Hive_Main(),
  ));
}

class Hive_Main extends StatefulWidget {
  @override
  State<Hive_Main> createState() => _Hive_MainState();
}

class _Hive_MainState extends State<Hive_Main> {
  List<Map<String, dynamic>> task = [];

  final mybox = Hive.box('to_do_Box');  //object creation of hive

  final name_cntrl = TextEditingController();
  final content_cntrl = TextEditingController();

  @override
  void initState() {
    load_or_readTask();  
    super.initState();
  }
  void load_or_readTask() {
    //hivel ulla single pair edkan vendeet
    final task_from_hive = mybox.keys.map((e) {  //e => single value store aaavm
      final value = mybox.get(e);  //single values seperate aayt edkan
      return{
        "id" : e,
        "taskname": value["name"],
        "taskcontent":value["content"]
      };
    }).toList();
    setState(() {
      task = task_from_hive.reversed.toList();
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ToDo"),
      ),
      body: task.isEmpty
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: task.length,
              itemBuilder: (context, index) {
                final mytask = task[index];
                return Card(
                  child: ListTile(
                    title: Text(mytask["taskname"]),
                    subtitle: Text(mytask["taskcontent"]),
                    trailing: Wrap(
                      children: [
                        IconButton(onPressed: () {
                          showTask(context, mytask['id']);
                        }, icon: Icon(Icons.edit)),
                        IconButton(onPressed: () {
                          deleteTask(mytask['id']);
                        }, icon: Icon(Icons.delete)),
                      ],
                    ),
                  ),
                );
              }),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: ()=> showTask(context,null),
        label: Text("Create New Task"),
        icon: Icon(Icons.add),
      ),
    );
  }

 void showTask(BuildContext context, int? itemkey) {   //itemkey = id
    if(itemkey != null){
      final existingTask =task.firstWhere((element) => element['id']== itemkey);
      name_cntrl.text = existingTask['taskname'];
      content_cntrl.text = existingTask['taskcontent'];
    }
    showModalBottomSheet(
      isScrollControlled: true,
        context: context,
        builder: (context)
    {
      return Container(
        padding: EdgeInsets.only(
            top: 15,
            left: 15,
            right: 15,
            bottom: MediaQuery
                .of(context)
                .viewInsets
                .bottom + 120
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: name_cntrl,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Task Name",

              ),
            ),
            SizedBox(height: 20,),
            TextField(
              controller: content_cntrl,
                decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: "Task Content",
                )
            ),
            SizedBox(height: 20,),
            ElevatedButton(onPressed: () {
              if(name_cntrl.text != "" && content_cntrl.text != ""){
                if(itemkey == null){
                  createTask({'name':name_cntrl.text.trim(),
                      'content':content_cntrl.text.trim()
                  });
                }else{
                  updateTask(
                    itemkey,{
                    'name':name_cntrl.text.trim(),
                    'content':content_cntrl.text.trim()
                  }
                  );
                }
              }
              content_cntrl.text = "";
              name_cntrl.text = "";
              Navigator.of(context).pop();
            }, child: Text(itemkey == null ? "Create Task" : "Update Task")),
          ],
        ),
      );
    });
  }

  Future<void> createTask(Map<String, dynamic> task) async{
    await mybox.add(task);
    load_or_readTask();
  }

  Future<void> updateTask(int? itemkey, Map<String, String> uptask) async{
    await mybox.put(itemkey,uptask );
    load_or_readTask();
  }

  Future<void> deleteTask(int itemkey) async{
    await mybox.delete(itemkey);
    load_or_readTask();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("1 item Succesfully Deleted")));
  }

  


}
