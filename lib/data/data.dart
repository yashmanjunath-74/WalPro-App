import 'package:flutter/material.dart';
import 'package:walpro/model/categories.dart';

List<Categoriesmodel> getCategories() {
  List<Categoriesmodel> categories = [];
  Categoriesmodel categoriesmodel = new Categoriesmodel();

  categoriesmodel.imageUrl =
      "https://images.pexels.com/photos/162379/lost-places-pforphoto-leave-factory-162379.jpeg?auto=compress&cs=tinysrgb&w=600";
  categoriesmodel.categoryName = "Street Art";
  categories.add(categoriesmodel);

  //
  categoriesmodel = new Categoriesmodel();
  categoriesmodel.imageUrl =
      "https://images.pexels.com/photos/16066/pexels-photo.jpg?auto=compress&cs=tinysrgb&w=600";
  categoriesmodel.categoryName = "wild life";
  categories.add(categoriesmodel);
  //
  categoriesmodel = new Categoriesmodel();
  categoriesmodel.imageUrl =
      "https://images.pexels.com/photos/147411/italy-mountains-dawn-daybreak-147411.jpeg?auto=compress&cs=tinysrgb&w=600";
  categoriesmodel.categoryName = "Nature";
  categories.add(categoriesmodel);
  //
  categoriesmodel = new Categoriesmodel();
  categoriesmodel.imageUrl =
      "https://images.pexels.com/photos/161034/cross-jesus-bible-god-161034.jpeg?auto=compress&cs=tinysrgb&w=600";
  categoriesmodel.categoryName = "jesus";
  categories.add(categoriesmodel);
  //
  categoriesmodel = new Categoriesmodel();
  categoriesmodel.imageUrl =
      "https://images.pexels.com/photos/70912/pexels-photo-70912.jpeg?auto=compress&cs=tinysrgb&w=600";
  categoriesmodel.categoryName = "Cars";
  categories.add(categoriesmodel);
  //
  categoriesmodel = new Categoriesmodel();
  categoriesmodel.imageUrl =
      "https://images.pexels.com/photos/1161996/pexels-photo-1161996.jpeg?auto=compress&cs=tinysrgb&w=600";
  categoriesmodel.categoryName = "Bikes";
  categories.add(categoriesmodel);
  //

  categoriesmodel = new Categoriesmodel();
  categoriesmodel.imageUrl =
      "https://images.pexels.com/photos/56866/garden-rose-red-pink-56866.jpeg?auto=compress&cs=tinysrgb&w=600";
  categoriesmodel.categoryName = "Flowers";
  categories.add(categoriesmodel);

  return categories;
}
