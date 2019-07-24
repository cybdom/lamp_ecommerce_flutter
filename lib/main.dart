import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lamp_ecommerce_flutter/details.dart';
import 'global.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      debugShowMaterialGrid: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: darkBg,
        accentColor: accent,
        fontFamily: 'Raleway',
      ),
      home: Home(),
      routes: {
        '/details': (context) => Details(),
      },
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            Row(
              children: <Widget>[
                Flexible(
                  child: Container(color: darkBg),
                  flex: 3,
                ),
                Flexible(child: Container(color: lighterBg)),
              ],
            ),
            Container(
              padding: EdgeInsets.only(left: 21, right: 21, top: 15),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "Lamp",
                              style: TextStyle(
                                  fontSize: 31,
                                  fontWeight: FontWeight.w200,
                                  letterSpacing: 1.3),
                            ),
                            TextSpan(
                              text: "ster",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 31,
                                  letterSpacing: 1.3),
                            ),
                          ],
                        ),
                      ),
                      Spacer(),
                      IconButton(
                          icon: Icon(
                            CupertinoIcons.search,
                            color: Colors.white,
                          ),
                          onPressed: () {}),
                      IconButton(
                          icon: Icon(
                            FontAwesomeIcons.borderAll,
                            color: Colors.white,
                          ),
                          onPressed: () {}),
                    ],
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  Menu(),
                  Spacer(),
                  Flexible(
                    flex: 7,
                    child: PageView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: products.length,
                      itemBuilder: (ctx, id) {
                        return MyProductContainer(id: id);
                      },
                    ),
                  ),
                  Spacer(),
                  Flexible(
                    flex: 1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        IconButton(
                          icon: Icon(Icons.tune),
                          color: Colors.white,
                          onPressed: () {},
                        ),
                        Expanded(
                          child: Container(
                            alignment: Alignment.center,
                            margin: EdgeInsets.symmetric(horizontal: 9.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.white,
                            ),
                            child: Text("Fan"),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            alignment: Alignment.center,
                            margin: EdgeInsets.symmetric(horizontal: 9.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              gradient: LinearGradient(
                                colors: [Colors.yellow, accent],
                              ),
                            ),
                            child: Text(
                              "Lamps",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            alignment: Alignment.center,
                            margin: EdgeInsets.symmetric(horizontal: 9.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.white,
                            ),
                            child: Text("Heater"),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 15.0),
                    child: MyBottomNavBar(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyBottomNavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Container(
          padding: EdgeInsets.symmetric(horizontal: 11, vertical: 7),
          decoration: BoxDecoration(
            color: Colors.white12,
            borderRadius: BorderRadius.circular(19),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Icon(Icons.home, color: accent),
              SizedBox(
                width: 9.0,
              ),
              Text(
                "Home",
                style: TextStyle(color: accent),
              ),
            ],
          ),
        ),
        Row(
          children: <Widget>[
            Icon(
              Icons.shopping_cart,
              color: Colors.grey,
            ),
          ],
        ),
        Row(
          children: <Widget>[
            Icon(
              Icons.favorite,
              color: Colors.grey,
            ),
          ],
        ),
        Row(
          children: <Widget>[
            Icon(
              Icons.settings,
              color: Colors.grey,
            ),
          ],
        ),
      ],
    );
  }
}

class MyProductContainer extends StatelessWidget {
  final int id;

  const MyProductContainer({Key key, this.id}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/details');
      },
      child: Container(
        margin: EdgeInsets.all(15.0),
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: Container(
                child: Stack(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.all(5.0),
                      margin: EdgeInsets.all(15.0),
                      child: Image.network(
                        products[id]["pictureLink"],
                        fit: BoxFit.cover,
                      ),
                      decoration: BoxDecoration(
                        color: productColors[id],
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        padding: EdgeInsets.all(15.0),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: accent,
                          boxShadow: [
                            BoxShadow(
                                color: accent,
                                offset: Offset(0, 3),
                                blurRadius: 5.0)
                          ],
                        ),
                        child: Icon(
                          Icons.favorite,
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 5.0,
            ),
            Text(
              products[id]["productName"],
              style: TextStyle(fontSize: 19, color: Colors.grey),
            ),
            SizedBox(
              height: 5.0,
            ),
            Text(
              products[id]["price"],
              style: TextStyle(
                  fontSize: 19,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}

class Menu extends StatefulWidget {
  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  int active = 0;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List<Widget>.generate(
        3,
        (i) {
          return InkWell(
            onTap: () {
              setState(() {
                active = i;
              });
            },
            child: Column(
              children: <Widget>[
                Text(
                  categories[i],
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight:
                          active == i ? FontWeight.bold : FontWeight.w100,
                      fontSize: 17.0),
                ),
                SizedBox(
                  height: 5.0,
                ),
                active == i
                    ? Container(
                        width: 7,
                        height: 7,
                        decoration: BoxDecoration(
                          color: accent,
                          shape: BoxShape.circle,
                        ),
                      )
                    : Container(
                        height: 7,
                        width: 7,
                      ),
              ],
            ),
          );
        },
      ),
    );
  }
}
