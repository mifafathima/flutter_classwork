import 'package:flutter/material.dart';
import 'package:flutter_classwork/STORAGES%20IN%20FLUTTER/SQFLITE%20OPERATIONS/SQFLITE%20CRUD/sqflite%20operations.dart';

void main(){
  runApp(MaterialApp(
    home: SqfliteHome(),
  ));
}

class SqfliteHome extends StatefulWidget {
  const SqfliteHome({super.key});

  @override
  State<SqfliteHome> createState() => _SqfliteHomeState();
}

class _SqfliteHomeState extends State<SqfliteHome> {

  final name_ctrl = TextEditingController();
  final phone_ctrl = TextEditingController();

  var isLoading = true;

  //databasenn value edkan oru list[map]
  List<Map<String, dynamic>> contacts = [];

  @override
  void initState() {
    loadUI();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("My Contacts"),
        ),
        body: isLoading
            ? const Center(
          child: CircularProgressIndicator(),
        )
            : ListView.builder(
          itemBuilder: (context, index) {
            return  Card(
              child: ListTile(
                title: Text(contacts[index]['cname']),  //accessing single map from list
                subtitle: Text(contacts[index]['cnumber']),
                trailing: Wrap(
                  children: [
                    IconButton(onPressed: (){
                      showSheet(contacts[index]['id']);
                    }, icon: Icon(Icons.edit)),
                    IconButton(onPressed: (){
                      deleteContact(contacts[index]['id']);
                    },
                        icon: Icon(Icons.delete))
                  ],
                )
              ),
            );
          },
          itemCount: contacts.length,
        ),
        floatingActionButton: FloatingActionButton(
          //creating a new data so the id will be null
          onPressed: ()=> showSheet(null),
          child: const Icon(Icons.add),
        ));
  }
  void showSheet(int? id) async{
    if (id != null) {
      final existingcontact = contacts.firstWhere((element) => element['id'] == id);
      name_ctrl.text = existingcontact['cname'];
      phone_ctrl.text = existingcontact['cnumber'];
    }
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (context){
          return Container(
            padding: EdgeInsets.only(
                left: 15,
                right: 15,
                top: 15,
                bottom: MediaQuery.of(context).viewInsets.bottom + 120
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: name_ctrl,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Name"
                  ),
                ),
                const SizedBox(height: 10,),
                TextField(
                  controller: phone_ctrl,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Phone number"
                  ),
                ),
                const SizedBox(height: 10,),
                ElevatedButton(onPressed: () async{
                  if(id == null){
                    await createContact();
                  }
                  if(id != null){
                    await updateContact(id);
                  }
                  name_ctrl.text ="";
                  phone_ctrl.text = "";
                  Navigator.pop(context);

                }, child: Text(id == null ? "Create Contact" : "Update Contact"))
              ],
            ),
          );
        });
  }
//to add a new data or contact to sqflite database
 Future<void> createContact() async {
    await SQLHelper.create_contact(name_ctrl.text,phone_ctrl.text);
   // print(id);
   loadUI();  //to update the list
 }

  void loadUI() async{
    final data = await SQLHelper.readContacts();
    setState(() {
      contacts = data;
      isLoading = false;
    });
  }

  Future<void> updateContact(int id) async {
    await SQLHelper.updateContact(id,name_ctrl.text,phone_ctrl.text);
    loadUI();
  }

  Future<void> deleteContact(int id) async{
    await SQLHelper.deleteContact(id);
    loadUI();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Successfully Deleted")));
  }

}
