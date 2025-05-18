import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:lottie/lottie.dart';
import 'package:paractice_app1/Model/View/playStore.dart';

import 'package:paractice_app1/helper/constants/animation_constant.dart';

import 'package:paractice_app1/View/feedback/feedback_screen.dart';
import 'package:paractice_app1/View/infoPlus/infoplus_screen.dart';
import 'package:paractice_app1/View/photoselect/photoselect_screen.dart';
import 'package:paractice_app1/View/rating/rating_screen.dart';
import 'package:paractice_app1/View/tabbar/tabbar_screen.dart';
import 'package:share_plus/share_plus.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    PlaystoreClass controller =  Get.put(PlaystoreClass());
    return Scaffold(
      drawer: Drawer(
        backgroundColor: Colors.black,
        child: ListView(padding: EdgeInsets.zero, children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blueGrey[900],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.blueGrey,
                  child: Icon(Icons.person, color: Colors.white),
                ),
                SizedBox(height: 10),
                Text(
                  'menu'.tr,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.share,
              color: Colors.white,
            ),
            title: Text(
              'share'.tr,
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            trailing: ElevatedButton(
                onPressed: () {
                  Share.share('share_text'.tr);
                },
                child: Text('share_text'.tr)),
          ),
//           buildListTile(
//   icon: Icons.list,
//   title: 'list_in_getx'.tr,  
//   route: Routes.LIST_GETX,   
// ),
          ListTile(
            leading: Icon(
              Icons.feedback,
              color: Colors.white,
            ),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => FeedBackScreen()));
            },
            title: Text(
              'feedback'.tr,
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.rate_review,
              color: Colors.white,
            ),
            title: Text(
              'rating_box'.tr,
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=> RatingScreen()));

            },
          ),
          ListTile(
              leading:
                  const Icon(Icons.playlist_add_rounded, color: Colors.white),
              title: Text(
                'check_play_store'.tr,
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              onTap: () {
                controller.playstore();
                
              },
              ),
                ListTile(
              leading: Icon(
                Icons.tab,
                color: Colors.white,
              ),
              title: Text(
                'tab_bar'.tr,
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => TabBarScreen()));
              },
            ),
             ListTile(
            leading: Icon(
              Icons.info,
              color: Colors.white,
            ),
            title: Text(
              'get_app_info'.tr,
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            onTap: () {
               Navigator.push(context, MaterialPageRoute(builder: (context) => InfoPlusScreen()));
            },
          ),
            ListTile(
            leading: Icon(
              Icons.language,
              color: Colors.white,
            ),
            title: Text(
              'languages'.tr,
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            onTap: () {
               Get.toNamed('/language', arguments: [
                 'M',
                'Idrees',
              
               ]);
            },
          ),
          ListTile(
            leading: Icon(
              Icons.language,
              color: Colors.white,
            ),
            title: Text(
              'Hive Data'.tr,
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            onTap: () {
               Get.toNamed('/hive',);
            },
          ),
        ]),
      ),
      appBar: AppBar(
        leading: Builder(
          builder: (context) => IconButton(
            icon: Icon(Icons.menu, color: Colors.white),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),

        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'app_name'.tr,
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(
                        color: const Color.fromARGB(255, 144, 133, 33),
                      )),
                  child: Row(
                    children: [
                      Icon(
                        Icons.account_balance,
                        color: Colors.yellow,
                      ),
                      Text(
                        'go_pro'.tr,
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                )
              ],
            )
          ],
        ),

        backgroundColor: Colors.black,
      ),
      body: 
     
      ListView(padding: EdgeInsets.all(10), children: [
        Column(
          children: [
            Row(children: [
              Flexible(
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PhotoSelect(
                                  data: 'title'.tr,
                                )));
                  },
                  child: Container(
  
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(10),
    color: Color(0xFF144156),
  ),
  height: 170,
  child: Stack(
    children: [
      // Lottie animation positioned to the right
      Positioned(
        right: 0, // Align to the right
        top: 0,
        bottom: 0,
        
      
        child: Lottie.asset(
          AnimationConstant.splash_premium_anim2,
          fit: BoxFit.cover, // Ensures proper sizing
        ),
      ),
      
      // Content column
      Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10, top: 10),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundColor: Color(0xFF248DBC),
                  radius: 20,
                  child: Icon(
                    Icons.person,
                    color: Colors.white,
                  ),
                ),
                SizedBox(width: 15),
                Container(
                  width: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(
                      color: const Color.fromARGB(255, 86, 82, 82),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.fireplace_outlined,
                        color: Color(0xFFFC8915),
                      ),
                      Column(
                        children: [
                          Text(
                            'streak_count'.tr,
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'streak'.tr,
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'title'.tr,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 3),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'now_check_features'.tr,
                  style: TextStyle(
                    color: const Color.fromARGB(179, 233, 226, 226),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 3),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'score_and_rating'.tr,
                  style: TextStyle(
                    color: const Color.fromARGB(179, 233, 226, 226),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ],
  ),
),
                ),
              ),
            ]),
            SizedBox(
              height: 15,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.start, children: [
              Text(
                'most_used'.tr,
                style: TextStyle(color: Colors.white),
              )
            ]),
            SizedBox(
              height: 5,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  PhotoSelect(data: 'improve_clarity'.tr)));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color(0xFF313213), 
                        // #313213
                      ),
                      height: 170,
                      width: 250,
                      child: Padding(
                          padding: const EdgeInsets.only(left:  10, top: 10),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CircleAvatar(
                                radius: 20,
                                backgroundColor: Color(0xFF838528),
                                child: Icon(
                                  Icons.forward_5,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Padding(
                                  padding: const EdgeInsets.only(left:  10,),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      'improve_clarity'.tr,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Padding(
                                  padding: const EdgeInsets.only(left:  10),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      'make_photos_pop'.tr,
                                      style: TextStyle(
                                        color: const Color.fromARGB(
                                            179, 233, 226, 226),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Padding(
                                  padding: const EdgeInsets.only(left:  10),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'out_background'.tr,
                                      style: TextStyle(
                                        color: const Color.fromARGB(
                                            179, 233, 226, 226),
                                      ),
                                    ),
                                    Icon(
                                      Icons.directions,
                                      color: Colors.white,
                                    )
                                  ],
                                ),
                              ),
                            ]),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PhotoSelect(
                                    data: 'de_scratch'.tr,
                                  )));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color(0xff0E2E1E),
                      ),
                      height: 170,
                      width: 250,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                                padding: const EdgeInsets.only(left: 10,top: 10),
                              child: CircleAvatar(
                                radius: 20,
                                backgroundColor:
                                    Color(0xff2E7853),
                                child: Icon(
                                  Icons.line_axis_outlined,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Padding(
                                padding: const EdgeInsets.only(left:  10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    'de_scratch'.tr,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Padding(
                                padding: const EdgeInsets.only(left:  10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    'make_photos_pop'.tr,
                                    style: TextStyle(
                                      color: const Color.fromARGB(
                                          179, 233, 226, 226),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Padding(
                                padding: const EdgeInsets.only(left:  10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'out_background'.tr,
                                    style: TextStyle(
                                      color: const Color.fromARGB(
                                          179, 233, 226, 226),
                                    ),
                                  ),
                                  Icon(
                                    Icons.directions,
                                    color: Colors.white,
                                  )
                                ],
                              ),
                            ),
                          ]),
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey,
                    ),
                    height: 170,
                    width: 250,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.start, children: [
              Text(
                'popular_features'.tr,
                style: TextStyle(color: Colors.white),
              )
            ]),
            SizedBox(
              height: 5,
            ),
            Row(
              children: [
                Flexible(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PhotoSelect(
                                    data: 'enhance'.tr,
                                  )));
                    },
                    child: Container(
                      height: 270,
                      width: 260,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color(0xff101B1F),
                      ),
                      child: Stack(children: [
                        Lottie.asset(AnimationConstant.splash_premium_anim2),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: Row(
                               
                                children: [
                                  CircleAvatar(
                                    backgroundColor:
                                        Color(0xff6464CC),
                                    radius: 20,
                                    child: Icon(
                                      Icons.person,
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    'enhance'.tr,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'make_photos_pop'.tr,
                                  style: TextStyle(
                                    color: const Color.fromARGB(
                                        179, 233, 226, 226),
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'out_background'.tr,
                                  style: TextStyle(
                                    color: const Color.fromARGB(
                                        179, 233, 226, 226),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ]),
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Flexible(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  PhotoSelect(data: 'de_scratch'.tr)));
                    },
                    child: Container(
                      height: 270,
                      width: 260,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                       color: Color(0xff101B1F),
                      ),
                      child: Stack(children: [
                        Lottie.asset(AnimationConstant.splash_premium_anim2),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: Row(
                                
                                children: [
                                  CircleAvatar(
                                    backgroundColor:
                                        Color(0xffCC9157),
                                    radius: 20,
                                    child: Icon(
                                      Icons.person,
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    'de_scratch'.tr,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'make_photos_pop'.tr,
                                  style: TextStyle(
                                    color: const Color.fromARGB(
                                        179, 233, 226, 226),
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'out_background'.tr,
                                  style: TextStyle(
                                    color: const Color.fromARGB(
                                        179, 233, 226, 226),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ]),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ]),
      backgroundColor: Colors.black,
    );
  }
}
