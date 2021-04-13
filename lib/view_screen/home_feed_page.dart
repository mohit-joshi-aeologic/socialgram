import 'package:flutter/material.dart';
import 'package:socialgram/models/todo.dart';


import 'package:socialgram/utils/utils.dart';
import 'package:socialgram/view_screen/post_widget.dart';
import 'package:socialgram/view_screen/story_view.dart';
import 'package:socialgram/widget/avatar_widget.dart';

class HomeFeedPage extends StatefulWidget {
  final ScrollController scrollController;

  HomeFeedPage({this.scrollController});

  @override
  _HomeFeedPageState createState() => _HomeFeedPageState();
}

class _HomeFeedPageState extends State<HomeFeedPage> {
  final _posts = <Post>[
    Post(
      user: mohit,
      imageUrls: [
        'assets/images/c.webp',
        'assets/images/username1.jpeg',
        'assets/images/user.jpeg',
        'assets/images/username1.jpeg',

      ],
      likes: [
        Like(user: mohit),
        Like(user: aditya),
        Like(user: deepak),
        Like(user: akshay),
      ],
      comments: [
        Comment(
          text: 'How are you all dealing with the pandemic?',
          user: aditya,
          commentedAt: DateTime(2019, 5, 23, 14, 35, 0),
          likes: [Like(user: mohit12)],
        ),
      ],
      location: 'Delhi',
      postedAt: DateTime(2019, 5, 23, 12, 35, 0),
    ),
    Post(
      user: mohit12,
      imageUrls: ['assets/images/postphoto.jpeg'],
      likes: [],
      comments: [],
      location: 'Noida',
      postedAt: DateTime(2019, 5, 21, 6, 0, 0),
    ),
    Post(
      user: akshay,
      imageUrls: ['assets/images/on8.jpeg'],
      likes: [Like(user: mohit)],
      comments: [],
      location: 'Ghaziabad',
      postedAt: DateTime(2019, 5, 2, 0, 0, 0),
    ),
    //repeating posts
    Post(
      user: mohit,
      imageUrls: [
        'assets/images/user.jpeg',
        'assets/images/username1.jpeg',
        'assets/images/user.jpeg',
        'assets/images/username1.jpeg',

      ],
      likes: [
        Like(user: mohit),
        Like(user: aditya),
        Like(user: deepak),
        Like(user: akshay),
      ],
      comments: [
        Comment(
          text: 'How are you all dealing with the pandemic?',
          user: aditya,
          commentedAt: DateTime(2019, 5, 23, 14, 35, 0),
          likes: [Like(user: mohit12)],
        ),
      ],
      location: 'Delhi',
      postedAt: DateTime(2019, 5, 23, 12, 35, 0),
    ),
    Post(
      user: akshay,
      imageUrls: ['assets/images/on10.jpeg'],
      likes: [],
      comments: [],
      location: 'Noida',
      postedAt: DateTime(2019, 5, 21, 6, 0, 0),
    ),
    Post(
      user: aditya,
      imageUrls: ['assets/images/building.gif'],
      likes: [Like(user: mohit)],
      comments: [],
      location: 'Delhi',
      postedAt: DateTime(2020, 5, 2, 0, 0, 0),
    ),


  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (ctx, i) {
        if (i == 0) {
          return StoriesBarWidget();
        }
        return PostWidget(_posts[i - 1]);
      },
      itemCount: _posts.length + 1,
      controller: widget.scrollController,
    );
  }
}

class StoriesBarWidget extends StatelessWidget {
  final _users = <User>[
    currentUser,
    mohit,
    akshay,
    aditya,
    deepak,
    shaiq,
  ];

  void _onUserStoryTap(BuildContext context, int i) {
    final message =
    i == 0 ? 'Add to Your Story' : "View ${_users[i].name}'s Story";
    showSnackbar(context, message);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 106.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (ctx, i) {
          return AvatarWidget(
            user: _users[i],
        /*    onTap: () => _onUserStoryTap(context, i),*/
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => MoreStories()),
              );
            },
            isLarge: true,
            isShowingUsernameLabel: true,
            isCurrentUserStory: i == 0,
          );
        },
        itemCount: _users.length,
      ),
    );
  }
}