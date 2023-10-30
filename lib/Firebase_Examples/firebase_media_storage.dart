
import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options:  const FirebaseOptions(
      apiKey: "AIzaSyC9eAirjmsctohEN7aOLYPjA-bKIYWYpQE",
      projectId: "fir-project-3abe8",
      appId: '1:437733634646:android:285a59c2c4474699bdc1f7',
      messagingSenderId: '',
      storageBucket: 'fir-project-3abe8.appspot.com'
    ),
  );
  runApp(
      const MaterialApp(home: FirebaseStoreMedia(),
      ));
}

class FirebaseStoreMedia extends StatefulWidget {
  const FirebaseStoreMedia({super.key});

  @override
  State<FirebaseStoreMedia> createState() => _FirebaseStoreMediaState();
}

class _FirebaseStoreMediaState extends State<FirebaseStoreMedia> {
  //create firebase object
  FirebaseStorage storage = FirebaseStorage.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Media Storage using Firebase"),
      ),
      body: Padding(padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(onPressed: () => upload('camera'),
                    icon: Icon(Icons.camera_alt_outlined), label: Text("Camera")
                ),
                ElevatedButton.icon(onPressed: () => upload('gallery'),
                    icon: Icon(Icons.photo), label: Text("Gallery")
                ),

              ],
            ),
            Expanded(child: FutureBuilder(
              //we will give here what will happen in future
              //ie, if firebase connection is success load the data/image
                future: loadMedia(),
                builder: (context,AsyncSnapshot<List<Map<String,dynamic>>>snapshot){
                  //connectionState => firebasel ninn verne value
                  if(snapshot.connectionState == ConnectionState.done){
                    return ListView.builder(
                      itemCount: snapshot.data?.length ?? 0,
                        itemBuilder: (context,index){
                        final Map<String,dynamic> image = snapshot.data![index];
                        return Card(
                          child: ListTile(
                            leading: Image.network(image['imageurl']),
                            title: Text(image['uploadedBy']),
                            subtitle: Text(image['description']),
                            trailing: IconButton(onPressed: ()=>deleteMedia(image['path']),
                                icon: Icon(Icons.delete)),
                          ),
                        );
                    });
                  }
                  return Center(child: CircleAvatar(),);

                }))
          ],
        ),
      ),
    );
  }

  Future<void> upload(String imageSource) async {
    //image galerylno camerlno click cheydht edka - path
    final picker = ImagePicker();
    XFile? pickedImage; //XFile is a class in image picker. it is used to take/collect platform dependent path

    //now we will upload to cloud
    try {
      pickedImage = await picker.pickImage(
          source: imageSource == 'camera' ? ImageSource.camera : ImageSource
              .gallery,maxWidth: 1920);
      //now the image from camera and gallery is stored in pickedImage
      //now we want to take the path, cause we give it to the firebase including the path
      final String fileName = path.basename(pickedImage!.path);
      //File is used to take platform independent
      File imagefile = File(pickedImage.path); //here should import dart:io;

      //to give the path which is taken to firebase
      //to upload data/path to firebase
      try{
        await storage.ref(fileName).putFile(imagefile,SettableMetadata(customMetadata: {
          'uploadedBy': "Its Me xxx",
          'description': "some description"
        }));
        //to refresh UI
        setState(() {});
      }on FirebaseException catch(error){
        print(error);
      }
    }catch(error){
      print(error);
    }
  }

  Future<List<Map<String,dynamic>>> loadMedia() async{
    //firebasenn verne data store cheyyan
    List<Map<String,dynamic>> images = [];
    final ListResult result = await storage.ref().list();
    final List<Reference> allfiles = result.items;

    await Future.forEach(allfiles, (singlefile) async{
      final String fileUrl = await singlefile.getDownloadURL(); //to fetch image path
      final FullMetadata metadata = await singlefile.getMetadata();  //to fetch metadata from firebase

   images.add({
     'imageurl' : fileUrl,
     'path' : singlefile.fullPath,
     'uploadedBy' : metadata.customMetadata? ['uploadedBy'] ?? 'No Data',
     'description':  metadata.customMetadata? ['description'] ?? 'No description',
   });
    });
    return images;


  }

  Future<void> deleteMedia(String imagepath) async{
    await storage.ref(imagepath).delete();
    setState(() {});
  }
}
