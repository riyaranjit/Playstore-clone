import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var tabNames = {
    'For you',
    'Top charts',
    'Kids',
    'Categories'
  };

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: DefaultTabController(length: tabNames.length,
        child: Scaffold(
          appBar: AppBar(
              toolbarHeight: 80,
              backgroundColor: Colors.white,
              title: Container(
                padding: EdgeInsets.only(top: 10),
                height: 60,
                width: 350,
                child:  TextField(decoration:
                InputDecoration(
                  prefix: IconButton(onPressed: (){showSearch(context: context, delegate:DataSearch());},
                      icon: Icon(Icons.search_outlined, color: Colors.grey,)),
                  //   prefixIcon: Icon(
                  // Icons.search_outlined, color: Colors.grey,),
                    fillColor: Colors.grey,
                    filled: true,
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none, borderRadius:
                    BorderRadius.all(Radius.circular(40.0))),
                    hintText: 'Search for apps...'),
                ),
              ),
              bottom: TabBar(
                  isScrollable: true, tabs: tabNames.map((tabNames) {
                return (Tab(child: Text(tabNames, style: TextStyle(color: Colors.grey
                ),
                ),
                ));
              }).toList()
              )
          ),
          body: TabBarView(children:
          [ Container(),
            Container(),
            Container(),
            Container()]
            ,),
        )
    ));
  }

}

class DataSearch extends SearchDelegate{

  final apps=[
    "Facebook",
    "Messenger",
    "Linkedin",
    "Temple Run",
    "Instagram"
  ];

  final recentapps=[
    "Facebook",
    "Messenger"
  ];

  @override
  List<Widget> buildActions(BuildContext context){
    return[IconButton( onPressed: (){

    }, icon: Icon(Icons.clear))];

  }

  @override
  Widget buildLeading(BuildContext context){
    return IconButton(icon: AnimatedIcon(icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
    ), onPressed: () {close(context, null); },
     );
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    return Text('abc');
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestList= query.isEmpty? recentapps : apps;

    return ListView.builder(itemBuilder: (context, index) =>
        ListTile(leading: Icon(Icons.history), title: Text(suggestList[index]),
        ),
    itemCount: suggestList.length,);
  }

}


