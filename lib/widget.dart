import 'package:flutter/material.dart';
import 'package:walpro/model/walpaper_model.dart';
import 'package:walpro/pages/imageview.dart';

Widget brandname() {
  return Row(
    children: <Widget>[
      SizedBox(width: 20),
      Text(
        "Wal",
        style: TextStyle(color: Colors.white),
      ),
      Text("Pro", style: TextStyle(color: Colors.lightBlueAccent))
    ],
  );
}

Widget wallpaperList({required List<WalpaperModel> wallpapers, context}) {
  return Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: GridView.count(
        shrinkWrap: true,
        physics: ClampingScrollPhysics(),
        crossAxisCount: 2,
        childAspectRatio: 0.6,
        mainAxisSpacing: 6.0,
        crossAxisSpacing: 6.0,
        children: wallpapers.map((wallpaper) {
          return GridTile(
            child: GestureDetector(
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          Imageview(imgPath: wallpaper.src.portrait))),
              child: Hero(
                tag: wallpaper.src.portrait,
                child: Container(
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.network(wallpaper.src.portrait,
                          fit: BoxFit.cover)),
                ),
              ),
            ),
          );
        }).toList(),
      ));
}
