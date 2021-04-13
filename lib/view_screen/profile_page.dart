import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:flutter/rendering.dart';
import 'package:socialgram/main.dart';
import 'package:socialgram/models/todo.dart';
import 'package:socialgram/view_screen/edit_profile_page.dart';
import 'package:socialgram/view_screen/story_view.dart';
import 'image_post.dart';
import 'dart:async';

class ProfilePage extends StatefulWidget {
  const ProfilePage({this.userId});

  final String userId;

  _ProfilePage createState() => _ProfilePage(this.userId);
}

class _ProfilePage extends State<ProfilePage>
    with AutomaticKeepAliveClientMixin<ProfilePage> {
  final String profileId;
  String currentUserId = '1';
  String view = "grid"; // default view
  bool isFollowing = false;
  bool isOpened=false;
  bool _isGrid = false;
  bool followButtonClicked = false;
  int postCount = 0;
  int followerCount = 0;
  int followingCount = 0;

  _ProfilePage(this.profileId);

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  editProfile() {
    EditProfilePage editPage = EditProfilePage();

    Navigator.of(context)
        .push(MaterialPageRoute<bool>(builder: (BuildContext context) {
      return Center(
        child: Scaffold(
            appBar: AppBar(
              leading: IconButton(
                icon: Icon(Icons.close,color: Colors.black,size: 30,),
                onPressed: () {
                  Navigator.maybePop(context);
                },
              ),
              title: Text('Edit Profile',
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold)),
              backgroundColor: Colors.white,
              actions: <Widget>[
                IconButton(
                    icon: Icon(
                      Icons.check,
                      color: Colors.blueAccent,
                    ),
                    onPressed: () {
                      Navigator.maybePop(context);
                    })
              ],
            ),
            body: ListView(
              children: <Widget>[
                Container(
                  child: editPage,
                ),
              ],
            )),
      );
    }));
  }

  followUser() {
    print('following user');
    setState(() {
      this.isFollowing = true;
      followButtonClicked = true;
    });

    Firestore.instance.document("insta_users/$profileId").updateData({
      'followers.$currentUserId': true
      //firestore plugin doesnt support deleting, so it must be nulled / falsed
    });

    Firestore.instance.document("insta_users/$currentUserId").updateData({
      'following.$profileId': true
      //firestore plugin doesnt support deleting, so it must be nulled / falsed
    });

    //updates activity feed
    Firestore.instance
        .collection("insta_a_feed")
        .document(profileId)
        .collection("items")
        .document(currentUserId)
        .setData({
      "ownerId": profileId,
      "username": currentUserModel.username,
      "userId": currentUserId,
      "type": "follow",
      "userProfileImg": mohit,
      "timestamp": DateTime.now()
    });
  }

  unfollowUser() {
    setState(() {
      isFollowing = false;
      followButtonClicked = true;
    });

    Firestore.instance.document("insta_users/$profileId").updateData({
      'followers.$currentUserId': false
      //firestore plugin doesnt support deleting, so it must be nulled / falsed
    });

    Firestore.instance.document("insta_users/$currentUserId").updateData({
      'following.$profileId': false
      //firestore plugin doesnt support deleting, so it must be nulled / falsed
    });

    Firestore.instance
        .collection("insta_a_feed")
        .document(profileId)
        .collection("items")
        .document(currentUserId)
        .delete();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context); // reloads state when opened again

    Column buildStatColumn(String label, int number) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            number.toString(),
            style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                fontFamily: 'Robotobold'),
          ),
          Container(
              margin: const EdgeInsets.only(top: 4.0),
              child: Text(
                label,
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 12.0,
                    fontFamily: 'Robotomedium',
                    fontWeight: FontWeight.w400),
              ))
        ],
      );
    }

    Container buildFollowButton(
        {String text,
        Color backgroundcolor,
        Color textColor,
        Color borderColor,
        Function function}) {
      return Container(
        padding: EdgeInsets.only(top: 2.0),
        child: FlatButton(
            onPressed: function,
            child: Container(
              decoration: BoxDecoration(
                  color: backgroundcolor,
                  border: Border.all(color: borderColor),
                  borderRadius: BorderRadius.circular(5.0)),
              alignment: Alignment.center,
              child: Text(text,
                  style:
                      TextStyle(color: textColor, fontWeight: FontWeight.bold)),
              width: MediaQuery.of(context).size.width * .8,
              height: 27.0,
            )),
      );
    }

    Container buildProfileFollowButton(String user) {
      // viewing your own profile - should show edit button
      if (user == 'mohit') {
        return buildFollowButton(
          text: "Edit Profile",
          backgroundcolor: Colors.white,
          textColor: Colors.black,
          borderColor: Colors.grey,
          function: editProfile,
        );
      }

      // already following user - should show unfollow button
      if (isFollowing) {
        return buildFollowButton(
          text: "Unfollow",
          backgroundcolor: Colors.white,
          textColor: Colors.black,
          borderColor: Colors.grey,
          function: unfollowUser,
        );
      }

      // does not follow user - should show follow button
      if (!isFollowing) {
        return buildFollowButton(
          text: "Follow",
          backgroundcolor: Colors.blue,
          textColor: Colors.white,
          borderColor: Colors.blue,
          function: followUser,
        );
      }

      return buildFollowButton(
          text: "loading...",
          backgroundcolor: Colors.white,
          textColor: Colors.black,
          borderColor: Colors.grey);
    }

    Row buildImageViewButtonBar() {
      Color isActiveButtonColor(String viewName) {
        if (view == viewName) {
          return Colors.blueAccent;
        } else {
          return Colors.black26;
        }
      }

      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.grid_on, color: isActiveButtonColor("grid")),
            onPressed: () {
              setState(() {
                _isGrid=!_isGrid;
              });
              changeView("grid");
            },
          ),
          IconButton(
            icon: Icon(Icons.list, color: isActiveButtonColor("feed")),
            onPressed: () {
              setState(() {
                _isGrid=!_isGrid;
              });
              changeView("feed");
            },
          ),
        ],
      );
    }

    Container buildUserPosts() {
      Future<List<ImagePost>> getPosts() async {
        List<ImagePost> posts = [];
        var snap = await Firestore.instance
            .collection('insta_posts')
            .where('ownerId', isEqualTo: profileId)
            .orderBy("timestamp")
            .getDocuments();
        for (var doc in snap.documents) {
          posts.add(ImagePost.fromDocument(doc));
        }
        setState(() {
          postCount = snap.documents.length;
        });

        return posts.reversed.toList();
      }

      return Container(
          child: FutureBuilder<List<ImagePost>>(
        future: getPosts(),
        builder: (context, snapshot) {
          if (!snapshot.hasData)
            return Container(
                alignment: FractionalOffset.center,
                padding: const EdgeInsets.only(top: 10.0),
                child: CircularProgressIndicator());
          else if (view == "grid") {
            // build the grid
            return GridView.count(
                crossAxisCount: 3,
                childAspectRatio: 1.0,
//                    padding: const EdgeInsets.all(0.5),
                mainAxisSpacing: 1.5,
                crossAxisSpacing: 1.5,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: snapshot.data.map((ImagePost imagePost) {
                  return GridTile(child: ImageTile(imagePost));
                }).toList());
          } else if (view == "feed") {
            return Column(
                children: snapshot.data.map((ImagePost imagePost) {
              return imagePost;
            }).toList());
          }
        },
      ));
    }

    return
      Scaffold(
        appBar: AppBar(
          elevation: 1,
          title: Center(
            child: Text(
              'See COVID-19 Business Resources',
              style: const TextStyle(
                  color: Colors.blue,
                  fontSize: 14,
                  fontWeight: FontWeight.w500),
            ),
          ),
          actions: <Widget>[
            IconButton(
              // action button
              icon: Icon(Icons.dehaze,color: Colors.black,),
              onPressed: () {
                !_scaffoldKey.currentState.isEndDrawerOpen
                    ? _scaffoldKey.currentState.openEndDrawer()
                    : Navigator.of(context).pop();
              },
            ),
          ],
          backgroundColor: Colors.grey[100],
        ),
        key: _scaffoldKey,
        endDrawer: SizedBox(
          width: MediaQuery.of(context).size.width * .55,
          child: Drawer(
            child: ListView(
              children: <Widget>[
                SizedBox(
                  height: MediaQuery.of(context).size.width * .02,
                ),
                ListTile(
                  title: Row(
                    children: <Widget>[
                      Icon(Icons.watch_later),

                      SizedBox(
                        width: 10,
                      ),
                      Flexible(
                        child: Text(
                          'Archive',
                          maxLines: 2,
                          style: TextStyle(
                            fontSize: 18,
                            fontFamily: 'GilroyLight',
                            fontWeight: FontWeight.w900
                          ),
                        ),
                      ),
                    ],
                  ),  onTap: () {
                  Navigator.of(context).pop();
                  setState(() {
                    isOpened=!isOpened;
                  });



                  // Update the state of the app.
//                Navigator.of(context).pushNamed(RouteName.TermsConditions,arguments: 'Privacy Policy');
                },
                ),
                Container(
                  height: 0.5,
                  color: Colors.grey,
                ),
                ListTile(
                  title: Row(
                    children: <Widget>[
                      Icon(Icons.all_inclusive),

                      SizedBox(
                        width: 10,
                      ),
                      Flexible(
                        child: Text(
                          'Your Activity',
                          maxLines: 2,
                          style: TextStyle(
                              fontSize: 18,
                              fontFamily: 'GilroyLight',
                              fontWeight: FontWeight.w900
                          ),
                        ),
                      ),
                    ],
                  ),  onTap: () {
                  Navigator.of(context).pop();
                  setState(() {
                    isOpened=!isOpened;
                  });



                  // Update the state of the app.
//                Navigator.of(context).pushNamed(RouteName.TermsConditions,arguments: 'Privacy Policy');
                },
                ),
                Container(
                  height: 0.5,
                  color: Colors.grey,
                ),
                ListTile(
                  title: Row(
                    children: <Widget>[
                      Icon(Icons.ac_unit),

                      SizedBox(
                        width: 10,
                      ),
                      Flexible(
                        child: Text(
                          'Nametag',
                          maxLines: 2,
                          style: TextStyle(
                              fontSize: 18,
                              fontFamily: 'GilroyLight',
                              fontWeight: FontWeight.w900
                          ),
                        ),
                      ),
                    ],
                  ),  onTap: () {
                  Navigator.of(context).pop();
                  setState(() {
                    isOpened=!isOpened;
                  });



                  // Update the state of the app.
//                Navigator.of(context).pushNamed(RouteName.TermsConditions,arguments: 'Privacy Policy');
                },
                ),
                Container(
                  height: 0.5,
                  color: Colors.grey,
                ),
                ListTile(
                  title: Row(
                    children: <Widget>[
                      Icon(Icons.scatter_plot),

                      SizedBox(
                        width: 10,
                      ),
                      Flexible(
                        child: Text(
                          'Insights',
                          maxLines: 2,
                          style: TextStyle(
                              fontSize: 18,
                              fontFamily: 'GilroyLight',
                              fontWeight: FontWeight.w900
                          ),
                        ),
                      ),
                    ],
                  ),  onTap: () {
                  Navigator.of(context).pop();
                  setState(() {
                    isOpened=!isOpened;
                  });



                  // Update the state of the app.
//                Navigator.of(context).pushNamed(RouteName.TermsConditions,arguments: 'Privacy Policy');
                },
                ),
                Container(
                  height: 0.5,
                  color: Colors.grey,
                ),
                ListTile(
                  title: Row(
                    children: <Widget>[
                      Icon(Icons.save_alt),

                      SizedBox(
                        width: 10,
                      ),
                      Flexible(
                        child: Text(
                          'Saved',
                          maxLines: 2,
                          style: TextStyle(
                              fontSize: 18,
                              fontFamily: 'GilroyLight',
                              fontWeight: FontWeight.w900
                          ),
                        ),
                      ),
                    ],
                  ),  onTap: () {
                  Navigator.of(context).pop();
                  setState(() {
                    isOpened=!isOpened;
                  });



                  // Update the state of the app.
//                Navigator.of(context).pushNamed(RouteName.TermsConditions,arguments: 'Privacy Policy');
                },
                ),
                Container(
                  height: 0.5,
                  color: Colors.grey,
                ),
                ListTile(
                  title: Row(
                    children: <Widget>[
                      Icon(Icons.border_bottom),

                      SizedBox(
                        width: 10,
                      ),
                      Flexible(
                        child: Text(
                          'Close Friends',
                          maxLines: 2,
                          style: TextStyle(
                              fontSize: 18,
                              fontFamily: 'GilroyLight',
                              fontWeight: FontWeight.w900
                          ),
                        ),
                      ),
                    ],
                  ),  onTap: () {
                  Navigator.of(context).pop();
                  setState(() {
                    isOpened=!isOpened;
                  });



                  // Update the state of the app.
//                Navigator.of(context).pushNamed(RouteName.TermsConditions,arguments: 'Privacy Policy');
                },
                ),
                Container(
                  height: 0.5,
                  color: Colors.grey,
                ),
                ListTile(
                  title: Row(
                    children: <Widget>[
                      Icon(Icons.person_add),

                      SizedBox(
                        width: 10,
                      ),
                      Flexible(
                        child: Text(
                          'Discover People',
                          maxLines: 2,
                          style: TextStyle(
                              fontSize: 18,
                              fontFamily: 'GilroyLight',
                              fontWeight: FontWeight.w900
                          ),
                        ),
                      ),
                    ],
                  ),  onTap: () {
                  Navigator.of(context).pop();
                  setState(() {
                    isOpened=!isOpened;
                  });



                  // Update the state of the app.
//                Navigator.of(context).pushNamed(RouteName.TermsConditions,arguments: 'Privacy Policy');
                },
                ),
                Container(
                  height: 0.5,
                  color: Colors.grey,
                ),
              ],
            ),
          ),
        ),
        body: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      CircleAvatar(
                        radius: 40.0,
                        backgroundImage: AssetImage(
                          'assets/images/username1.jpeg',
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Column(
                          children: <Widget>[
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                buildStatColumn("posts", postCount),
                                buildStatColumn("followers", 100),
                                buildStatColumn("following", 200),
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  Container(
                      alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Text(
                        'Mohit Joshi',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      )),
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.only(top: 1.0),
                    child: Text(
                      'Personal Blog ',
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 11,
                          fontFamily: 'GilroyLight',
                          fontWeight: FontWeight.w900),
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.only(top: 1.0),
                    child: Text(
                      'Less HUMAN. More BEING ',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontFamily: 'GilroyLight',
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[buildProfileFollowButton('mohit')]),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      FlatButton(
                          onPressed: () {},
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(color: Colors.black45),
                                borderRadius: BorderRadius.circular(5.0)),
                            alignment: Alignment.center,
                            child: Text('Promotions',
                                style: TextStyle(
                                    fontSize: 12,
                                    fontFamily: 'GilroySemiBold',
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold)),
                            width: MediaQuery.of(context).size.width * .23,
                            height: 27.0,
                          )),
                      FlatButton(
                          onPressed: () {},
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(color: Colors.black45),
                                borderRadius: BorderRadius.circular(5.0)),
                            alignment: Alignment.center,
                            child: Text('Insights',
                                style: TextStyle(
                                    fontSize: 12,
                                    fontFamily: 'GilroySemiBold',
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold)),
                            width: MediaQuery.of(context).size.width * .22,
                            height: 27.0,
                          )),
                      FlatButton(
                          onPressed: () {},
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(color: Colors.black45),
                                borderRadius: BorderRadius.circular(5.0)),
                            alignment: Alignment.center,
                            child: Text('Contact',
                                style: TextStyle(
                                    fontSize: 12,
                                    fontFamily: 'GilroySemiBold',
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold)),
                            width: MediaQuery.of(context).size.width * .22,
                            height: 27.0,
                          )),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          InkWell(   onTap: (){
      Navigator.push(
      context,
      MaterialPageRoute(
      builder: (context) => MoreStories()),
      );
      },
                            child: CircleAvatar(
                              backgroundColor: Colors.grey[300],
                              radius: 30.0,
                              child: Icon(
                                Icons.add_circle_outline,
                                color: Colors.black,
                                size: 24,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          Text(
                            'Add',
                            style: TextStyle(
                                fontSize: 12,
                                fontFamily: 'GilroyLight',
                                fontWeight: FontWeight.w900),
                          )
                        ],
                      ),
                      InkWell(onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MoreStories()),
                        );
                      },
                        child: Column(
                          children: <Widget>[
                            CircleAvatar(
                              radius: 30.0,
                              backgroundImage: AssetImage(
                                'assets/images/username1.jpeg',
                              ),
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Text(
                              'Books',
                              style: TextStyle(
                                  fontSize: 12,
                                  fontFamily: 'GilroyLight',
                                  fontWeight: FontWeight.w900),
                            )
                          ],
                        ),
                      ),
                      InkWell(onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MoreStories()),
                        );
                      },
                        child: Column(
                          children: <Widget>[
                            CircleAvatar(
                              radius: 30.0,
                              backgroundImage: AssetImage(
                                'assets/images/on8.jpeg',
                              ),
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Text(
                              'Accolades',
                              style: TextStyle(
                                  fontSize: 12,
                                  fontFamily: 'GilroyLight',
                                  fontWeight: FontWeight.w900),
                            )
                          ],
                        ),
                      ),
                      InkWell(onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MoreStories()),
                        );
                      },
                        child: Column(
                          children: <Widget>[
                            CircleAvatar(
                              radius: 30.0,
                              backgroundImage: AssetImage(
                                'assets/images/on9.jpeg',
                              ),
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Text(
                              'Family',
                              style: TextStyle(
                                  fontSize: 12,
                                  fontFamily: 'GilroyLight',
                                  fontWeight: FontWeight.w900),
                            )
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Divider(),
            buildImageViewButtonBar(),
            Divider(height: 0.0),

           _isGrid?
           GridView.count(shrinkWrap: true,
              crossAxisCount: 3,
              crossAxisSpacing: 4.0,
              mainAxisSpacing: 8.0,
              children: <Widget>[
                Image.network("https://placeimg.com/500/500/any"),
                Image.network("https://placeimg.com/500/500/any"),
                Image.network("https://placeimg.com/500/500/any"),
                Image.network("https://placeimg.com/500/500/any"),
                Image.network("https://placeimg.com/500/500/any"),
                Image.network("https://placeimg.com/500/500/any"),
                Image.network("https://placeimg.com/500/500/any"),
                Image.network("https://placeimg.com/500/500/any"),
                Image.network("https://placeimg.com/500/500/any"),
              ],
            ): GridView.count(shrinkWrap: true,
             crossAxisCount: 3,scrollDirection: Axis.vertical,
             crossAxisSpacing: 4.0,
             mainAxisSpacing: 8.0,
             children: <Widget>[
               Image.asset('assets/images/on5.jpeg',fit: BoxFit.cover,),
               Image.asset('assets/images/on9.jpeg',fit: BoxFit.cover,),
               Image.asset('assets/images/on8.jpeg',fit: BoxFit.cover,),
               Image.asset('assets/images/on7.jpeg',fit: BoxFit.cover,),
               Image.asset('assets/images/on6.jpeg',fit: BoxFit.cover,),
               Image.asset('assets/images/on10.jpeg',fit: BoxFit.cover,),
               Image.asset('assets/images/on1.jpg',fit: BoxFit.cover,),
               Image.network("https://placeimg.com/500/500/any"),
               Image.network("https://placeimg.com/500/500/any"),
             ],
           )
          ],
        ));

    /* return StreamBuilder(

        builder: (context, snapshot)
        {
          if (!snapshot.hasData)
            return Container(
                alignment: FractionalOffset.center,
                child: CircularProgressIndicator());

          User user = User.fromDocument(snapshot.data);

          if (user.followers.containsKey(currentUserId) &&
              user.followers[currentUserId] &&
              followButtonClicked == false) {
            isFollowing = true;
          }

          return Scaffold(
              appBar: AppBar(
                title: Text(
                  user.username,
                  style: const TextStyle(color: Colors.black),
                ),
                backgroundColor: Colors.white,
              ),
              body: ListView(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            CircleAvatar(
                              radius: 40.0,
                              backgroundColor: Colors.grey,
                              backgroundImage: NetworkImage(user.photoUrl),
                            ),
                            Expanded(
                              flex: 1,
                              child: Column(
                                children: <Widget>[
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                    children: <Widget>[
                                      buildStatColumn("posts", postCount),
                                      buildStatColumn("followers",
                                          _countFollowings(user.followers)),
                                      buildStatColumn("following",
                                          _countFollowings(user.following)),
                                    ],
                                  ),
                                  Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                      children: <Widget>[
                                        buildProfileFollowButton(user)
                                      ]),
                                ],
                              ),
                            )
                          ],
                        ),
                        Container(
                            alignment: Alignment.centerLeft,
                            padding: const EdgeInsets.only(top: 15.0),
                            child: Text(
                              user.displayName,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )),
                        Container(
                          alignment: Alignment.centerLeft,
                          padding: const EdgeInsets.only(top: 1.0),
                          child: Text(user.bio),
                        ),
                      ],
                    ),
                  ),
                  Divider(),
                  buildImageViewButtonBar(),
                  Divider(height: 0.0),
                  buildUserPosts(),
                ],
              ));
        });*/
  }

  changeView(String viewName) {
    setState(() {
      view = viewName;
    });
  }

  int _countFollowings(String followings) {}

  // ensures state is kept when switching pages
  @override
  bool get wantKeepAlive => true;
}

class ImageTile extends StatelessWidget {
  final ImagePost imagePost;

  ImageTile(this.imagePost);

  clickedImage(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute<bool>(builder: (BuildContext context) {
      return Center(
        child: Scaffold(
            appBar: AppBar(
              title: Text('Photo',
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold)),
              backgroundColor: Colors.white,
            ),
            body: ListView(
              children: <Widget>[
                Container(
                  child: imagePost,
                ),
              ],
            )),
      );
    }));
  }

  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => clickedImage(context),
        child: Image.network(imagePost.mediaUrl, fit: BoxFit.cover));
  }
}

void openProfile(BuildContext context, String userId) {
  Navigator.of(context)
      .push(MaterialPageRoute<bool>(builder: (BuildContext context) {
    return ProfilePage(userId: userId);
  }));
}
