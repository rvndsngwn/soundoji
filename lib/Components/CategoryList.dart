import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/material.dart';
import 'package:soundoji/Constants/UIColors.dart';
import 'package:soundoji/Models/SoundojiObj.dart';

class CategoryList extends StatefulWidget {
  final String title;
  final List<SoundojiObj> list;
  final Function playSound;

  const CategoryList({Key key, this.title, this.list, this.playSound})
      : super(key: key);

  @override
  _CategoryListState createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  uiColors _colors;

  @override
  void initState() {
    _colors = new uiColors();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Container(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 0.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.title,
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      color: _colors.uiYellow,
                      fontSize: 36,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => ViewAll(),
                        ),
                      );
                    },
                    child: Text(
                      'View All',
                      style: TextStyle(
                          color: _colors.uiBlack,
                          fontSize: 20,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 4,
            ),
            LimitedBox(
              maxHeight: 130,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: widget.list.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: () {
                            widget.playSound(index, widget.title);
                          },
                          highlightColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          splashColor: Colors.transparent,
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(5),
                                    topLeft: Radius.circular(5),
                                    bottomLeft: Radius.circular(20),
                                    bottomRight: Radius.circular(20)),
                                color: _colors.uiYellowIconBack,
                                boxShadow: [
                                  BoxShadow(
                                      color: _colors.uiYellowShadow,
                                      blurRadius: 0,
                                      offset: Offset(0, 4)),
                                ]),
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Container(
                                color: Colors.transparent,
                                child: Image.asset(widget.list[index].iconPath),
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
            ),
            SizedBox(
              height: 8,
            ),
          ],
        ),
      ),
    );
  }
}

class ViewList extends StatefulWidget {
  final String title;
  final List<SoundojiObj> list;
  final Function playSound;

  const ViewList({Key key, this.title, this.list, this.playSound})
      : super(key: key);

  @override
  _ViewListState createState() => _ViewListState();
}

class _ViewListState extends State<ViewList> {
  uiColors _colors;

  @override
  void initState() {
    _colors = new uiColors();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return LimitedBox(
      maxHeight: 35,
      child: GridView.count(
        scrollDirection: Axis.vertical,
        crossAxisCount: 2,

        children: List.generate(
            widget.list.length, (index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {
                  print('click');
                  widget.playSound(index, widget.title);
                },
                highlightColor: Colors.transparent,
                hoverColor: Colors.transparent,
                focusColor: Colors.transparent,
                splashColor: Colors.transparent,
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(5),
                          topLeft: Radius.circular(5),
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20)),
                      color: _colors.uiYellowIconBack,
                      boxShadow: [
                        BoxShadow(
                            color: _colors.uiYellowShadow,
                            blurRadius: 0,
                            offset: Offset(0, 4)),
                      ]),
                  child: Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 32.0,left: 32,right: 32,top: 10),
                        child: Container(
                          color: Colors.transparent,
                          child: Image.asset(
                            widget.list[index].iconPath,
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 6,
                        left: 10,
                        child: Text(
                          widget.list[index].name[0].toUpperCase() + widget.list[index].name.substring(1),
                          style: TextStyle(
                            fontWeight: FontWeight.w900,
                            color: _colors.defaultWhite,
                            fontSize: 36,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}

class ViewAll extends StatefulWidget {
  const ViewAll({
    Key key,
  }) : super(key: key);
  @override
  _ViewAllState createState() => _ViewAllState();
}

class _ViewAllState extends State<ViewAll> {
  AudioCache audioCache = new AudioCache();

  List<SoundojiObj> funList;
  List<SoundojiObj> animalList;
  List<SoundojiObj> vehiclesList;
  List<SoundojiObj> cenkErdemList;
  uiColors _colors;


  play(int index, String category) async {
    switch (category) {
      case 'Funny':
        audioCache.play(funList[index].soundPath);
        break;
      case 'Animals':
        audioCache.play(animalList[index].soundPath);
        break;
      case 'Vehicles':
        audioCache.play(vehiclesList[index].soundPath);
        break;
      case 'CenkErdem':
        audioCache.play(cenkErdemList[index].soundPath);
        break;
    }
  }

  filterByCategory(String category) {
    return SoundojiObj.soundojis.where((element) => element.category == category).toList();
  }

  @override
  void initState() {
    funList = filterByCategory('Funny');
    animalList = filterByCategory('Animals');
    vehiclesList = filterByCategory('Vehicles');
    cenkErdemList = filterByCategory('CenkErdem');
    _colors = uiColors();
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Animals',
          style: TextStyle(
            fontWeight: FontWeight.w900,
            color: _colors.uiYellow,
            fontSize: 36,
          ),
        ),
        centerTitle: true,
      ),
      body: ViewList(
        title: 'Animals',
        list: animalList,
        playSound: play,
      ),
    );
  }
}
