import 'package:flutter/material.dart';

class Imageview extends StatefulWidget {
  final String imgPath;
  Imageview({required this.imgPath});

  @override
  State<Imageview> createState() => _ImageviewState();
}

class _ImageviewState extends State<Imageview> {
  var filePath;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: <Widget>[
        Hero(
          tag: widget.imgPath,
          child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Image.network(
                widget.imgPath,
                fit: BoxFit.cover,
              )),
        ),
        Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          alignment: Alignment.bottomCenter,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width / 2,
                    height: 55,
                    decoration: BoxDecoration(
                      color: Color(0xff1C1B1B).withOpacity(0.8),
                      borderRadius: BorderRadius.circular(40),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 2,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.white60, width: 1),
                        borderRadius: BorderRadius.circular(30),
                        gradient: LinearGradient(
                            colors: [
                              Color(0x36FFFFFF),
                              Color(0x0FFFFFFF),
                            ],
                            begin: FractionalOffset.topCenter,
                            end: FractionalOffset.bottomCenter)),
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 2, vertical: 8),
                      child: Column(
                        children: <Widget>[
                          Text(
                            "set wallpaper",
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                          Text(
                            "image will be saved in gallery",
                            style: TextStyle(color: Colors.white, fontSize: 10),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 16,
              ),
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Text(
                  "cancel",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              SizedBox(
                height: 50,
              )
            ],
          ),
        )
      ],
    ));
  }
}
