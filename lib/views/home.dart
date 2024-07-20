import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:global_news/models/article_model.dart';
import 'package:global_news/models/category_model.dart';
import 'package:global_news/helper/data.dart';
import 'package:global_news/helper/news.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
    // List<CategoryModel> categories = new List<CategoryModel>();
    List<CategoryModel> categories = getCategories(); // Accessing the method
    List<ArticleModel> articles = News().news; // Accessing the method
    bool _loading = true;
  @override
  void initState() {
    super.initState();
    categories = getCategories();
    getNews();
  }
  getNews() async {
    News newsClass = News();
    await newsClass.getNews();
    articles = newsClass.news;
    setState(() {
      _loading = false;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment:MainAxisAlignment.center,
          children: <Widget>[
          Text("Global"),
          Text('News', style: TextStyle(color: Colors.blue))
        ]),
        centerTitle:true,
        elevation: 0.0,
      backgroundColor: Colors.white,),
        body: _loading ? Center(
            child : Container(
              child: CircularProgressIndicator(),
            ),
        ) : Container(
          child: Column(
            children : <Widget>[
              // categories
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  height:70,
                    child: ListView.builder(
                      shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: categories.length,
                            itemBuilder: (context, index){
                                return CategoryTile(
                                  imageUrl: categories[index].imageUrl,
                                  categoryName: categories[index].categoryName,
                                );
                            }),
                ),
              //articles
              Container(
                child: ListView.builder(
                    shrinkWrap: true,
                    itemBuilder: (context, index){
                      return BlogTile(
                        title: articles[index].title,
                        imageUrl: articles[index].urlToImage,
                        desc: articles[index].description,
                      );
                    }),
              ),
            ],
            ),
          ),
    );
  }
}

class CategoryTile extends StatelessWidget {
  final String imageUrl;
  final String categoryName;

  // Correct constructor name and initialization
  const CategoryTile({
    Key? key,
    required this.imageUrl,
    required this.categoryName,
  }) : super(key: key);

  @override
  @override
  Widget build(BuildContext context) {
    return GestureDetector (
      onTap: () {

      },
        child :Container(
          margin: EdgeInsets.symmetric(horizontal: 5),
          child: Stack(
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child :Image.asset(imageUrl, width: 110, height: 60, fit: BoxFit.cover,)
              ),
              Container(
                alignment: Alignment.center,
                width: 110, height: 60,
                decoration : BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  color: Colors.black45,
                ),
                child: Text(categoryName, style:TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),),
              )
            ],
        ),
        ),
    );
  }
}

class BlogTile extends StatelessWidget {
  final String imageUrl, title, desc;

  const BlogTile({
    Key? key,
    required this.imageUrl,
    required this.title,
    required this.desc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Image.network(imageUrl),
          Text(title),
          Text(desc),
        ],
      ),
    );
  }
}
