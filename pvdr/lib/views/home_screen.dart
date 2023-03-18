import 'dart:js';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:pvdr/Provider/todo_provider.dart';
import 'package:pvdr/model/todo.dart';
import 'package:pvdr/views/details_screen.dart';

class home_screen extends StatelessWidget {
  TextEditingController _titlecontroller = TextEditingController();
  TextEditingController _descriptioncontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final todo = Provider.of<Todoprovider>(context);

    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showDialog(
                context: context,
                builder: (_) {
                  return AlertDialog(
                    title: Text('Add new todo'),
                    content: Column(
                      children: [
                        TextField(
                          controller: _titlecontroller,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(), hintText: 'title'),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextField(
                          controller: _descriptioncontroller,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'description'),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        ElevatedButton(
                            onPressed: () {
                              final title = _titlecontroller.text;
                              final Description = _descriptioncontroller.text;
                              todo.addNewTodo(title, Description);
                              Navigator.pop(context);
                            },
                            child: Text('Add data'))
                      ],
                    ),
                  );
                });
          },
          child: Icon(Icons.add),
        ),
        appBar: AppBar(
          title: Text('Todos Length : ${todo.todo.length}'),
          actions: [
            TextButton(
              onPressed: () => Navigator.push(context,
                  CupertinoPageRoute(builder: (_) => details_screen())),
              child: Icon(
                Icons.add_circle,
                color: Colors.red,
              ),
            ),
          ],
        ),
        body: ListView.builder(
            itemCount: todo.todo.length,
            itemBuilder: (_, index) {
              return ListTile(
                title: Text(todo.todo[index].title),
                subtitle: Text(todo.todo[index].Description),
                trailing: TextButton(
                    onPressed: () => todo.deleteTodo(index),
                    child: Icon(Icons.remove_circle)),
              );
            }),
      ),
    );
  }
}
