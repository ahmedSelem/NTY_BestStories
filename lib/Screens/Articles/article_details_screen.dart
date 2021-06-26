import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:project_task/Models/articles_model.dart';

class ArticleDetailsScreen extends StatefulWidget {
  static const String routeName = '/articleDetailsScreen';
  final ArticlesModel? articleObj;
  ArticleDetailsScreen(this.articleObj);

  @override
  _ArticleDetailsScreenState createState() => _ArticleDetailsScreenState();
}

class _ArticleDetailsScreenState extends State<ArticleDetailsScreen> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Stack(
            children: [
              Column(
                children: [
                  Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * .4,
                    margin: EdgeInsets.only(bottom: 10),
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(60),
                      ),
                      child: (widget.articleObj?.imgUrl != null)
                          ? Image.network(
                              '${widget.articleObj?.imgUrl}',
                              fit: BoxFit.cover,
                            )
                          : Text('Image Here'),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
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
                              'Create: ${DateFormat('MMMM d - y').format(widget.articleObj!.historyCreation!)}',
                              style: TextStyle(
                                  fontSize: 14, color: Colors.black54),
                            ),
                            Container(
                              height: 16,
                              width: 1,
                              color: Theme.of(context).primaryColor,
                              margin: EdgeInsets.symmetric(horizontal: 8),
                            ),
                            Text(
                              'Publish: ${DateFormat('MMMM d - y').format(widget.articleObj!.historyPublish!)}',
                              style: TextStyle(
                                  fontSize: 12, color: Colors.black54),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Text(
                          (widget.articleObj!.title != null)
                              ? '${widget.articleObj!.title}'
                              : 'Title Here',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 14),
                        Text(
                          (widget.articleObj!.abstractOfArticle != null)
                              ? '${widget.articleObj!.abstractOfArticle}'
                              : 'Abstract Herer',
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                child: IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                    size: 26,
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
