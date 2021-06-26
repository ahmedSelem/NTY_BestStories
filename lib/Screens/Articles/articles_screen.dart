import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:project_task/Models/articles_model.dart';
import 'package:project_task/Providers/db_provider.dart';
import 'package:project_task/Widgets/Articles_widget/article_item.dart';

class ArticlesScreen extends StatefulWidget {
  const ArticlesScreen({Key? key}) : super(key: key);

  @override
  _ArticlesScreenState createState() => _ArticlesScreenState();
}

class _ArticlesScreenState extends State<ArticlesScreen> {
  bool? isLoading;
  List<ArticlesModel?> articleList = [];

  @override
  void initState() {
    super.initState();
    isLoading = false;
  }

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
    loadingFun(true);
    articleList =
        await Provider.of<DBProvider>(context, listen: false).fetchArticle();
    print(articleList);
    loadingFun(false);
  }

  void loadingFun(bool value) {
    setState(() {
      isLoading = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('NYT Best Stories'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(12, 20, 12, 0),
          child: (isLoading == true)
              ? Center(
                  child: CircularProgressIndicator(
                    color: Theme.of(context).primaryColor,
                  ),
                )
              : (articleList.isNotEmpty)
                  ? ListView.builder(
                      itemBuilder: (context, index) =>
                          ArticleItem(articleObj: articleList[index]),
                      itemCount: articleList.length,
                    )
                  : Center(
                      child: Text('No Article Yet',
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold)),
                    ),
        ),
      ),
    );
  }
}
