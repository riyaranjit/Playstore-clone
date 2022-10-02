// ignore_for_file: unnecessary_string_interpolations

import 'package:flutter/material.dart';
import 'package:playstore/common/datasearch.dart';
import 'package:playstore/helpers/utils.dart';
import 'dart:math' as math;

import 'package:playstore/models/appDataModel.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({required this.title});

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  int index = 0;
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(initialIndex: 0, length: 4, vsync: this);
    List<AppDataModel> apps = Utils.getMockedCategories();
    checkType(apps);
  }

  double getHeight() {
    return 800;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: false,
      body: SafeArea(
        child: Stack(
          children: [
            DefaultTabController(
              initialIndex: 1,
              length: 4,
              child: NestedScrollView(
                headerSliverBuilder: (context, value) {
                  return [
                    SliverAppBar(
                      leadingWidth: 0,
                      pinned: true,
                      floating: true,
                      snap: true,
                      bottom: TabBar(
                        controller: _tabController,
                        isScrollable: true,
                        tabs: const [
                          Tab(
                            child: Text(
                              'For you',
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          ),
                          Tab(
                            child: Text(
                              'Top Charts',
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                          Tab(
                            child: Text(
                              'Kids',
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                          Tab(
                            child: Text(
                              'Categories',
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ],
                      ),
                      backgroundColor: Colors.white,
                      title: Center(
                        child: Container(
                          height: 50,
                          width: 320,
                          decoration: BoxDecoration(
                              color: Colors.black12,
                              borderRadius: BorderRadius.circular(40)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                  margin: const EdgeInsets.only(left: 6),
                                  child: IconButton(
                                      onPressed: () {
                                        showSearch(
                                            context: context,
                                            delegate: DataSearch());
                                      },
                                      icon: const Icon(
                                        Icons.search,
                                        color: Colors.black54,
                                        // size: 28,
                                      ))),
                              const SizedBox(
                                width: 180,
                                child: Text(
                                  'Search for apps & ...',
                                  style: TextStyle(
                                      color: Colors.black54, fontSize: 16),
                                ),
                              ),
                              const Icon(
                                Icons.mic_none_outlined,
                                color: Colors.black54,
                              ),
                              Container(
                                  margin: const EdgeInsets.only(right: 10),
                                  child: GestureDetector(
                                      onTap: (() {
                                        showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return Expanded(
                                                child: SimpleDialog(
                                              children: [
                                                Container(
                                                  height: 500,
                                                  width: double.maxFinite,
                                                  // color: Colors.amber,
                                                  child: Column(
                                                    children: [
                                                      ListTile(
                                                        leading:
                                                            Icon(Icons.close),
                                                        title: Image(
                                                            alignment: Alignment
                                                                .center,
                                                            height: 30,
                                                            width: 50,
                                                            image: AssetImage(
                                                                'images/google.png')),
                                                      ),
                                                      ListTile(
                                                        leading: CircleAvatar(
                                                          radius: 18,
                                                          foregroundImage:
                                                              AssetImage(
                                                                  'images/google_image.png'),
                                                        ),
                                                        title: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text('Riya Ranjit',
                                                                style:
                                                                    TextStyle(
                                                                  fontSize: 14,
                                                                )),
                                                            Text(
                                                                'riyaranjit00@gmail.com',
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        10,
                                                                    color: Colors
                                                                        .black54)),
                                                          ],
                                                        ),
                                                        trailing: Icon(Icons
                                                            .arrow_drop_down_circle_outlined),
                                                      )
                                                    ],
                                                  ),
                                                )
                                              ],
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20)),
                                            ));
                                          },
                                        );
                                      }),
                                      child: CircleAvatar(
                                        radius: 18,
                                        foregroundImage: AssetImage(
                                            'images/google_image.png'),
                                      ))),
                            ],
                          ),
                        ),
                      ),
                    )
                  ];
                },
                body: TabBarView(
                  controller: _tabController,
                  children: [
                    SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const ListTile(
                                  title: Text(
                                    'Recommended for you',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 18),
                                  ),
                                  trailing: Icon(Icons.arrow_forward),
                                ),
                                Container(
                                    height: 160,
                                    child: buildListView(recomList)),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const ListTile(
                                  title: Text(
                                    'Popular apps',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 18),
                                  ),
                                  trailing: Icon(Icons.arrow_forward),
                                ),
                                Container(
                                    height: 160, child: buildListView(popLIst)),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const ListTile(
                                  title: Text(
                                    'Based on your recent activity',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 18),
                                  ),
                                  trailing: Icon(Icons.arrow_forward),
                                ),
                                Container(
                                    height: 160,
                                    child: buildListView(recomList)),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    SingleChildScrollView(
                      child: Container(
                        padding: EdgeInsets.only(bottom: 600),
                        child: Column(
                          children: [
                            Container(
                              padding: EdgeInsets.only(bottom: 600),
                              child: Center(
                                child: Text("TITLE2"),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SingleChildScrollView(
                      child: Container(
                        padding: EdgeInsets.only(bottom: 600),
                        child: Column(
                          children: [
                            Container(
                              padding: EdgeInsets.only(bottom: 600),
                              child: Center(
                                child: Text("TITLE3"),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SingleChildScrollView(
                      child: Container(
                        padding: EdgeInsets.only(bottom: 600),
                        child: Column(
                          children: [
                            Container(
                              padding: EdgeInsets.only(bottom: 600),
                              child: Center(
                                child: Text("TITLE2"),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildListView(List apps) {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: apps.length,
        itemBuilder: (context, index) {
          return Container(
            width: 90,
            height: 90,
            margin: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(apps[index].imageUrl),
                ),
                Container(
                  height: 30,
                  child: Text(
                    apps[index].name,
                    style: TextStyle(fontSize: 12),
                    textAlign: TextAlign.left,
                    textDirection: TextDirection.ltr,
                  ),
                ),
                Row(
                  children: [
                    Text(apps[index].rating),
                    const Icon(
                      Icons.star,
                      size: 10.0,
                    )
                  ],
                )
              ],
            ),
          );
        });
  }

  List<RecomendedLIst> recomList = [];
  List<PopularLIst> popLIst = [];
  List<RecentList> recList = [];
  checkType(apps) {
    apps.forEach((e) {
      if (e.dataType == "recommended") {
        setState(() {
          recomList.add(RecomendedLIst(
              imageUrl: e.imageUrl, name: e.name, rating: e.rating));
        });
      } else if (e.dataType == "popular") {
        setState(() {
          popLIst.add(PopularLIst(
              imageUrl: e.imageUrl, name: e.name, rating: e.rating));
        });
      } else if (e.dataType == "recent") {
        setState(() {
          recList.add(
              RecentList(imageUrl: e.imageUrl, name: e.name, rating: e.rating));
        });
      }
    });
  }
}
