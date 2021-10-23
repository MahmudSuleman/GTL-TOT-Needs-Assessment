import 'package:flutter/material.dart';
import 'package:recipe_app/controller/bookmark_manager.dart';
import 'package:recipe_app/model/recipe_model.dart';
import 'package:recipe_app/service/bookmark_recipe.dart';

//TODO: GET ALL BOOKMARKED RECIPES
//TODO: DELETE RECIPE

class BookmarkView extends StatelessWidget {
  BookmarkView({Key? key}) : super(key: key);
  final BookmarkService _bookmarkService = BookmarkService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bookmark'),
      ),
      body: FutureBuilder<List<RecipeModel>?>(
          future: BookmarkManager.allBookmarks(),
          builder: (context, snapshot) {
            return ListView(
              children: snapshot.data != null
                  ? snapshot.data!
                      .map((val) => Card(
                            child: ListTile(
                              title: Text(val.title),
                            ),
                          ))
                      .toList()
                  : [],
            );
          }),
    );
  }
}
