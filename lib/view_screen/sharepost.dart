import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:socialgram/utils/utils.dart';

import 'mainscreen.dart';

class SharePost extends StatefulWidget {
  @override
  _SharePostState createState() => _SharePostState();
}

class _SharePostState extends State<SharePost> {
  bool isSwitched = false;
  bool isSwitched1 = false;
  bool isSwitched2 = false;

  List<String> litems = ["Nainital","Almora","Mukteshwar","Jalna"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 10,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
              size: 30,
            ),
            onPressed: () {
              Navigator.maybePop(context);
            },
          ),
          title: Text(
            'New Post',
            style: TextStyle(color: Colors.black),
          ),
          actions: <Widget>[
            Center(
              child: InkWell(onTap: (){

                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => MainScreen()),
                );
              },
                child: Text(
                  'Share',
                  style: TextStyle(color: Colors.blue, fontSize: 20),
                ),
              ),
            ),
            SizedBox(
              width: 15,
            )
          ],
          backgroundColor: Colors.grey[100],
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(
                      right: 20.0, left: 20, top: 10, bottom: 0),
                  child: Row(
                    children: <Widget>[
                      Container(
                        height: 80,
                        width: 60,
                        child: Image.asset('assets/images/username.jpeg'),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Expanded(
                          child: TextFormField(
                        decoration: const InputDecoration(
                          icon: Icon(
                            Icons.wb_incandescent,
                            size: 20,
                          ),
                          hintText: 'Write a Caption',
                          labelText: 'Write a Caption',
                        ),
                        onSaved: (String value) {
                          // This optional block of code can be used to run
                          // code when the user saves the form.
                        },
                        validator: (String value) {
                          return value.contains('@')
                              ? 'Do not use the @ char.'
                              : null;
                        },
                      ))
                    ],
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.only(right: 20.0, left: 20, top: 0),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        icon: Icon(
                          Icons.perm_identity,
                          size: 20,
                        ),
                        hintText: 'Tag People',
                        labelText: 'Tag People',
                      ),
                      onSaved: (String value) {
                        // This optional block of code can be used to run
                        // code when the user saves the form.
                      },
                      validator: (String value) {
                        return value.contains('@')
                            ? 'Do not use the @ char.'
                            : null;
                      },
                    )),
                Padding(
                    padding: const EdgeInsets.only(right: 20.0, left: 20, top: 0),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        icon: Icon(
                          Icons.edit_location,
                          size: 20,
                        ),
                        hintText: 'Add Location',
                        labelText: 'Add Location',
                      ),
                      onSaved: (String value) {
                        // This optional block of code can be used to run
                        // code when the user saves the form.
                      },
                      validator: (String value) {
                        return value.contains('@')
                            ? 'Do not use the @ char.'
                            : null;
                      },
                    )),
                Container( margin: EdgeInsets.symmetric(vertical: 20.0),
                  height: 40.0,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: litems.length,
                      itemBuilder: (BuildContext ctxt, int index) {
                        return Row(
                          children: <Widget>[
                            SizedBox(width: 15,),
                            Container(
                              width: 100.0,
                              child: Center(
                                  child: Text(
                                    litems[index],
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                        fontFamily: 'GilroyLight'),
                                  )),
                              color: Colors.blue[200],
                            ),

                          ],
                        );

                      }
                  ),
                ),
               /* Container(
                  margin: EdgeInsets.symmetric(vertical: 20.0),
                  height: 40.0,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      SizedBox(
                        width: 20,
                      ),
                      Container(
                        width: 100.0,
                        child: Center(
                            child: Text(
                          'Nainital',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              fontFamily: 'GilroyLight'),
                        )),
                        color: Colors.blue[200],
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Container(
                        width: 100.0,
                        child: Center(
                            child: Text(
                          'Almora',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              fontFamily: 'GilroyLight'),
                        )),
                        color: Colors.blue[200],
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Container(
                        width: 100.0,
                        child: Center(
                            child: Text(
                          'Mukteshwar',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              fontFamily: 'GilroyLight'),
                        )),
                        color: Colors.blue[200],
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Container(
                        width: 100.0,
                        child: Center(
                            child: Text(
                          'Bhimtal',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              fontFamily: 'GilroyLight'),
                        )),
                        color: Colors.blue[200],
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Container(
                        width: 100.0,
                        child: Center(
                            child: Text(
                          'Jalna',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              fontFamily: 'GilroyLight'),
                        )),
                        color: Colors.blue[200],
                      ),
                      SizedBox(
                        width: 20,
                      ),
                    ],
                  ),
                ),*/
                Padding(
                  padding: const EdgeInsets.only(left: 18.0),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Also Post To ',
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'GilroyLight',
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      )),
                ),
                SizedBox(height: 10,),

                Padding(
                  padding: const EdgeInsets.only(right:15,left:15),
                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text('Facebook',style: TextStyle(fontFamily: 'GilroyLight',fontSize: 20),),
                      Switch(
                        value: isSwitched,
                        onChanged: (value){
                          setState(() {
                            isSwitched=value;
                            print(isSwitched);
                          });
                        },
                        activeTrackColor: Colors.lightGreenAccent,
                        activeColor: Colors.green,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right:15,left:15),
                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text('Tumblr',style: TextStyle(fontFamily: 'GilroyLight',fontSize: 20),),
                      Switch(
                        value: isSwitched1,
                        onChanged: (value){
                          setState(() {
                            isSwitched1=value;
                            print(isSwitched1);
                          });
                        },
                        activeTrackColor: Colors.lightGreenAccent,
                        activeColor: Colors.green,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right:15,left:15),
                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text('Twitter',style: TextStyle(fontFamily: 'GilroyLight',fontSize: 20),),
                      Switch(
                        value: isSwitched2,
                        onChanged: (value){
                          setState(() {
                            isSwitched2=value;
                            print(isSwitched2);
                          });
                        },
                        activeTrackColor: Colors.lightGreenAccent,
                        activeColor: Colors.green,
                      ),
                    ],
                  ),
                ),
               Container(height: .4,color: Colors.grey,),
                SizedBox(height: 15,),
                Text('Advanced Settings',style: TextStyle(fontFamily: 'GilroyLight',fontSize: 20,color: Color(0xffE97171)),),

              ],
            ),
          ),
        ));
  }
}
