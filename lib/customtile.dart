import 'package:flutter/material.dart';

class CustomTile extends StatefulWidget {
  final String image;
  const CustomTile({Key? key, required this.image}) : super(key: key);

  @override
  _CustomTileState createState() => _CustomTileState();
}

class _CustomTileState extends State<CustomTile> {
  bool showLoader = true;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 10)).then((value) {
      setState(() {
        showLoader = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: 295,
          width: 170,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              image: NetworkImage(widget.image),
              fit: BoxFit.fill,
            ),
          ),
        ),

        //This is the Circluar Spinner on the stroy
        showLoader
            ? Positioned.fill(
                child: Align(
                  alignment: Alignment.center,
                  child: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Colors.black54),
                    padding: EdgeInsets.all(5),
                    child: Center(
                      child: AspectRatio(
                        aspectRatio: 1,
                        child: TweenAnimationBuilder(
                          tween: Tween<double>(begin: 0, end: 1),
                          duration: Duration(seconds: 10),
                          builder: (context, double value, child) => Stack(
                            fit: StackFit.expand,
                            children: [
                              CircularProgressIndicator(
                                strokeWidth: 2.0,
                                value: value,
                                color: Colors.white,
                                backgroundColor: Colors.transparent,
                              ),
                              Center(
                                child: IconButton(
                                  icon: Icon(Icons.close),
                                  color: Colors.white,
                                  onPressed: () {},
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              )
            : Container()
        //The Circluar Spinner on the stroy end here
      ],
    );
  }
}
