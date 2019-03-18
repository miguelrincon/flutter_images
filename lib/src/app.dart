import 'package:flutter/material.dart';
import 'package:http/http.dart' show get, Response;
import 'models/image_model.dart';
import 'dart:convert' show json;
import 'widgets/image_list.dart';

class App extends StatefulWidget {
  AppState createState() {
    return AppState();
  }
}

class AppState extends State<App> {
  int counter = 1;
  List<ImageModel> images = List<ImageModel>();

  void fetchImage() async {
    setState(() {
      counter += 1;
    });
    print('Fetching image $counter...');
    try {
      final Response response =
          await get('https://jsonplaceholder.typicode.com/photos/$counter');
      print('Fetched image $counter!');
      final ImageModel im = ImageModel.fromMap(json.decode(response.body));

      setState(() {
        images.add(im);
      });
    } catch (err) {
      print(err);
    }
  }

  Widget build(BuildContext cxt) {
    return MaterialApp(
      home: Scaffold(
        body: ImageList(images),
        appBar: AppBar(
          title: Text('Let\'s see some images!'),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: fetchImage,
        ),
      ),
    );
  }
}
