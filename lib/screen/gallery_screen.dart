import 'package:flutter/material.dart';
import 'package:medical_app/const.dart';

class GalleryScreen extends StatefulWidget {
  const GalleryScreen({super.key});

  @override
  State<GalleryScreen> createState() => _GalleryScreenState();
}

class _GalleryScreenState extends State<GalleryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Gallery"),
          centerTitle: true,
          backgroundColor: color1,
        ),
        body: GridView.builder(
            itemCount: 10,
            padding: EdgeInsets.all(5),
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            itemBuilder: (context, index) {
              return Card(
                child: Image.asset('name'),
              );
            }));
  }
}
