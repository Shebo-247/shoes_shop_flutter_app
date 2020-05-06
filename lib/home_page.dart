import 'package:flutter/material.dart';
import 'package:shoes_shop_flutter_app/item_fader.dart';
import 'package:shoes_shop_flutter_app/product_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          'Shoes',
          style: TextStyle(color: Colors.black),
        ),
        leading: null,
        actions: <Widget>[
          IconButton(
              onPressed: () {},
              icon: Icon(Icons.notifications_none),
              iconSize: 30,
              color: Colors.black),
          IconButton(
              onPressed: () {},
              icon: Icon(Icons.shopping_cart),
              iconSize: 30,
              color: Colors.black)
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Container(
                    height: 50,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: <Widget>[
                        addMenuItem(title: 'All', index: 0),
                        addMenuItem(title: 'Sneakers', index: 1),
                        addMenuItem(title: 'Football', index: 2),
                        addMenuItem(title: 'Soccer', index: 3),
                        addMenuItem(title: 'Sneakers', index: 5),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ItemFader(
                    delay: 0.1,
                    direction: 'horizontal',
                    child: addProduct(
                      image: 'images/nike_1.jpg',
                      tag: 'Sneakers',
                      brand: 'Nike',
                      price: '\$100',
                    ),
                  ),
                  ItemFader(
                    delay: 0.3,
                    direction: 'horizontal',
                    child: addProduct(
                      image: 'images/nike_2.jpg',
                      tag: 'Football',
                      brand: 'Nike',
                      price: '\$110',
                    ),
                  ),
                  ItemFader(
                    delay: 0.5,
                    direction: 'horizontal',
                    child: addProduct(
                      image: 'images/nb_1.jpg',
                      tag: 'Soccer',
                      brand: 'NB',
                      price: '\$80',
                    ),
                  ),
                  ItemFader(
                    delay: 0.7,
                    direction: 'horizontal',
                    child: addProduct(
                      image: 'images/nb_2.jpg',
                      tag: 'Sneakers 2',
                      brand: 'NB',
                      price: '\$55',
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget addMenuItem({String title, int index}) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
      },
      child: AspectRatio(
        aspectRatio: 2.5 / 1,
        child: Container(
          height: 50,
          margin: EdgeInsets.only(right: 10),
          decoration: BoxDecoration(
            color:
                _selectedIndex == index ? Colors.grey[200] : Colors.transparent,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Center(
            child: Text(
              title,
              style: TextStyle(
                  fontSize: 20,
                  color: _selectedIndex == index ? Colors.black : Colors.grey),
            ),
          ),
        ),
      ),
    );
  }

  Widget addProduct({image, tag, brand, price}) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductPage(
              image: image,
              tag: tag,
              brand: brand,
              price: price,
            ),
          ),
        );
      },
      child: Material(
        child: Container(
          height: 225,
          padding: EdgeInsets.all(10),
          margin: EdgeInsets.only(bottom: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            image: DecorationImage(
              image: AssetImage(image),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        tag,
                        style: TextStyle(
                            fontSize: 25,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        brand,
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                  Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Colors.white),
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.favorite_border,
                        size: 25,
                        color: Colors.black,
                      ),
                    ),
                  )
                ],
              ),
              Text(
                price,
                style: TextStyle(
                    fontSize: 35,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
