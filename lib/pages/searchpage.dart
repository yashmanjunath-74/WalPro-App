import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:walpro/data/data.dart';
import 'package:walpro/model/walpaper_model.dart';
import 'package:walpro/widget.dart';

class Searchpage extends StatefulWidget {
  final String searchQuery;

  Searchpage({required this.searchQuery});

  @override
  State<Searchpage> createState() => _SearchpageState();
}

class _SearchpageState extends State<Searchpage> {
  TextEditingController searchController = new TextEditingController();
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

  @override
  void initState() {
    getSearchWallpapers(widget.searchQuery);
    super.initState();
    searchController.text = widget.searchQuery;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: brandname(),
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 18),
                padding: EdgeInsets.symmetric(horizontal: 18),
                decoration: BoxDecoration(
                  color: Colors.black87,
                  borderRadius: BorderRadius.circular(30.0),
                ),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: TextField(
                        controller: searchController,
                        decoration: InputDecoration(
                          hintText: "Search wallpaper",
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    GestureDetector(
                        onTap: () {
                          wallpapers.clear();
                          getSearchWallpapers(searchController.text);
                        },
                        child: Container(child: Icon(Icons.search)))
                  ],
                ),
              ),
              SizedBox(
                height: 16,
              ),
              wallpaperList(wallpapers: wallpapers, context: context)
            ],
          ),
        ),
      ),
    );
  }
}
