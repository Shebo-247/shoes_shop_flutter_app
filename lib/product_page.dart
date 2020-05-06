import 'package:flutter/material.dart';
import 'package:shoes_shop_flutter_app/item_fader.dart';

class ProductPage extends StatefulWidget {
  final String image, tag, brand, price;

  ProductPage({this.image, this.tag, this.brand, this.price});

  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Material(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(widget.image),
                fit: BoxFit.cover,
              ),
            ),
            child: Container(
              padding: EdgeInsets.only(left: 15, top: 15, right: 15, bottom: 30),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomRight,
                  colors: [
                    Colors.black.withOpacity(0.7),
                    Colors.black.withOpacity(0.1)
                  ]
                )
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      IconButton(
                        alignment: Alignment.centerLeft,
                        icon: Icon(Icons.arrow_back_ios),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        color: Colors.white,
                        iconSize: 25,
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
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      ItemFader(
                        delay: 0.1,
                        direction: 'vertical',
                        child: Text(
                          widget.tag,
                          style: TextStyle(
                              fontSize: 35,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      ItemFader(
                        delay: 0.3,
                        direction: 'vertical',
                        child: Text(
                          'Size',
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      ItemFader(
                        delay: 0.5,
                        direction: 'vertical',
                        child: Container(
                          height: 50,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: <Widget>[
                              createSizeItem(size: '40', index: 0),
                              createSizeItem(size: '42', index: 1),
                              createSizeItem(size: '44', index: 2),
                              createSizeItem(size: '46', index: 3),
                            ],
                          ),
                        ),
                      ),
                      ItemFader(
                        delay: 0.7,
                        direction: 'vertical',
                        child: Container(
                          margin: EdgeInsets.only(top: 50),
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: FlatButton(
                            onPressed: () {},
                            child: Text('Buy Now'.toUpperCase()),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget createSizeItem({size, index}) {
    return GestureDetector(
      onTap: (){
        setState(() {
          _selectedIndex = index;
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        margin: EdgeInsets.only(right: 15),
        decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(10),
            color: _selectedIndex == index ? Colors.white : Colors.transparent),
        child: Center(
          child: Text(
            size,
            style: TextStyle(
                color: _selectedIndex == index ? Colors.black : Colors.white,
                fontSize: 18),
          ),
        ),
      ),
    );
  }
}
