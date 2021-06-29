import 'package:flutter/material.dart';

class Todo extends StatefulWidget {
  @override
  _TodoState createState() => _TodoState();
}

class _TodoState extends State<Todo> {
  List<dynamic> lst = [1, 2, 3];
  var output = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: lst.length,
          itemBuilder: (context, index) {
            return Container(
              height: 50,
              color: Colors.black12,
              margin: EdgeInsets.only(top: 15),
              child: ListTile(
                title: Text("${lst[index]}"),
                trailing: Container(
                  width: 50,
                  child: Row(
                    children: [
                      GestureDetector(
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: Text("Edit Item"),
                                    content: Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: TextField(
                                          decoration: InputDecoration(
                                            border: OutlineInputBorder(),
                                          ),
                                          onChanged: (value) {
                                            output = value;
                                          }),
                                    ),
                                    actions: [
                                      ElevatedButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                            setState(() {
                                              lst.replaceRange(
                                                  index, index + 1, {output});
                                            });
                                          },
                                          style: ElevatedButton.styleFrom(
                                            primary: Colors.black54,
                                            padding: EdgeInsets.all(8)
                                          ),
                                          child: Text("Edit")),
                                    ],
                                  );
                                });
                          },
                          child: Icon(Icons.edit)),
                      GestureDetector(
                          onTap: () {
                            setState(() {
                              lst.removeAt(index);
                            });
                          },
                          child: Icon(Icons.delete)),
                    ],
                  ),
                ),
              ),
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text("Add Item"),
                  content: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Add Here",
                      ),
                      onChanged: (value) {
                        output = value;
                      }),
                  actions: [
                    ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                          setState(() {
                            lst.add(output);
                          });
                        },
                        child: Text(
                          "Add",
                        )),
                  ],
                );
              });
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.black54,
      ),
    );
  }
}
