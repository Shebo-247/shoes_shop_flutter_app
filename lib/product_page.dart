import 'package:flutter/material.dart';
import 'package:shoes_shop_flutter_app/item_fader.dart';

class ProductPage extends StatefulWidget {
  final String image, tag, brand, price;

  ProductPage({this.image, this.tag, this.brand, this.price});

  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Hero(
        tag: widget.tag,
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
              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomRight,
                  colors: [
                    Colors.black.withOpacity(0.7),
                    Colors.black.withOpacity(0.1)
                  ]
                )
              ),
              child: Padding(
                padding: EdgeInsets.only(top: 25),
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
                                createSizeItem(size: '40', active: false),
                                createSizeItem(size: '42', active: true),
                                createSizeItem(size: '44', active: false),
                                createSizeItem(size: '46', active: false),
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
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: FlatButton(
                              onPressed: () {},
                              child: Text('Buy Now'),
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
      ),
    );
  }

  Widget createSizeItem({size, active}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      margin: EdgeInsets.only(right: 15),
      decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(10),
          color: active == true ? Colors.white : Colors.transparent),
      child: Center(
        child: Text(
          size,
          style: TextStyle(
              color: active == true ? Colors.black : Colors.white,
              fontSize: 18),
        ),
      ),
    );
  }
}
