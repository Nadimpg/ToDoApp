import 'package:flutter/material.dart';

class MyAdd extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        initialIndex: 0,
        child: Scaffold(
            appBar: AppBar(
              bottom: TabBar(
                tabs: [
                  Tab(
                    text: 'My Ads',
                  ),
                  Tab(
                    text: 'My Favourite',
                  )
                ],
              ),
            ),
            body: TabBarView(children: [
              Container(
                child: GridView.builder(
                    itemCount: 2,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: .90,
                    ),
                    itemBuilder: (context, index) {
                      return Card(
                        elevation: 5,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 60,
                                ),
                                Stack(
                                  clipBehavior: Clip.none,
                                  children: [
                                    Container(
                                      height: 100,
                                      width: 140,
                                      color: Colors.white,
                                    ),
                                    Positioned(
                                      top: -50,
                                      child: Image.asset(
                                        'assets/fruits-and-vegetables 1.png',
                                        width: 100,
                                      ),
                                    ),
                                  ],
                                ),
                                Text(
                                  'Apple Watch',
                                  style: TextStyle(color: Colors.red),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 10, bottom: 10),
                                  child: Text('Series 6 Watch'),
                                ),
                                Text(
                                  '\$350',
                                  style: TextStyle(color: Colors.blue),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
              ),
              Container(
                child: Column(
                  children: [
                    Card(
                      elevation: 5,
                      child: ListTile(
                        leading: CircleAvatar(),
                        title: Text('Apple Watch'),
                        subtitle: Text('Series 6 Red'),
                        trailing: Text('\$350'),
                      ),
                    ),
                    ListTile(
                      leading: CircleAvatar(),
                      title: Text('Apple Watch'),
                      subtitle: Text('Series 6 Red'),
                      trailing: Text('\$350'),
                    ),
                  ],
                ),
              ),
            ])));
  }
}
