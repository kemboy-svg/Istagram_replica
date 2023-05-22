import 'package:flutter/material.dart';
import 'package:instagram_app/utils/colors.dart';

class AddPostScreen extends StatefulWidget {
  const AddPostScreen({Key? key}) : super(key: key);

  @override
  State<AddPostScreen> createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen> {
  @override
  Widget build(BuildContext context) {
    // return Center(
    //   child: IconButton(
    //     icon: const Icon(Icons.upload)
    //     onPressed: (){},
    //     ),
    // );
    return Scaffold(
        appBar: AppBar(
      backgroundColor: mobileBackgroundColor,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () {},
      ),
      title: const Text("Post to"),
      centerTitle: false,
      actions: [
        TextButton(onPressed: (){}, 
        child: const Text(
          'Post',
          style: TextStyle(
        color: Colors.blueAccent,
        fontWeight: FontWeight.bold,
        fontSize: 16,
        ),
        ),
        )
      ],
    ),
    body:Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CircleAvatar(
              backgroundImage: NetworkImage(
                "https://images.unsplash.com/photo-1684158100445-8e6926faf964?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=401&q=80"
              ),
            ),
            SizedBox(
              
              width: MediaQuery.of(context).size.width*0.4,
              child: TextField(
                decoration: const InputDecoration(
                  hintText: 'Write your caption',
                  border: InputBorder.none,
                  
                ),
                maxLines: 8,
              ),
            ),
            SizedBox(
              width: 45,
              height: 45,
              child: AspectRatio(
                aspectRatio:487/451,
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage("https://images.unsplash.com/photo-1684158100445-8e6926faf964?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=401&q=80"),
                      fit: BoxFit.fill,
                      alignment: FractionalOffset.topCenter,
                      ),

                  ),
                ),
                 ),

            ),
          ],
        ),

      ],
    
    ),
    );
  }
}
