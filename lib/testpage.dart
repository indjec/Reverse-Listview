import 'package:flutter/material.dart';
import 'package:test_proj/data.dart';

import 'customtile.dart';

class TestPage extends StatefulWidget {
  const TestPage({Key? key}) : super(key: key);

  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  var images = List<String>.empty(growable: true);
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    images = [
      "https://placeimg.com/640/480/nature",
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView.separated(
            separatorBuilder: (context, index) {
              return SizedBox(
                height: 10,
              );
            },
            reverse: true,
            itemCount: images.length,
            itemBuilder: (context, index) {
              return CustomTile(image: images[index]);
            }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            images.insert(0, "https://placeimg.com/640/480/animals");
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
