import 'package:flutter/material.dart';
import 'package:flutter_scoped_model/scopes/home_scoped.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:scoped_model/scoped_model.dart';
import '../model/post_model.dart';
import '../views/item_of_post.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeScoped scoped = HomeScoped();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    scoped.apiPostList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("ScopedModel"),
        ),
        body: ScopedModel<HomeScoped>(
          model: scoped,
          child: ScopedModelDescendant<HomeScoped>(
            builder: (context, child, model){
              return Stack(
                children: [
                  ListView.builder(
                    itemCount: scoped.items.length,
                    itemBuilder: (ctx, index) {
                      return itemOfPost(scoped, scoped.items[index]);
                    },
                  ),
                  scoped.isLoading
                      ? Center(
                    child: CircularProgressIndicator(),
                  )
                      : SizedBox.shrink(),
                ],
              );
            },
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
          onPressed: () {
            // Respond to button press
          },
          child: Icon(Icons.add),
        ));
  }

}
