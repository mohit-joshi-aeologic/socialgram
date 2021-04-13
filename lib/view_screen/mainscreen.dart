import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:outline_material_icons/outline_material_icons.dart';
import 'package:socialgram/utils/route_name.dart';
import 'package:socialgram/utils/utils.dart';
import 'package:socialgram/view_screen/home_feed_page.dart';
import 'package:socialgram/view_screen/notification_view.dart';
import 'package:socialgram/view_screen/profile_page.dart';
import 'package:socialgram/view_screen/search_page.dart';
import 'package:socialgram/view_screen/upload_page.dart';

class MainScreen extends StatefulWidget {
  MainScreen({Key key, /*this.auth,*/ this.userId, this.logoutCallback})
      : super(key: key);

  /*final BaseAuth auth;*/
  final VoidCallback logoutCallback;
  final String userId;
  @override
  _MainScaffoldState createState() => _MainScaffoldState();
}

class _MainScaffoldState extends State<MainScreen> {
 /* signOut() async {
    try {
      await widget.auth.signOut();
      widget.logoutCallback();
    } catch (e) {
      print(e);
    }
  }*/
  static const _kAddPhotoTabIndex = 2;
  static const _profileIndex = 4;
  int _tabSelectedIndex = 0;

  // Save the home page scrolling offset,
  // used when navigating back to the home page from another tab.
  double _lastFeedScrollOffset = 0;
  ScrollController _scrollController;

  @override
  void dispose() {
    _disposeScrollController();
    super.dispose();
  }

  void _scrollToTop() {
    if (_scrollController == null) {
      return;
    }
    _scrollController.animateTo(
      0.0,
      duration: Duration(milliseconds: 250),
      curve: Curves.decelerate,
    );
  }

  // Call this when changing the body that doesn't use a ScrollController.
  void _disposeScrollController() {
    if (_scrollController != null) {
      _lastFeedScrollOffset = _scrollController.offset;
      _scrollController.dispose();
      _scrollController = null;
    }
  }

  void _onTabTapped(BuildContext context, int index) {
/*    if (index == _kAddPhotoTabIndex) {
      showSnackbar(context, 'Add Photo');
    } else*/ if (index == _tabSelectedIndex) {
      _scrollToTop();
    } else if (index == _profileIndex){
      setState(() => _tabSelectedIndex = index);
    }
    else {
      setState(() => _tabSelectedIndex = index);
    }
  }

  Widget _buildPlaceHolderTab(String tabName) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(top: 64.0),
        child: Column(
          children: <Widget>[
            Text(
              'Oops, the $tabName tab is\n under construction!',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 28.0),
            ),
            Image.asset('assets/images/make.webp'),
          ],
        ),
      ),
    );
  }

  Widget _buildBody() {
    switch (_tabSelectedIndex) {
      case 0:
        _scrollController =
            ScrollController(initialScrollOffset: _lastFeedScrollOffset);
        return HomeFeedPage(scrollController: _scrollController);
      case 1 :
        return Search();
      case 2:
        return Uploader();
      case 3:
        return Activity();


      case 4:
        return ProfilePage();

      default:
        const tabIndexToNameMap = {
          0: 'Home',
          1: 'Search',
          2: 'Add Photo',
          3: 'Notifications',
          4: 'Profile',
        };
        _disposeScrollController();
        return _buildPlaceHolderTab(tabIndexToNameMap[_tabSelectedIndex]);
    }
  }

  // Unselected tabs are outline icons, while the selected tab should be solid.
  Widget _buildBottomNavigation() {

    const unselectedIcons = <IconData>[
      OMIcons.home,
      Icons.search,
      OMIcons.addBox,
      Icons.favorite_border,
      (Icons.person_outline),
    ];
    const selecteedIcons = <IconData>[
      Icons.home,
      Icons.search,
      Icons.add_box,
      Icons.favorite,
      Icons.person,
    ];

    final bottomNaivgationItems = List.generate(5, (int i) {
      final iconData =
      _tabSelectedIndex == i ? selecteedIcons[i] : unselectedIcons[i];
      return BottomNavigationBarItem(icon: Icon(iconData), title: Container());
    }).toList();

    return Builder(builder: (BuildContext context) {
      return BottomNavigationBar(
        iconSize: 30.0,
        unselectedItemColor: Colors.black,
        selectedItemColor: Colors.black,
        type: BottomNavigationBarType.fixed,
        items: bottomNaivgationItems,
        currentIndex: _tabSelectedIndex,
        onTap: (int i) => _onTabTapped(context, i),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:_tabSelectedIndex==3?
      AppBar(backgroundColor: Colors.grey[200], iconTheme: IconThemeData(color: Colors.black), title: Row(
        children: <Widget>[

          SizedBox(width: 6.0),
          GestureDetector(
            child: Text(
              'Activity',
              style: TextStyle(
                  fontFamily: 'GilroyLight',
                  color: Colors.black87,
                  fontWeight: FontWeight.w700,
                  fontSize: 24.0),
            ),
            onTap: _scrollToTop,
          ),
        ],
      ),):
      AppBar(
        elevation: 1.0,
        backgroundColor: Colors.grey[50],
        title: Row(
          children: <Widget>[
          /*  Builder(builder: (BuildContext context) {
              return GestureDetector(
                child: Icon(OMIcons.cameraAlt, color: Colors.black, size: 32.0),
                onTap: () => showSnackbar(context, 'Add Photo'),
              );
            }),
            SizedBox(width: 12.0),*/
            GestureDetector(
              child: Center(
                child: Text(
                  'Socialgram',
                  style: TextStyle(
                      fontFamily: 'Billabong',
                      color: Colors.black,
                      fontSize: 32.0),
                ),
              ),
              onTap: _scrollToTop,
            ),
          ],
        ),
        actions: <Widget>[
          Builder(builder: (BuildContext context) {
            return IconButton(
              color: Colors.black,
              icon: Icon(OMIcons.liveTv),
              onPressed: () => showSnackbar(context, 'Live TV'),
            );
          }),
          Builder(builder: (BuildContext context) {
            return IconButton(
                color: Colors.black,
                icon: Icon(OMIcons.nearMe),
                onPressed: () =>
                    Navigator.of(context).pushNamed(RouteName.DirectMessage)

            );
          }),
        ],
      ),
      body: _buildBody(),
      bottomNavigationBar: _buildBottomNavigation(),
    );
  }
}