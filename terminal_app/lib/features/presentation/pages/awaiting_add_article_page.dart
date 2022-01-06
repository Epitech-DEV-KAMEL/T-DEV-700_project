import 'package:dartz/dartz.dart' as dartz;
import 'package:flutter/material.dart';
import 'package:terminal_app/core/entities/article.dart';
import 'package:terminal_app/core/error/failure.dart';

class AwaitingAddArticlePage extends StatefulWidget {
  const AwaitingAddArticlePage({
    Key? key, 
    required this.getArticleFuture, 
    required this.onAdded
  }) : super(key: key);

  final Future<dartz.Either<Failure, Article>> getArticleFuture;
  final Function(Article)? onAdded;

  @override
  _AwaitingAddArticlePageState createState() => _AwaitingAddArticlePageState();
}

class _AwaitingAddArticlePageState extends State<AwaitingAddArticlePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: FutureBuilder(
            future: widget.getArticleFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                var result = snapshot.data as dartz.Either<Failure, Article>;
                return result.fold(
                    (failure) {
                      _popPage(context, 3);
                      return Text(
                          "Failed to contact server\nor Unauthorized",
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.error,
                              fontSize: 22.0,
                              fontWeight: FontWeight.bold
                          ),
                       );
                    },
                    (article) {
                      _popPage(context, 1);
                      widget.onAdded?.call(article);
                      return const Text(
                        "Article added successfully",
                        style: TextStyle(
                          color: Colors.green,
                          fontSize: 22.0,
                          fontWeight: FontWeight.bold
                        ),
                      );
                    }
                );
              } else {
                return CircularProgressIndicator(
                    color: Theme.of(context).colorScheme.onBackground);
              }
            },
          ),
        ),
      ),
    );
  }

  Future<void> _popPage(BuildContext context, int seconds) async {
    await Future.delayed(Duration(seconds: seconds));
    Navigator.pop(context);
  }
}
