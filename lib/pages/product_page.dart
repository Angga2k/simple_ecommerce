import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:simple_ecommerce/models/product_model.dart';
import 'package:simple_ecommerce/theme.dart';

class ProductPage extends StatefulWidget {
  final ProductModel product;
  ProductPage(this.product);

  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  List images = [
    'assets/image_shoes.png',
    'assets/image_shoes.png',
    'assets/image_shoes.png',
  ];

  List familiarShoes = [
    'assets/image_shoes.png',
    'assets/image_shoes2.png',
    'assets/image_shoes3.png',
    'assets/image_shoes4.png',
    'assets/image_shoes5.png',
    'assets/image_shoes6.png',
    'assets/image_shoes7.png',
    'assets/image_shoes8.png',
  ];

  int currentIndex = 0;

  Widget indicator(int index) {
    return Container(
      width: currentIndex == index ? 16 : 4,
      height: 4,
      margin: EdgeInsets.symmetric(
        horizontal: 2,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: currentIndex == index ? primaryColor : Color(0xffC4C4C4),
      ),
    );
  }

  Widget familiarShoesCard(String imageUrl) {
    return Container(
      width: 54,
      height: 54,
      margin: EdgeInsets.only(
        right: 16,
      ),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(imageUrl),
        ),
        borderRadius: BorderRadius.circular(6),
      ),
    );
  }

  Widget header() {
    int index = -1;

    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(
            top: 20,
            left: defaultMargin,
            right: defaultMargin,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.chevron_left,
                ),
              ),
              Icon(
                Icons.shopping_bag,
                color: backgroundColor1,
              ),
            ],
          ),
        ),
        CarouselSlider(
          items: widget.product.galleries
              .map(
                (image) => Image.network(
                  image.url.replaceAll('http://localhost/storage/', ''),
                  width: MediaQuery.of(context).size.width,
                  height: 310,
                  fit: BoxFit.cover,
                ),
              )
              .toList(),
          options: CarouselOptions(
            initialPage: 0,
            onPageChanged: (index, reason) {
              setState(() {
                currentIndex = index;
              });
            },
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: widget.product.galleries.map((e) {
            index++;
            return indicator(index);
          }).toList(),
        ),
      ],
    );
  }

  Widget content() {
    int index = -1;

    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(top: 17),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(24),
        ),
        color: backgroundColor1,
      ),
      child: Column(
        children: [
          // NOTE: HEADER
          Container(
            margin: EdgeInsets.only(
              top: defaultMargin,
              left: defaultMargin,
              right: defaultMargin,
            ),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.product.name,
                        style: primaryTextStyle.copyWith(
                          fontSize: 18,
                          fontWeight: semiBold,
                        ),
                      ),
                      Text(
                        widget.product.category.name.toString(),
                        style: secondaryTextStyle.copyWith(
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // NOTE: PRICE
          Container(
            width: double.infinity,
            margin: EdgeInsets.only(
              top: 20,
              left: defaultMargin,
              right: defaultMargin,
            ),
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: backgroundColor2,
              borderRadius: BorderRadius.circular(4),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Price starts from',
                  style: primaryTextStyle,
                ),
                Text(
                  '\$${widget.product.price}',
                  style: priceTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: semiBold,
                  ),
                ),
              ],
            ),
          ),

          // NOTE: DESCRIPTION
          Container(
            width: double.infinity,
            margin: EdgeInsets.only(
              top: defaultMargin,
              left: defaultMargin,
              right: defaultMargin,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Description',
                  style: primaryTextStyle.copyWith(
                    fontWeight: medium,
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                Text(
                  widget.product.description.toString(),
                  style: subtitleTextStyle.copyWith(
                    fontWeight: light,
                  ),
                  textAlign: TextAlign.justify,
                ),
              ],
            ),
          ),

          // NOTE: FAMILIAR SHOES
          Container(
            width: double.infinity,
            margin: EdgeInsets.only(
              top: defaultMargin,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: defaultMargin,
                  ),
                  child: Text(
                    'Familiar Shoes',
                    style: primaryTextStyle.copyWith(
                      fontWeight: medium,
                    ),
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: familiarShoes.map((image) {
                      index++;
                      return Container(
                        margin: EdgeInsets.only(
                            left: index == 0 ? defaultMargin : 0),
                        child: familiarShoesCard(image),
                      );
                    }).toList(),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor6,
      body: ListView(
        children: [
          header(),
          content(),
        ],
      ),
    );
  }
}
