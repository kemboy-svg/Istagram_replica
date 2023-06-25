import 'dart:typed_data';
import '../utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:image_picker/image_picker.dart';
import 'package:instagram_app/models/user.dart';
import 'package:instagram_app/utils/colors.dart';
import 'package:instagram_app/providers/user_providers.dart';

class AddPostScreen extends StatefulWidget {
  const AddPostScreen({super.key});

  @override
  State<AddPostScreen> createState() => _AddPostScreenState();
   
}

class _AddPostScreenState extends State<AddPostScreen> {
  Uint8List? _file;
  
  _selectImage(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return SimpleDialog(
            title: Text("Create a post"),
            children: [
              SimpleDialogOption(
                padding: EdgeInsets.all(8),
                child: Text("Take a photo"),
                onPressed: () async {
                  Navigator.of(context).pop();
                  Uint8List file = await pickImage(ImageSource.camera);
                  setState(() {
                    _file = file;
                  });
                },
              ),
              SizedBox(height: 40,),
               SimpleDialogOption(
                padding: EdgeInsets.all(8),
                child: Text("Choose from gallery"),
                onPressed: () async {
                  Navigator.of(context).pop();
                  Uint8List file = await pickImage(ImageSource.gallery);
                  setState(() {
                    _file = file;
                  });
                },
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    final User user =Provider.of<UserProvider>(context).getUser;
    return(_file==null)
     ?Center(
      child: IconButton(onPressed:() =>{
        _selectImage(context)
      }, icon: const Icon(Icons.upload),),
    )
   :Scaffold(
      backgroundColor: mobileBackgroundColor,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.arrow_back),
        ),
        title: Text("Post To"),
        centerTitle: false,
        actions: [
          TextButton(
            onPressed: () {},
            child: const Text(
              "Post",
              style: TextStyle(color: Colors.blue, fontSize: 20),
            ),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
               CircleAvatar(
                backgroundImage:NetworkImage (user.photoUrl),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.5,
                child: const TextField(
                  decoration: InputDecoration(
                    hintText: ("Write your caption"),
                    border: InputBorder.none,
                  ),
                  maxLines: 8,
                ),
              ),
              SizedBox(
                height: 45,
                width: 45,
                child: AspectRatio(
                  aspectRatio: 458 / 451,
                  child: Container(
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(""),
                          fit: BoxFit.fill,
                          alignment: FractionalOffset.topCenter),
                    ),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
