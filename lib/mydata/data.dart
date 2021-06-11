import 'package:wallpaper_app/model/categories_model.dart';

String apiKey = "563492ad6f917000010000018585066514824beca829c3cdda0d0fb4";
List<CategoriesModel> getCategories() {
  List<CategoriesModel> mylist = [];

  mylist = [
    CategoriesModel(
        categoryName: "Social Media",
        imgUrl:
            "https://images.pexels.com/photos/607812/pexels-photo-607812.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"),
    CategoriesModel(
        categoryName: "Flower Garden",
        imgUrl:
            "https://images.pexels.com/photos/158028/bellingrath-gardens-alabama-landscape-scenic-158028.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"),
    CategoriesModel(
        categoryName: "Medicine",
        imgUrl:
            "https://images.pexels.com/photos/159211/headache-pain-pills-medication-159211.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"),
    CategoriesModel(
        categoryName: "Boat",
        imgUrl:
            "https://images.pexels.com/photos/6059973/pexels-photo-6059973.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"),
    CategoriesModel(
        categoryName: "Gun",
        imgUrl:
            "https://images.pexels.com/photos/5202425/pexels-photo-5202425.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"),
    CategoriesModel(
        categoryName: "Worship",
        imgUrl:
            "https://images.pexels.com/photos/267559/pexels-photo-267559.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"),
  ];

  return mylist;
}
