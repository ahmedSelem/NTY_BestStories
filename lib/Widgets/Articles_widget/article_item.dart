import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:project_task/Models/articles_model.dart';
import 'package:project_task/Screens/Articles/article_details_screen.dart';

class ArticleItem extends StatelessWidget {
  const ArticleItem({Key? key, this.articleObj}) : super(key: key);
  final ArticlesModel? articleObj;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (contex) {
              return ArticleDetailsScreen(
                articleObj!,
              );
            },
          ),
        );
      },
      child: Container(
        margin:
            EdgeInsets.only(bottom: MediaQuery.of(context).size.height * .05),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * .30,
              child: (articleObj?.imgUrl != null)
                  ? Image.network(
                      '${articleObj?.imgUrl}',
                      fit: BoxFit.cover,
                    )
                  : Text('Image Not Founded'),
            ),
            SizedBox(height: 14),
            Padding(
              padding: const EdgeInsets.only(left: 2),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: 8),
                        child: Icon(
                          Icons.date_range_outlined,
                          size: 18,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      Text(
                        'Create: ${DateFormat('MMMM d - y').format(articleObj!.historyCreation!)}',
                        style: TextStyle(fontSize: 12, color: Colors.black54),
                      ),
                      Container(
                        height: 16,
                        width: 1,
                        color: Theme.of(context).primaryColor,
                        margin: EdgeInsets.symmetric(horizontal: 8),
                      ),
                      Text(
                        'Publish: ${DateFormat('MMMM d - y').format(articleObj!.historyPublish!)}',
                        style: TextStyle(fontSize: 12, color: Colors.black54),
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * .015,
                    ),
                    child: Text(
                      (articleObj?.title != null)
                          ? '${articleObj?.title}'
                          : 'Title Here',
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * .01,
                    ),
                    child: Text(
                      (articleObj?.abstractOfArticle != null)
                          ? '${articleObj?.abstractOfArticle}'
                          : 'Abstract Here',
                      style: TextStyle(fontSize: 14, color: Colors.black87),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
