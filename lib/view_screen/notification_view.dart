import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:socialgram/models/todo.dart';
import 'package:socialgram/widget/avatar_widget.dart';

class Activity extends StatefulWidget {
  @override
  _ActivityState createState() => _ActivityState();
}

class _ActivityState extends State<Activity> {
  bool _isTapped =false;
  bool _isTapped1 =false;
  bool _isTapped2=false;
  bool _isTapped3=false;
  bool _isTapped4=false;
  bool _isTapped5=false;
  bool _isTapped6=false;
  bool _isTapped7 =false;
  bool _isTapped8 =false;
  bool _isTapped9 =false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(physics: BouncingScrollPhysics(),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: MediaQuery.of(context).size.height * .02,
            ),
            Container(
              color: Colors.grey[100],
              height: MediaQuery.of(context).size.height * .08,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    width: 20,
                  ),
                  Image.asset(
                    'assets/images/down-arrows.png',
                    scale: 18,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Promotions',
                        style: TextStyle(
                            fontFamily: 'GilroySemiBold',
                            fontSize: 18,
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      Text(
                        'Recent activity from your promotions',
                        style: TextStyle(
                            fontFamily: 'GilroyLight',
                            color: Colors.blueGrey,
                            fontWeight: FontWeight.w600,
                            fontSize: 14),
                      ),
                    ],
                  )
                ],
              ),
            ),

            Divider(
              color: Colors.grey[400],
            ),

            Container(
              color: Colors.grey[100],
              height: MediaQuery.of(context).size.height * .17,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: <Widget>[
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        'Today',
                        style: TextStyle(
                            fontFamily: 'GilroySemiBold',
                            fontWeight: FontWeight.w600,
                            fontSize: 19),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 20.0, left: 20),
                    child: Row(
                      children: <Widget>[
                        AvatarWidget(
                          user: mohit,
                          onTap: () => () {},
                          isLarge: true,
                          isShowingUsernameLabel: false,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Flexible(
                          child: RichText(
                            maxLines: 5,
                            text: TextSpan(
                              text: '',
                              style: DefaultTextStyle.of(context).style,
                              children: <TextSpan>[
                                TextSpan(
                                  text: 'You have an unread message\n from ',
                                  style: TextStyle(fontSize: 14,
                                      fontFamily: 'GilroyLight',
                                      fontWeight: FontWeight.w600),
                                ),
                                TextSpan(
                                    text: '@ashishrawat2911. ',
                                    style: TextStyle(
                                      color: Colors.blue,
                                      fontFamily: 'GilroyLight',
                                      fontWeight: FontWeight.bold,
                                    )),
                                TextSpan(
                                    text: " 3h ",
                                    style: TextStyle(fontWeight: FontWeight.w900,
                                      color: Colors.grey[400],
                                      fontFamily: 'GilroyLight',
                                    )),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: <Widget>[
                SizedBox(
                  width: 20,
                ),
                Text(
                  'This Month',
                  style: TextStyle(
                      fontFamily: 'GilroySemiBold',
                      fontWeight: FontWeight.w600,
                      fontSize: 19),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.start,crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  width: MediaQuery.of(context).size.width*.015,
                ),
                Container(
                  width: 80,
                  height: 81,
                  child: AvatarWidget(
                    user: mohit12,
                    onTap: () => () {},
                    isLarge: true,
                    isShowingUsernameLabel: false,
                  ),
                ),
                SizedBox(
                  width: 5,
                ),

                Flexible(
                  child: RichText(
                    maxLines: 5,
                    text: TextSpan(
                      text: '',
                      style: DefaultTextStyle.of(context).style,
                      children: <TextSpan>[
                        TextSpan(
                          text: 'the.anamika',
                          style: TextStyle( fontFamily: 'GilroySemiBold',
                            fontWeight: FontWeight.w500,fontSize: 16
                          ),
                        ),
                        TextSpan(text: ' replied to your comment on ',style: TextStyle(fontFamily: 'GilroyLight',fontWeight: FontWeight.w700)),
                        TextSpan(
                          text: 'the.dappered ',
                          style: TextStyle( fontFamily: 'GilroySemiBold',
                              fontWeight: FontWeight.w500,fontSize: 16
                          ),
                        ),
                        TextSpan(text: "'s post ",style: TextStyle(fontFamily: 'GilroyLight',fontWeight: FontWeight.w700)),
                        TextSpan(
                            text: '@mo_just_hit_you',
                            style: TextStyle(fontFamily: 'GilroyLight',fontWeight: FontWeight.w700,color: Colors.blue)),
                        TextSpan(text: "  achaa 😪 😫 😴 😌 😛",style: TextStyle(fontFamily: 'GilroyLight',fontWeight: FontWeight.w700)),
                        TextSpan(text: " . 22h",style: TextStyle(fontFamily: 'GilroyLight',fontWeight: FontWeight.w700,color: Colors.grey)),
                      ],
                    ),
                  ),
                ),

                SizedBox(
                  width: 10,
                ),
                Container(
                    height: 50,
                    width: 50,
                    child: Image.asset('assets/images/postphoto.jpeg')),
                SizedBox(
                  width: 15,
                ),
              ],
            ),

            SizedBox(
              height: 5,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.start,crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  width: MediaQuery.of(context).size.width*.015,
                ),
                Container(
                  width: 80,
                  height: 81,
                  child: AvatarWidget(
                    user: mohit,
                    onTap: () => () {},
                    isLarge: true,
                    isShowingUsernameLabel: false,
                  ),
                ),
                SizedBox(
                  width: 5,
                ),

                Flexible(
                  child: RichText(
                    maxLines: 5,
                    text: TextSpan(
                      text: '',
                      style: DefaultTextStyle.of(context).style,
                      children: <TextSpan>[
                        TextSpan(
                          text: 'shubhirawat23',
                          style: TextStyle( fontFamily: 'GilroySemiBold',
                              fontWeight: FontWeight.w500,fontSize: 16
                          ),
                        ),
                        TextSpan(text: ' replied to your comment on ',style: TextStyle(fontFamily: 'GilroyLight',fontWeight: FontWeight.w700)),
                        TextSpan(
                          text: 'the.kartik ',
                          style: TextStyle( fontFamily: 'GilroySemiBold',
                              fontWeight: FontWeight.w500,fontSize: 16
                          ),
                        ),
                        TextSpan(text: "'s post ",style: TextStyle(fontFamily: 'GilroyLight',fontWeight: FontWeight.w700)),
                        TextSpan(
                            text: '@mo_just_hit_you',
                            style: TextStyle(fontFamily: 'GilroyLight',fontWeight: FontWeight.w700,color: Colors.blue)),
                        TextSpan(text: "  see 😪 😫 😴 😌 😛",style: TextStyle(fontFamily: 'GilroyLight',fontWeight: FontWeight.w700)),
                        TextSpan(text: " . 12h",style: TextStyle(fontFamily: 'GilroyLight',fontWeight: FontWeight.w700,color: Colors.grey)),
                      ],
                    ),
                  ),
                ),

                SizedBox(
                  width: 10,
                ),
                Container(
                    height: 50,
                    width: 50,
                    child: Image.asset('assets/images/on6.jpeg')),
                SizedBox(
                  width: 15,
                ),
              ],
            ),

            SizedBox(
              height: 5,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.start,crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  width: MediaQuery.of(context).size.width*.015,
                ),
                Container(
                  width: 80,
                  height: 81,
                  child: AvatarWidget(
                    user: akshay,
                    onTap: () => () {},
                    isLarge: true,
                    isShowingUsernameLabel: false,
                  ),
                ),
                SizedBox(
                  width: 5,
                ),

                Flexible(
                  child: RichText(
                    maxLines: 5,
                    text: TextSpan(
                      text: '',
                      style: DefaultTextStyle.of(context).style,
                      children: <TextSpan>[
                        TextSpan(
                          text: 'the.anamika',
                          style: TextStyle( fontFamily: 'GilroySemiBold',
                              fontWeight: FontWeight.w500,fontSize: 16
                          ),
                        ),
                        TextSpan(text: ' replied to your comment on ',style: TextStyle(fontFamily: 'GilroyLight',fontWeight: FontWeight.w700)),
                        TextSpan(
                          text: 'the.dappered ',
                          style: TextStyle( fontFamily: 'GilroySemiBold',
                              fontWeight: FontWeight.w500,fontSize: 16
                          ),
                        ),
                        TextSpan(text: "'s post ",style: TextStyle(fontFamily: 'GilroyLight',fontWeight: FontWeight.w700)),
                        TextSpan(
                            text: '@mo_just_hit_you',
                            style: TextStyle(fontFamily: 'GilroyLight',fontWeight: FontWeight.w700,color: Colors.blue)),
                        TextSpan(text: "  achaa 😪 😫 😴 😌 😛",style: TextStyle(fontFamily: 'GilroyLight',fontWeight: FontWeight.w700)),
                        TextSpan(text: " . 22h",style: TextStyle(fontFamily: 'GilroyLight',fontWeight: FontWeight.w700,color: Colors.grey)),
                      ],
                    ),
                  ),
                ),

                SizedBox(
                  width: 10,
                ),
                Container(
                    height: 50,
                    width: 50,
                    child: Image.asset('assets/images/on10.jpeg',fit: BoxFit.fitHeight,)),
                SizedBox(
                  width: 15,
                ),
              ],
            ),
            SizedBox(
              height: 5,
            ),

            Row(
              children: <Widget>[
                SizedBox(
                  width: 20,
                ),
                Text(
                  'Earlier',
                  style: TextStyle(
                      fontFamily: 'GilroySemiBold',
                      fontWeight: FontWeight.w600,
                      fontSize: 19),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.start,crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  width: MediaQuery.of(context).size.width*.015,
                ),
                Container(
                  width: 80,
                  height: 81,
                  child: AvatarWidget(
                    user: mohit12,
                    onTap: () => () {},
                    isLarge: true,
                    isShowingUsernameLabel: false,
                  ),
                ),
                SizedBox(
                  width: 5,
                ),

                Flexible(
                  child: RichText(
                    maxLines: 5,
                    text: TextSpan(
                      text: '',
                      style: DefaultTextStyle.of(context).style,
                      children: <TextSpan>[
                        TextSpan(
                          text: 'the.anamika',
                          style: TextStyle( fontFamily: 'GilroySemiBold',
                              fontWeight: FontWeight.w500,fontSize: 16
                          ),
                        ),
                        TextSpan(text: ' replied to your comment on ',style: TextStyle(fontFamily: 'GilroyLight',fontWeight: FontWeight.w700)),
                        TextSpan(
                          text: 'the.dappered ',
                          style: TextStyle( fontFamily: 'GilroySemiBold',
                              fontWeight: FontWeight.w500,fontSize: 16
                          ),
                        ),
                        TextSpan(text: "'s post ",style: TextStyle(fontFamily: 'GilroyLight',fontWeight: FontWeight.w700)),
                        TextSpan(
                            text: '@mo_just_hit_you',
                            style: TextStyle(fontFamily: 'GilroyLight',fontWeight: FontWeight.w700,color: Colors.blue)),
                        TextSpan(text: "  achaa 😪 😫 😴 😌 😛",style: TextStyle(fontFamily: 'GilroyLight',fontWeight: FontWeight.w700)),
                        TextSpan(text: " . 22h",style: TextStyle(fontFamily: 'GilroyLight',fontWeight: FontWeight.w700,color: Colors.grey)),
                      ],
                    ),
                  ),
                ),

                SizedBox(
                  width: 10,
                ),
                Container(
                    height: 50,
                    width: 50,
                    child: Image.asset('assets/images/postphoto.jpeg')),
                SizedBox(
                  width: 15,
                ),
              ],
            ),

            SizedBox(
              height: 5,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.start,crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  width: MediaQuery.of(context).size.width*.015,
                ),
                Container(
                  width: 80,
                  height: 81,
                  child: AvatarWidget(
                    user: mohit,
                    onTap: () => () {},
                    isLarge: true,
                    isShowingUsernameLabel: false,
                  ),
                ),
                SizedBox(
                  width: 5,
                ),

                Flexible(
                  child: RichText(
                    maxLines: 5,
                    text: TextSpan(
                      text: '',
                      style: DefaultTextStyle.of(context).style,
                      children: <TextSpan>[
                        TextSpan(
                          text: 'shubhirawat23',
                          style: TextStyle( fontFamily: 'GilroySemiBold',
                              fontWeight: FontWeight.w500,fontSize: 16
                          ),
                        ),
                        TextSpan(text: ' replied to your comment on ',style: TextStyle(fontFamily: 'GilroyLight',fontWeight: FontWeight.w700)),
                        TextSpan(
                          text: 'the.kartik ',
                          style: TextStyle( fontFamily: 'GilroySemiBold',
                              fontWeight: FontWeight.w500,fontSize: 16
                          ),
                        ),
                        TextSpan(text: "'s post ",style: TextStyle(fontFamily: 'GilroyLight',fontWeight: FontWeight.w700)),
                        TextSpan(
                            text: '@mo_just_hit_you',
                            style: TextStyle(fontFamily: 'GilroyLight',fontWeight: FontWeight.w700,color: Colors.blue)),
                        TextSpan(text: "  see 😪 😫 😴 😌 😛",style: TextStyle(fontFamily: 'GilroyLight',fontWeight: FontWeight.w700)),
                        TextSpan(text: " . 12h",style: TextStyle(fontFamily: 'GilroyLight',fontWeight: FontWeight.w700,color: Colors.grey)),
                      ],
                    ),
                  ),
                ),

                SizedBox(
                  width: 10,
                ),
                Container(
                    height: 50,
                    width: 50,
                    child: Image.asset('assets/images/on6.jpeg')),
                SizedBox(
                  width: 15,
                ),
              ],
            ),

            SizedBox(
              height: 5,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.start,crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  width: MediaQuery.of(context).size.width*.015,
                ),
                Container(
                  width: 80,
                  height: 81,
                  child: AvatarWidget(
                    user: akshay,
                    onTap: () => () {},
                    isLarge: true,
                    isShowingUsernameLabel: false,
                  ),
                ),
                SizedBox(
                  width: 5,
                ),

                Flexible(
                  child: RichText(
                    maxLines: 5,
                    text: TextSpan(
                      text: '',
                      style: DefaultTextStyle.of(context).style,
                      children: <TextSpan>[
                        TextSpan(
                          text: 'the.anamika',
                          style: TextStyle( fontFamily: 'GilroySemiBold',
                              fontWeight: FontWeight.w500,fontSize: 16
                          ),
                        ),
                        TextSpan(text: ' replied to your comment on ',style: TextStyle(fontFamily: 'GilroyLight',fontWeight: FontWeight.w700)),
                        TextSpan(
                          text: 'the.dappered ',
                          style: TextStyle( fontFamily: 'GilroySemiBold',
                              fontWeight: FontWeight.w500,fontSize: 16
                          ),
                        ),
                        TextSpan(text: "'s post ",style: TextStyle(fontFamily: 'GilroyLight',fontWeight: FontWeight.w700)),
                        TextSpan(
                            text: '@mo_just_hit_you',
                            style: TextStyle(fontFamily: 'GilroyLight',fontWeight: FontWeight.w700,color: Colors.blue)),
                        TextSpan(text: "  achaa 😪 😫 😴 😌 😛",style: TextStyle(fontFamily: 'GilroyLight',fontWeight: FontWeight.w700)),
                        TextSpan(text: " . 22h",style: TextStyle(fontFamily: 'GilroyLight',fontWeight: FontWeight.w700,color: Colors.grey)),
                      ],
                    ),
                  ),
                ),

                SizedBox(
                  width: 10,
                ),
                Container(
                    height: 50,
                    width: 50,
                    child: Image.asset('assets/images/on10.jpeg',fit: BoxFit.fitHeight,)),
                SizedBox(
                  width: 15,
                ),
              ],
            ),
            SizedBox(
              height: 5,
            ),

            SizedBox(
              height: 10,
            ),
            Row(
              children: <Widget>[
                SizedBox(
                  width: 20,
                ),
                Text(
                  'Suggestions for you',
                  style: TextStyle(
                      fontFamily: 'GilroySemiBold',
                      fontWeight: FontWeight.w600,
                      fontSize: 19),
                ),
              ],
            ),

            SizedBox(
              height: 5,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  width: MediaQuery.of(context).size.width*.015,
                ),
                Container(
                  width: 80,
                  height: 81,
                  child: AvatarWidget(
                    user: akshay,
                    onTap: () => () {},
                    isLarge: true,
                    isShowingUsernameLabel: false,
                  ),
                ),
                SizedBox(
                  width: 5,
                ),

                Flexible(
                  child: RichText(
                    maxLines: 5,
                    text: TextSpan(
                      text: '',
                      style: DefaultTextStyle.of(context).style,
                      children: <TextSpan>[
                        TextSpan(
                          text: '\n spoofscapes',
                          style: TextStyle( fontFamily: 'GilroySemiBold',
                              fontWeight: FontWeight.w900,fontSize: 16
                          ),
                        ),

                        TextSpan(text: "\n Indian Documentaries",style: TextStyle(fontFamily: 'GilroyLight',fontWeight: FontWeight.w700)),
                        TextSpan(text: "\n New to Instagram",style: TextStyle(fontFamily: 'GilroyLight',fontWeight: FontWeight.w700,color: Colors.grey)),
                      ],
                    ),
                  ),
                ),

                SizedBox(
                  width: 40,
                ),
                MaterialButton(
                  shape:
                  RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
                  onPressed: (){
                    setState(() {
                    _isTapped2=!_isTapped2;
                  });
                  },
                  color: _isTapped2?Colors.blue:Color(0xffE97171),
                  minWidth:40,
                  padding: EdgeInsets.all(12.0),
                  child:_isTapped2?Text('Followed',
                    style: TextStyle(fontSize: 17.0,color: Colors.white,fontFamily: 'Gilroylight',fontWeight: FontWeight.w900),
                  ):Text('Follow',
                    style: TextStyle(fontSize: 17.0,color: Colors.white,fontFamily: 'Gilroylight',fontWeight: FontWeight.w900),
                  ),
                ),

                SizedBox(
                  width: 15,
                ),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  width: MediaQuery.of(context).size.width*.015,
                ),
                Container(
                  width: 80,
                  height: 81,
                  child: AvatarWidget(
                    user: mohit,
                    onTap: () => () {},
                    isLarge: true,
                    isShowingUsernameLabel: false,
                  ),
                ),
                SizedBox(
                  width: 5,
                ),

                Flexible(
                  child: RichText(
                    maxLines: 5,
                    text: TextSpan(
                      text: '',
                      style: DefaultTextStyle.of(context).style,
                      children: <TextSpan>[
                        TextSpan(
                          text: '\n comedytalkies',
                          style: TextStyle( fontFamily: 'GilroySemiBold',
                              fontWeight: FontWeight.w900,fontSize: 16
                          ),
                        ),

                        TextSpan(text: "\n comic standup",style: TextStyle(fontFamily: 'GilroyLight',fontWeight: FontWeight.w700)),
                        TextSpan(text: "\n New to Instagram",style: TextStyle(fontFamily: 'GilroyLight',fontWeight: FontWeight.w700,color: Colors.grey)),
                      ],
                    ),
                  ),
                ),

                SizedBox(
                  width: 40,
                ),
                MaterialButton(
                  shape:
                  RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
                  onPressed: (){  setState(() {
                    _isTapped3=!_isTapped3;
                  });
                  },
                  color:_isTapped3?Colors.blue:Color(0xffE97171),
                  minWidth:40,
                  padding: EdgeInsets.all(12.0),
                  child:_isTapped3?Text('Followed',
                    style: TextStyle(fontSize: 17.0,color: Colors.white,fontFamily: 'Gilroylight',fontWeight: FontWeight.w900),
                  ):Text('Follow',
                    style: TextStyle(fontSize: 17.0,color: Colors.white,fontFamily: 'Gilroylight',fontWeight: FontWeight.w900),
                  ),
                ),

                SizedBox(
                  width: 15,
                ),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  width: MediaQuery.of(context).size.width*.015,
                ),
                Container(
                  width: 80,
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

                Flexible(
                  child: RichText(
                    maxLines: 5,
                    text: TextSpan(
                      text: '',
                      style: DefaultTextStyle.of(context).style,
                      children: <TextSpan>[
                        TextSpan(
                          text: '\n Canvas club',
                          style: TextStyle( fontFamily: 'GilroySemiBold',
                              fontWeight: FontWeight.w900,fontSize: 16
                          ),
                        ),

                        TextSpan(text: "\n Indian Documentaries",style: TextStyle(fontFamily: 'GilroyLight',fontWeight: FontWeight.w700)),
                        TextSpan(text: "\n New to Instagram",style: TextStyle(fontFamily: 'GilroyLight',fontWeight: FontWeight.w700,color: Colors.grey)),
                      ],
                    ),
                  ),
                ),

                SizedBox(
                  width: 40,
                ),
                MaterialButton(
                  shape:
                  RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
                  onPressed: (){  setState(() {
                    _isTapped4=!_isTapped4;
                  });
                  },
                  color: _isTapped4?Colors.blue:Color(0xffE97171),
                  minWidth:40,
                  padding: EdgeInsets.all(12.0),
                  child:_isTapped4?Text('Followed',
                    style: TextStyle(fontSize: 17.0,color: Colors.white,fontFamily: 'Gilroylight',fontWeight: FontWeight.w900),
                  ):Text('Follow',
                    style: TextStyle(fontSize: 17.0,color: Colors.white,fontFamily: 'Gilroylight',fontWeight: FontWeight.w900),
                  ),
                ),

                SizedBox(
                  width: 15,
                ),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  width: MediaQuery.of(context).size.width*.015,
                ),
                Container(
                  width: 80,
                  height: 81,
                  child: AvatarWidget(
                    user: mohit12,
                    onTap: () => () {},
                    isLarge: true,
                    isShowingUsernameLabel: false,
                  ),
                ),
                SizedBox(
                  width: 5,
                ),

                Flexible(
                  child: RichText(
                    maxLines: 5,
                    text: TextSpan(
                      text: '',
                      style: DefaultTextStyle.of(context).style,
                      children: <TextSpan>[
                        TextSpan(
                          text: '\n spoofscapes',
                          style: TextStyle( fontFamily: 'GilroySemiBold',
                              fontWeight: FontWeight.w900,fontSize: 16
                          ),
                        ),

                        TextSpan(text: "\n Indian Documentaries",style: TextStyle(fontFamily: 'GilroyLight',fontWeight: FontWeight.w700)),
                        TextSpan(text: "\n New to Instagram",style: TextStyle(fontFamily: 'GilroyLight',fontWeight: FontWeight.w700,color: Colors.grey)),
                      ],
                    ),
                  ),
                ),

                SizedBox(
                  width: 40,
                ),
                MaterialButton(
                  shape:
                  RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
                  onPressed: (){  setState(() {
                    _isTapped5=!_isTapped5;
                  });
                  },
                  color: _isTapped5?Colors.blue:Color(0xffE97171),
                  minWidth:40,
                  padding: EdgeInsets.all(12.0),
                  child:_isTapped5?Text('Followed',
                    style: TextStyle(fontSize: 17.0,color: Colors.white,fontFamily: 'Gilroylight',fontWeight: FontWeight.w900),
                  ):Text('Follow',
                    style: TextStyle(fontSize: 17.0,color: Colors.white,fontFamily: 'Gilroylight',fontWeight: FontWeight.w900),
                  ),
                ),

                SizedBox(
                  width: 15,
                ),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  width: MediaQuery.of(context).size.width*.015,
                ),
                Container(
                  width: 80,
                  height: 81,
                  child: AvatarWidget(
                    user: aditya,
                    onTap: () => () {},
                    isLarge: true,
                    isShowingUsernameLabel: false,
                  ),
                ),
                SizedBox(
                  width: 5,
                ),

                Flexible(
                  child: RichText(
                    maxLines: 5,
                    text: TextSpan(
                      text: '',
                      style: DefaultTextStyle.of(context).style,
                      children: <TextSpan>[
                        TextSpan(
                          text: '\n spoofscapes',
                          style: TextStyle( fontFamily: 'GilroySemiBold',
                              fontWeight: FontWeight.w900,fontSize: 16
                          ),
                        ),

                        TextSpan(text: "\n Indian Documentaries",style: TextStyle(fontFamily: 'GilroyLight',fontWeight: FontWeight.w700)),
                        TextSpan(text: "\n New to Instagram",style: TextStyle(fontFamily: 'GilroyLight',fontWeight: FontWeight.w700,color: Colors.grey)),
                      ],
                    ),
                  ),
                ),

                SizedBox(
                  width: 40,
                ),
                MaterialButton(
                  shape:
                  RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
                  onPressed: (){  setState(() {
                    _isTapped6=!_isTapped6;
                  });
                  },
                  color: _isTapped6?Colors.blue:Color(0xffE97171),
                  minWidth:40,
                  padding: EdgeInsets.all(12.0),
                  child:_isTapped6?Text('Followed',
                    style: TextStyle(fontSize: 17.0,color: Colors.white,fontFamily: 'Gilroylight',fontWeight: FontWeight.w900),
                  ):Text('Follow',
                    style: TextStyle(fontSize: 17.0,color: Colors.white,fontFamily: 'Gilroylight',fontWeight: FontWeight.w900),
                  ),
                ),

                SizedBox(
                  width: 15,
                ),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  width: MediaQuery.of(context).size.width*.015,
                ),
                Container(
                  width: 80,
                  height: 81,
                  child: AvatarWidget(
                    user: shaiq,
                    onTap: () => () {},
                    isLarge: true,
                    isShowingUsernameLabel: false,
                  ),
                ),
                SizedBox(
                  width: 5,
                ),

                Flexible(
                  child: RichText(
                    maxLines: 5,
                    text: TextSpan(
                      text: '',
                      style: DefaultTextStyle.of(context).style,
                      children: <TextSpan>[
                        TextSpan(
                          text: '\n spoofscapes',
                          style: TextStyle( fontFamily: 'GilroySemiBold',
                              fontWeight: FontWeight.w900,fontSize: 16
                          ),
                        ),

                        TextSpan(text: "\n Indian Documentaries",style: TextStyle(fontFamily: 'GilroyLight',fontWeight: FontWeight.w700)),
                        TextSpan(text: "\n New to Instagram",style: TextStyle(fontFamily: 'GilroyLight',fontWeight: FontWeight.w700,color: Colors.grey)),
                      ],
                    ),
                  ),
                ),

                SizedBox(
                  width: 40,
                ),
                MaterialButton(
                  shape:
                  RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
                  onPressed: (){  setState(() {
                    _isTapped7=!_isTapped7;
                  });
                  },
                  color: _isTapped7?Colors.blue:Color(0xffE97171),
                  minWidth:40,
                  padding: EdgeInsets.all(12.0),
                  child:_isTapped7?Text('Followed',
                    style: TextStyle(fontSize: 17.0,color: Colors.white,fontFamily: 'Gilroylight',fontWeight: FontWeight.w900),
                  ):Text('Follow',
                    style: TextStyle(fontSize: 17.0,color: Colors.white,fontFamily: 'Gilroylight',fontWeight: FontWeight.w900),
                  ),
                ),

                SizedBox(
                  width: 15,
                ),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  width: MediaQuery.of(context).size.width*.015,
                ),
                Container(
                  width: 80,
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

                Flexible(
                  child: RichText(
                    maxLines: 5,
                    text: TextSpan(
                      text: '',
                      style: DefaultTextStyle.of(context).style,
                      children: <TextSpan>[
                        TextSpan(
                          text: '\n moneyheist',
                          style: TextStyle( fontFamily: 'GilroySemiBold',
                              fontWeight: FontWeight.w900,fontSize: 16
                          ),
                        ),

                        TextSpan(text: "\n spoof comedies",style: TextStyle(fontFamily: 'GilroyLight',fontWeight: FontWeight.w700)),
                        TextSpan(text: "\n Follows you",style: TextStyle(fontFamily: 'GilroyLight',fontWeight: FontWeight.w700,color: Colors.grey)),
                      ],
                    ),
                  ),
                ),

                SizedBox(
                  width: 40,
                ),
                MaterialButton(
                  shape:
                  RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
                  onPressed: (){  setState(() {
                    _isTapped8=!_isTapped8;
                  });
                  },
                  color: _isTapped8?Colors.blue:Color(0xffE97171),
                  minWidth:40,
                  padding: EdgeInsets.all(12.0),
                  child:_isTapped8?Text('Followed',
                    style: TextStyle(fontSize: 17.0,color: Colors.white,fontFamily: 'Gilroylight',fontWeight: FontWeight.w900),
                  ):Text('Follow',
                    style: TextStyle(fontSize: 17.0,color: Colors.white,fontFamily: 'Gilroylight',fontWeight: FontWeight.w900),
                  ),
                ),

                SizedBox(
                  width: 15,
                ),
              ],
            ),



          ],
        ),
      ),
    );
  }
}
