import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:socialgram/models/todo.dart';
import 'package:socialgram/utils/chat_item_page.dart';
import 'package:socialgram/utils/threekit.dart';
import 'package:socialgram/utils/utils.dart';
import 'package:socialgram/view_screen/avatar_widget.dart';
import 'package:socialgram/widget/chat_model.dart';

class DirectMessage extends StatefulWidget {
  @override
  _DirectMessageState createState() => _DirectMessageState();
}

class _DirectMessageState extends State<DirectMessage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  List<ChatModel> list = ChatModel.list;

  @override
  void initState() {
    _tabController = new TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.grey[200],
        iconTheme: IconThemeData(color: Colors.black),
        actions: <Widget>[
          IconButton(
              icon: Icon(
                Icons.switch_video,
                color: Colors.grey[700],
              ),
              onPressed: () {
                Navigator.maybePop(context);
              }),
          IconButton(
              icon: Icon(
                Icons.blur_linear,
                color: Colors.grey[700],
              ),
              onPressed: () {
                Navigator.maybePop(context);
              }),
        ],
        title: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                SizedBox(width: 6.0),
                GestureDetector(
                  child: Text(
                    'Direct Message',
                    style: TextStyle(
                        fontFamily: 'GilroyLight',
                        color: Colors.black87,
                        fontWeight: FontWeight.w700,
                        fontSize: 18.0),
                  ),
                ),
              ],
            ),
          ],
        ),
        bottom: TabBar(
          unselectedLabelColor: Colors.grey[600],
          labelColor: Colors.black,
          tabs: [
            new Tab(
              text: 'Primary',
            ),
            new Tab(
              text: 'General',
            ),
          ],
          controller: _tabController,
          indicatorColor: Colors.white,
          indicatorSize: TabBarIndicatorSize.tab,
        ),
        bottomOpacity: 1,
      ),
      body: TabBarView(
        children: [
          Column(
            children: <Widget>[
              SizedBox(height: 10),
              Container(
                decoration: BoxDecoration(
                  color: Color(0xffEBAAA1),
                  borderRadius: BorderRadius.circular(30),
                ),
                margin: EdgeInsets.symmetric(horizontal: 24),
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  children: <Widget>[
                    Container(
                        child: Icon(
                          Icons.search,
                          color: Colors.white,
                        )),
                    Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                              hintStyle: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                  fontFamily: 'GilroyLight'),
                              hintText: "  Search ",
                              border: InputBorder.none),
                        )),
                    Container(
                        child: Icon(
                          Icons.compare_arrows,
                          color: Colors.white,
                        ))
                  ],
                ),
              ),
              SizedBox(height: 10),
              Expanded(
                child: ListView.builder(
                  itemCount: list.length,
                  itemBuilder: (context, index) {
                    return Column(children: <Widget>[
                      ListTile(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) => ChatItemPage(),
                            ),
                          );
                        },
                        leading: Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(100),
                            ),
                            image: DecorationImage(
                              image: ExactAssetImage("assets/images/user.jpeg"),
                            ),
                          ),
                        ),
                        title: Text(
                          list[index].contact.name,
                          style: TextStyle(
                              color: Colors.blue[900],
                              fontFamily: 'GilroyLight',
                              fontWeight: FontWeight.bold,
                              fontSize: 18
                          ),
                        ),
                        subtitle: list[index].isTyping ? Row(
                          children: <Widget>[
                            SpinKitThreeBounce(
                              color: AppColors.blueColor,
                              size: 20.0,
                            ),
                          ],
                        ) : Column(mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              list[index].lastMessage,
                              style: TextStyle(
                                  color: Colors.black54,
                                  fontFamily: 'GilroyLight',
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                            SizedBox(width: 25),
                            Text(
                              list[index].lastMessageTime + " days ago",
                              style: TextStyle(
                                color: Colors.grey,
                                fontFamily: 'GilroyLight',
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                        trailing: Icon(
                          Icons.photo_camera, color: Colors.grey[400],
                          size: 30,),
                      ),
                      SizedBox(height: 20,)
                    ],);
                  },
                ),
              ),

              SizedBox(height: 10),
             /* Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.grey[200],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      width: MediaQuery
                          .of(context)
                          .size
                          .width * .015,
                    ),
                    Container(
                      width: 70,
                      height: 81,
                      child: AvatarWidget(
                        user: deepak,
                        onTap: () => () {},
                        isLarge: true,
                        isShowingUsernameLabel: false,
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Column(
                      children: <Widget>[
                        RichText(
                          maxLines: 2,
                          text: TextSpan(
                            text: '',
                            style: DefaultTextStyle
                                .of(context)
                                .style,
                            children: <TextSpan>[
                              TextSpan(
                                text: 'Ashish Rawat',
                                style: TextStyle(
                                    fontFamily: 'GilroySemiBold',
                                    decoration: TextDecoration.none,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16,
                                    color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                        RichText(
                          maxLines: 2,
                          text: TextSpan(
                            text: '',
                            style: DefaultTextStyle
                                .of(context)
                                .style,
                            children: <TextSpan>[
                              TextSpan(
                                text: 'Active Now',
                                style: TextStyle(
                                    fontFamily: 'GilroySemiBold',
                                    decoration: TextDecoration.none,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12,
                                    color: Colors.grey),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                        height: 50,
                        width: 50,
                        child: Icon(
                          Icons.linked_camera,
                          color: Colors.grey[500],
                          size: 30,
                        )),
                    SizedBox(
                      width: 15,
                    ),
                  ],
                ),

              ),*/


            ],
          ),
          new Text("This is chat Tab View"),
        ],
        controller: _tabController,
      ),
    );
  }
}
