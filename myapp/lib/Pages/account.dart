import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hive_flutter/hive_flutter.dart';

class Account extends StatefulWidget {
  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  TextEditingController _controller = TextEditingController();
  TextEditingController _ccontroller = TextEditingController();

  Box? contactbox;
  @override
  void initState() {
    contactbox = Hive.box('Contact-list');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 40, left: 20, right: 20),
          child: Column(
            children: [
              TextField(
                controller: _controller,
                decoration: InputDecoration(
                  hintText: 'Nadim Hasan',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                  width: 300,
                  child: ElevatedButton(
                      onPressed: () async {
                        try {
                          final userinput = _controller.text;
                          await contactbox!.add(userinput);
                          Fluttertoast.showToast(msg: 'Added successfully');
                          _controller.clear();
                        } catch (e) {
                          Fluttertoast.showToast(
                            msg: e.toString(),
                          );
                        }
                      },
                      child: Text('Add data'))),
              SizedBox(
                height: 20,
              ),
              Expanded(
                  child: ValueListenableBuilder(
                valueListenable: Hive.box('Contact-list').listenable(),
                builder: (context, value, Widget) {
                  return ListView.builder(
                      itemCount: contactbox!.keys.toList().length,
                      itemBuilder: (context, index) {
                        return Card(
                          elevation: 5,
                          child: ListTile(
                            trailing: Container(
                              width: 100,
                              child: Row(
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      showDialog(
                                          context: context,
                                          builder: (_) {
                                            return Dialog(
                                              child: Container(
                                                height: 200,
                                                child: Column(
                                                  children: [
                                                    TextField(
                                                      controller: _ccontroller,
                                                      decoration:
                                                          InputDecoration(
                                                        border:
                                                            OutlineInputBorder(),
                                                      ),
                                                    ),
                                                    ElevatedButton(
                                                        onPressed: () {
                                                          final UpdatedInput =
                                                              _ccontroller.text;
                                                          contactbox!.putAt(
                                                              index,
                                                              UpdatedInput);
                                                          _ccontroller.clear();
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                        child: Text('Update')),
                                                  ],
                                                ),
                                              ),
                                            );
                                          });
                                    },
                                    icon: Icon(Icons.edit),
                                    color: Colors.green,
                                  ),
                                  IconButton(
                                    onPressed: () async {
                                      await contactbox!.deleteAt(index);
                                    },
                                    icon: Icon(Icons.remove_circle),
                                    color: Colors.red,
                                  ),
                                ],
                              ),
                            ),
                            title: Text(contactbox!.getAt(index).toString()),
                          ),
                        );
                      });
                },
              )),
            ],
          ),
        ),
      ),
    );
  }
}
