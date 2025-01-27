import 'package:flutter/material.dart';
import 'package:walpro/data/data.dart';
import 'package:walpro/model/categories.dart';
import 'package:walpro/widget.dart';

class homepage extends StatefulWidget {
  const homepage({super.key});

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  List<Categoriesmodel> categories = [];
  void initState() {
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
      body: Container(
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
                    decoration: InputDecoration(
                      hintText: "Search wallpaper",
                      border: InputBorder.none,
                    ),
                  ),
                ),
                Icon(Icons.search)
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
        ],
      )),
    );
  }
}

class CategoriesTile extends StatelessWidget {
  String imageUrl, categoryName;

  CategoriesTile(
      {super.key, required this.imageUrl, required this.categoryName});
  @override
  Widget build(BuildContext context) {
    return Container(
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
        ));
  }
}
