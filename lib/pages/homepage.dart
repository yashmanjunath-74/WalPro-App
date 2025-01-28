import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:walpro/data/data.dart';
import 'package:walpro/model/categories.dart';
import 'package:walpro/model/walpaper_model.dart';
import 'package:walpro/pages/categaries.dart';
import 'package:walpro/pages/searchpage.dart';
import 'package:walpro/widget.dart';
import 'package:http/http.dart' as http;

class homepage extends StatefulWidget {
  const homepage({super.key});

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  List<Categoriesmodel> categories = [];
  List<WalpaperModel> wallpapers = [];
  TextEditingController searchController = new TextEditingController();

  getTrendingWallpapers() async {
    try {
      var response = await http.get(
          Uri.parse("https://api.pexels.com/v1/curated?per_page=30&page=1"),
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

  void initState() {
    getTrendingWallpapers();
    categories = getCategories();
    super.initState();
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
          children: <Widget>[
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
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Searchpage(
                                    searchQuery: searchController.text)));
                      },
                      child: Container(child: Icon(Icons.search)))
                ],
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 18),
              height: 80,
              child: ListView.builder(
                  itemCount: categories.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return CategoriesTile(
                      categoryName: categories[index].categoryName,
                      imageUrl: categories[index].imageUrl,
                    );
                  }),
            ),
            wallpaperList(wallpapers: wallpapers, context: context),
          ],
        )),
      ),
    );
  }
}

class CategoriesTile extends StatelessWidget {
  String imageUrl, categoryName;

  CategoriesTile(
      {super.key, required this.imageUrl, required this.categoryName});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Categarie(
                      categoryname: categoryName.toLowerCase(),
                    )));
      },
      child: Container(
          margin: EdgeInsets.only(right: 10),
          child: Stack(
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.network(
                  imageUrl,
                  height: 50,
                  width: 100,
                  fit: BoxFit.cover,
                ),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Container(
                  color: Colors.black38,
                  height: 50,
                  width: 100,
                  alignment: Alignment.center,
                  child: Text(
                    categoryName,
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 15),
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
