import 'package:flutter/material.dart';
import 'package:socialgram/view_screen/mainscreen.dart';
import 'package:story_view/story_view.dart';



class MoreStories extends StatefulWidget {
  @override
  _MoreStoriesState createState() => _MoreStoriesState();
}

class _MoreStoriesState extends State<MoreStories> {
  final storyController = StoryController();

  @override
  void dispose() {
    storyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     /* appBar: AppBar(backgroundColor: Colors.black,
        title: Text("Stories"),
      ),*/
      body: StoryView(
        storyItems: [
          StoryItem.pageImage(
            url: "https://media.giphy.com/media/hpXFi66bfQm7e81ohw/giphy.gif",
            controller: storyController,
          ),
          StoryItem.pageImage(
              url: "https://media.giphy.com/media/WOkuHrhNv4LQVeSoik/giphy.gif",
              caption: "Wash your Hands",
              controller: storyController),
          StoryItem.pageImage(
            url: "https://media.giphy.com/media/TI4F6XQU1zYxsPNIcX/giphy.gif",
            controller: storyController,
          ),
          StoryItem.text(
              title: "Follow FlutterDevs",
              backgroundColor:  Color(0xffEBAAA1),
              textStyle: TextStyle(fontFamily: 'GilroyLight',fontWeight: FontWeight.w700,fontSize: 30)

          ),
        ],
        onStoryShow: (s) {
          print("Showing a story");
        },
        onComplete: () {
          Navigator.pop(context);
        /*  Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => MainScreen()),
          );*/
          print("Completed a cycle");
        },
        progressPosition: ProgressPosition.top,
        repeat: false,
        controller: storyController,
      ),
    );
  }
}




