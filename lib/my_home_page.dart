import 'package:flutter/material.dart';
import 'package:interview_template/cat_object.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final catObject = CatObject.create();
  final List<CatObject> _catsList = [];
  final List<CatObject> _filteredCats = [];
  bool _searchModeEnabled = false;

  @override
  void initState() {
    super.initState();

    _catsList.add(catObject);
    _catsList.add(CatObject(
        id: "1",
        title: "Furrball",
        subtitle: "Tiny Toon Char",
        imageUrl:
            "https://static.wikia.nocookie.net/looneytunes/images/a/aa/Furrball.jpg/revision/latest/scale-to-width-down/200?cb=20131204124018&path-prefix=es",
        likes: 1));
    _catsList.add(CatObject(
        id: "2",
        title: "Silly Cat",
        subtitle: "Silly Cat is Silly",
        imageUrl:
            "https://wallpapers-clan.com/wp-content/uploads/2022/07/funny-cat-3.jpg",
        likes: 3));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _searchAndTitle(),
        actions: [
          _searchButton(),
        ],
      ),
      body: _listWidget(),
    );
  }

  _listWidget() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.count(
        childAspectRatio: 5 / 6,
        crossAxisCount: 2,
        children: _catsCells(),
      ),
    );
  }

  _updateFilteredCatsList(String filter) {
    _filteredCats.clear();
    if (!_searchModeEnabled || filter.isEmpty) {
      _filteredCats.addAll(_catsList);
      return;
    }

    for (CatObject cat in _catsList) {
      if (cat.title.toLowerCase().contains(filter.toLowerCase())) {
        _filteredCats.add(cat);
      }
    }
  }

  _catsCells() {
    List<Widget> catsCells = [];

    const TextStyle titleStyle = TextStyle(fontSize: 16, color: Colors.black);
    const TextStyle subTitleStyle =
        TextStyle(fontSize: 12, color: Colors.black54);
    const TextStyle likesStyle = TextStyle(fontSize: 14, color: Colors.black);

    const double imageSize = 120;

    for (CatObject cat in _filteredCats) {
      catsCells.add(GestureDetector(
        onTap: () => _onTapOnCat(cat),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Center(
                    child: Image.network(
                      cat.imageUrl,
                      height: imageSize,
                      width: imageSize,
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  Text(cat.title, style: titleStyle),
                  Text(cat.subtitle, style: subTitleStyle),
                  const SizedBox(height: 5),
                  Text("${cat.likes}", style: likesStyle),
                ],
              ),
            ),
          ),
        ),
      ));
    }

    return catsCells;
  }

  _onTapOnCat(CatObject cat) {
    setState(() {
      cat.likes++;
    });
  }

  Widget _searchButton() {
    return _searchModeEnabled
        ? IconButton(
            icon: const Icon(Icons.clear),
            onPressed: () => setState(
              () {
                _searchModeEnabled = false;
                _updateFilteredCatsList("");
              },
            ),
          )
        : IconButton(
            icon: const Icon(Icons.search),
            onPressed: () => setState(() => _searchModeEnabled = true),
          );
  }

  Widget _searchAndTitle() {
    return _searchModeEnabled ? _searchTextField() : const Text('Cat-alogue');
  }

  Widget _searchTextField() {
    return TextField(
      onChanged: (value) => setState(
        () {
          _updateFilteredCatsList(value);
        },
      ),
      autofocus: true,
      cursorColor: Colors.white,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 18,
      ),
      textInputAction: TextInputAction.search,
      decoration: const InputDecoration(
        enabledBorder:
            UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
        focusedBorder:
            UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
        hintText: 'Search',
        hintStyle: TextStyle(
          color: Colors.white60,
          fontSize: 18,
        ),
      ),
    );
  }
}
