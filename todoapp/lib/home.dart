import 'package:flutter/material.dart';
import 'package:todoapp/style.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List ToDoList = [];
  String item = '';
  MyInputChange(content) {
    setState(() {
      item = content;
    });
  }

  MyAdd() {
    setState(() {
      ToDoList.add({'item': item});
    });
  }

  RemoveAdd(index) {
    setState(() {
      ToDoList.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                Expanded(
                    flex: 10,
                    child: Row(
                      children: [
                        Expanded(
                            flex: 80,
                            child: TextFormField(
                              onChanged: (content) {
                                MyInputChange(content);
                              },
                              decoration: AppInputStyle('Info'),
                            )),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                            flex: 20,
                            child: ElevatedButton(
                                style: AppButtonStyle(),
                                onPressed: () {
                                  MyAdd();
                                },
                                child: Text('Add')))
                      ],
                    )),
                Expanded(
                    flex: 90,
                    child: ListView.builder(
                        itemCount: ToDoList.length,
                        itemBuilder: (context, index) {
                          return Card(
                            child: sizedBox50(Row(
                              children: [
                                Expanded(
                                    flex: 80,
                                    child: Text(
                                        ToDoList[index]['item'].toString())),
                                Expanded(
                                    flex: 20,
                                    child: TextButton(
                                        onPressed: () {
                                          RemoveAdd(index);
                                        },
                                        child: Icon(Icons.delete)))
                              ],
                            )),
                          );
                        })),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
