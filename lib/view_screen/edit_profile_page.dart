import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import 'package:socialgram/view_screen/LoginScreen.dart';


class EditProfilePage extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController bioController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController genderController = TextEditingController();
  final TextEditingController numberController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  bool _isTapped2=false;

  changeProfilePhoto(BuildContext parentContext) {
    return showDialog(
      context: parentContext,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Change Profile Photo',style: TextStyle(fontFamily: 'GilroyLight'),),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(
                    'Changing your profile photo has not been implemented yet'),
              ],
            ),
          ),
        );
      },
    );
  }



  Widget buildTextField({String name,String hint, TextEditingController controller}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          name,
          style: TextStyle(color: Colors.grey[600],fontFamily: 'GilroySemiBold',fontSize: 16),
        ),
        TextField(
          controller: controller,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(color: Colors.black,fontFamily: 'GilroyLight',fontWeight: FontWeight.w900,fontSize: 14),
          ),
        ),
        SizedBox(height: 5,)
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return



      Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 16.0, bottom: 8.0),
                child:    CircleAvatar(
                  radius: 50.0,
                  backgroundImage: AssetImage(
                    'assets/images/user.jpeg',
                  ),
                ),
              ),
              FlatButton(
                  onPressed: () {
                    changeProfilePhoto(context);
                  },
                  child: Text(
                    "Change Profile  Photo",
                    style: const TextStyle(
                        color: Colors.blue,
                        fontSize: 20.0,
                        fontFamily: 'GilroySemiBold',
                        fontWeight: FontWeight.bold),
                  )),
              Padding(
                padding: const EdgeInsets.only(right:20,left:20),
                child: Column(
                  children: <Widget>[
                    buildTextField(name: "Name",hint:'Mohit Joshi', controller: nameController,),
                    buildTextField(name: "Username", hint:'mo_just_hit_you',controller: usernameController),
                    buildTextField(name: "Bio", hint:'Less Human . More Being',controller: bioController),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Align(alignment:Alignment.topLeft,child: Text('Public Business Information',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 16),)),
              ),
              Padding(
                padding: const EdgeInsets.only(left:15.0,right: 15),
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                  Text('Page ',style: TextStyle(color: Colors.black,fontFamily: 'GilroyLight',fontSize: 14,fontWeight: FontWeight.bold),),
                 Row(children: <Widget>[
                   Text('Mohit Joshi ',style: TextStyle(color: Colors.grey,fontFamily: 'GilroyLight',fontSize: 14,fontWeight: FontWeight.bold),),
                   MaterialButton(
                     shape:
                     RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
                     onPressed:  (){},
                     color: Color(0xffE97171),
                     minWidth:40,
                     padding: EdgeInsets.all(12.0),
                     child:_isTapped2?Text('Confirm',
                       style: TextStyle(fontSize: 17.0,color: Colors.white,fontFamily: 'Gilroylight',fontWeight: FontWeight.w900),
                     ):Text('Confirm',
                       style: TextStyle(fontSize: 17.0,color: Colors.white,fontFamily: 'Gilroylight',fontWeight: FontWeight.w900),
                     ),
                   ),
                 ],)

                ],),
              ),
              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.only(left:15.0,right: 15),
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('Category ',style: TextStyle(color: Colors.black,fontFamily: 'GilroyLight',fontSize: 14,fontWeight: FontWeight.bold),),
                    Text('Personal Blog ',style: TextStyle(color: Colors.grey,fontFamily: 'GilroyLight',fontSize: 14,fontWeight: FontWeight.bold),),
                  ],),
              ),
              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.only(left:15.0,right: 15),
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('Contact Options  ',style: TextStyle(color: Colors.black,fontFamily: 'GilroyLight',fontSize: 14,fontWeight: FontWeight.bold),),
                    Text('Email Address ',style: TextStyle(color: Colors.grey,fontFamily: 'GilroyLight',fontSize: 14,fontWeight: FontWeight.bold),),
                  ],),
              ),
              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.only(left:15.0,right: 15),
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('Profile Display ',style: TextStyle(color: Colors.black,fontFamily: 'GilroyLight',fontSize: 14,fontWeight: FontWeight.bold),),
                    Text('None Hidden ',style: TextStyle(color: Colors.grey,fontFamily: 'GilroyLight',fontSize: 14,fontWeight: FontWeight.bold),),
                  ],),
              ),
              Padding(
                padding: const EdgeInsets.only(top:26.0,left: 15),
                child: Align(alignment:Alignment.topLeft,child: Text('Profile Information',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 16),)),
              ),
              Padding(
                padding: const EdgeInsets.only(right:20,left:20,top: 20),
                child: Column(
                  children: <Widget>[
                    buildTextField(name: "Email Address",hint:'mohit@aeologic.com', controller: emailController,),
                    buildTextField(name: "Phone Number", hint:'9711331337',controller: numberController),
                    buildTextField(name: "Gender", hint:'Male',controller: genderController),
                  ],
                ),
              ),

              Padding(
                  padding: const EdgeInsets.only(top:26.0),
                  child: MaterialButton( onPressed: () => {
                    Navigator.push(context,
                      MaterialPageRoute(
                          builder: (context) => LoginScreen()),)
                  },
                    shape:
                    RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),

                    color: Color(0xffE97171),
                    minWidth:40,
                    padding: EdgeInsets.all(12.0),
                    child:Text('Logout',
                      style: TextStyle(fontSize: 17.0,color: Colors.white,fontFamily: 'Gilroylight',fontWeight: FontWeight.w900),
                    ),
                  )
              ),
              SizedBox(height: 30,)
            ],
          );
        }
  }



