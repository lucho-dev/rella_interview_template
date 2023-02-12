import 'package:flutter/material.dart';
import 'package:interview_template/my_object.dart';

class MyHomePage
    extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHopePageState();
}

class _MyHopePageState extends State<MyHomePage> {
  final catObject = CatObject.create();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cat-alogue'),
      ),
      body: _body(),
    );
  }

  Widget _body() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView(
        children: _cells(),
      ),
    );
  }

  List<Widget> _cells() {
    List<Widget> cells = [];

    const TextStyle titleStyle = TextStyle(fontSize: 20, color: Colors.black);
    const TextStyle subTitle = TextStyle(fontSize: 18, color: Colors.black);
    const TextStyle likeStyle = TextStyle(fontSize: 16, color: Colors.black);

    cells.add(
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: InkWell(
          onTap: () => _onTapOn(catObject),
          child: Card(
            child:
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text(catObject.title, style: titleStyle,),
                  const SizedBox(height: 4,),
                  Text(catObject.subtitle, style: subTitle,),
                  Image.network(catObject.imageUrl, fit: BoxFit.fitHeight, height: 200,),
                  Text("Likes: ${catObject.likes}", style: likeStyle,),
                ],
              ),
            )
          ),
        ),
      )
    );

    return cells;
  }

  _onTapOn(CatObject catObject) {
    setState(() {
      catObject.likes++;
    });
  }
}
