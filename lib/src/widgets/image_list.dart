import 'package:flutter/material.dart';
import '../models/image_model.dart';

class ImageList extends StatelessWidget {
  final List<ImageModel> images;

  Widget build(BuildContext ctx) {
    return ListView.builder(
      itemCount: images.length,
      itemBuilder: (ctx, int index) {
        ImageModel im = images.elementAt(index);
        return buildImage(im);
      },
    );
  }

  Widget buildImage(ImageModel im) {
    return Container(
      margin: EdgeInsets.all(20.0),
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
      ),
      child: Column(
        children: <Widget>[
          Padding(
            child: Image.network(im.url),
            padding: EdgeInsets.only(
              bottom: 10.0
            ),
          ),
          Text(im.title),
        ]
      )
    );
  }
  ImageList(this.images);
}
