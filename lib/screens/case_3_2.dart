import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<Post> fetchPost() async{
  final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts/1'));
  if(response.statusCode == 200){
    return Post.fromJson(jsonDecode(response.body));
  }else{
    throw Exception('Ошибка загрузки');
  }
}

class Post{
  final int userId;
  final int id;
  final String title;
  final String body;

  Post({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
});

  factory Post.fromJson(Map<String, dynamic> json){
    return Post(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
      body: json['body'],
    );
  }

}

class HTTPStatefulWidget extends StatefulWidget{
  const HTTPStatefulWidget({Key? key,}) : super (key: key);

  @override
  State<HTTPStatefulWidget> createState() => _HTTPStatefulWidgetState();
}

class _HTTPStatefulWidgetState extends State<HTTPStatefulWidget>{
  late Future<Post> futurePost;

  @override
  void initState(){
    super.initState();
    futurePost = fetchPost();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold (
      appBar: AppBar(
        title: const Text("Кейс 3.2"),
      ),
      body: Column(children: [
        const SizedBox(height: 30,),
        Center(
            child: FutureBuilder<Post>(
                future: futurePost,
                builder: (context, snapshot) {
                  if (snapshot.hasData){
                    return Text("body:\n ${snapshot.data!.body}");
                  }else if (snapshot.hasError){
                    return Text('${snapshot.error}');
                  }else{
                    return const CircularProgressIndicator();
                  }
                }
            )
        ),
        const SizedBox(height: 30,),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
              child: FutureBuilder<Post>(
                future: futurePost,
                builder: (context, snapshot) {
                  if (snapshot.hasData){
                    return Text("title:\n ${snapshot.data!.title}");
                  }else if (snapshot.hasError){
                    return Text('${snapshot.error}');
                  }else{
                    return const CircularProgressIndicator();
                  }
                }
              )
          ),
        ),
      ],),
      // ),
    );
    throw UnimplementedError();
  }
  
}