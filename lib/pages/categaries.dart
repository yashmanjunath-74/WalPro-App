import 'package:flutter/material.dart';
import 'package:walpro/data/data.dart';
import 'package:walpro/model/walpaper_model.dart';
import 'package:walpro/widget.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Categarie extends StatefulWidget {
  final String categoryname;

  const Categarie({required this.categoryname});

  @override
  State<Categarie> createState() => _CategarieState();
}

class _CategarieState extends State<Categarie> {
  List<WalpaperModel> wallpapers = [];

  getSearchWallpapers(String query) async {
    try {
      var response = await http.get(
          Uri.parse(
              "https://api.pexels.com/v1/search?query=$query&per_page=30&page=1"),
          headers: {"Authorization": apiKey});

      print("Response Status: ${response.statusCode}");
      if (response.statusCode == 200) {
        Map<String, dynamic> jsonData = jsonDecode(response.body);
        if (jsonData["photos"] != null) {
          jsonData["photos"].forEach((element) {
            WalpaperModel walpaperModel = WalpaperModel.fromMap(element);
            wallpapers.add(walpaperModel);
            print("Wallpaper added: ${walpaperModel.photographer}");
          });
        } else {
          print("No photos found in the response.");
        }
        setState(() {});
      } else {
        print("Failed to load wallpapers: ${response.body}");
      }
    } catch (e) {
      print("Error fetching wallpapers: $e");
    }
  }

  initState() {
    getSearchWallpapers(widget.categoryname);
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: brandname(),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              SizedBox(height: 16),
              wallpaperList(wallpapers: wallpapers, context: context)
            ],
          ),
        ),
      ),
    );
  }
}
