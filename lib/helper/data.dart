import 'package:global_news/models/category_model.dart';

List<CategoryModel> getCategories() {
 List<CategoryModel> categories = <CategoryModel>[]; // Correct initialization
 CategoryModel categoryModel;


 //1
 categoryModel = CategoryModel();
 categoryModel.categoryName = "Business";
 categoryModel.imageUrl = "assets/images/unnamed.png";
 categories.add(categoryModel);

 //2
 categoryModel = CategoryModel();
 categoryModel.categoryName = "Entertainment";
 categoryModel.imageUrl = "assets/images/images.jfif";
 categories.add(categoryModel);

 //3
 categoryModel = CategoryModel();
 categoryModel.categoryName = "General";
 categoryModel.imageUrl = "assets/images/news-2.jpg";
 categories.add(categoryModel);

 //4
 categoryModel = CategoryModel();
 categoryModel.categoryName = "Health";
 categoryModel.imageUrl = "assets/images/news-3.jpg";
 categories.add(categoryModel);

 //5
 categoryModel = CategoryModel();
 categoryModel.categoryName = "Science";
 categoryModel.imageUrl = "assets/images/slides-3.jpg";
 categories.add(categoryModel);

 //6
 categoryModel = CategoryModel();
 categoryModel.categoryName = "Sports";
 categoryModel.imageUrl = "assets/images/unnamed.png";
 categories.add(categoryModel);

 //7
 categoryModel = CategoryModel();
 categoryModel.categoryName = "Technology";
 categoryModel.imageUrl = "assets/images/news-2.jpg";
 categories.add(categoryModel);

 return categories;
}
