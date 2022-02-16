import 'package:flutter/material.dart';
import 'package:student/student.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController nametxt = new TextEditingController();
  TextEditingController markstxt = new TextEditingController();
  TextEditingController search = new TextEditingController();
  TextEditingController deletetxt = new TextEditingController();
  List lstStus = [];
  int answer = 0;
  // String first = '';
  String name = '';
  int marks = 0;
  bool status = false;
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.orange,
          title: Text('Student'),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(50, 20, 50, 5),
              child: TextField(
                controller: nametxt,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  hintText: 'Enter Name',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(50, 4, 50, 5),
              child: TextField(
                controller: markstxt,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  hintText: 'Enter Marks',
                ),
              ),
            ),
            SizedBox(height: 5),
            ElevatedButton(
              onPressed: () {
                //1.Create an Object
                Student newStu = new Student();
                //2.Assisn the values
                newStu.Name = nametxt.text;
                String nm = nametxt.text;
                newStu.Marks = int.parse(markstxt.text);
                //3.Add to list
                lstStus.add(newStu);
                setState(() {});
              },
              child: Text('Add'),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.blueGrey),
              ),
            ),
            SizedBox(height: 5),
            Text('Students count:${lstStus.length}'),
            Padding(
              padding: const EdgeInsets.fromLTRB(50, 14, 50, 5),
              child: TextField(
                controller: search,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  hintText: 'Search Student',
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {});
                final find = search.text;
                for (int i = 0; i < lstStus.length; i++) {
                  Student singlestu = lstStus[i];
                  if (find == singlestu.Name) {
                    name = singlestu.Name;
                    marks = singlestu.Marks;
                  }
                }
              },
              child: Text('Show'),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.blueGrey),
              ),
            ),
            SizedBox(height: 5),
            Text('Students Result:\n Name: ${name} \n Marks: ${marks}'),
            Padding(
              padding: const EdgeInsets.fromLTRB(50, 14, 50, 5),
              child: TextField(
                controller: deletetxt,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  hintText: 'Search Student',
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {});
                final find = deletetxt.text;
                for (int i = 0; i < lstStus.length; i++) {
                  Student singlestu = lstStus[i];
                  if (find == singlestu.Name) {
                    //My method=
                    // singlestu.Name = '';
                    // singlestu.Marks = 0;
                    index = i;
                  }
                }
                lstStus.removeAt(index);
                status = true;
                clearText();
              },
              child: Text('Delete'),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.blueGrey),
              ),
            ),
            Text('Studentd delete is:$status'),
          ],
        ),
      ),
    );
  }

  void clearText() {
    nametxt.clear();
    markstxt.clear();
    search.clear();
    deletetxt.clear();
  }
}
