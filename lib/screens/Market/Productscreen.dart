import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:smart_personal_shopper/constants.dart';
import 'package:smart_personal_shopper/data/product/ProductItems.dart';
import 'package:smart_personal_shopper/screens/Payment/paycard.dart';
import 'package:smart_personal_shopper/screens/home.dart';
import 'package:smart_personal_shopper/screens/profile.dart';
import 'package:smart_personal_shopper/widget/banner.dart';

import 'details.dart';

class ProductScreen extends StatelessWidget {
  TextEditingController controller = new TextEditingController();
  late String filter;
  @override
  void initState() {
    controller.addListener(() {
      filter = controller.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    var screensize = MediaQuery.of(context).size;

    final ButtonStyle style =
        TextButton.styleFrom(primary: Theme.of(context).colorScheme.primary);
    return Scaffold(
      appBar: AppBar(
        //toolbarHeight: screensize.height * 0.1,
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_rounded,
            color: Colors.red,
            size: 40,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        leadingWidth: 30,
        actions: <Widget>[
          TextButton(
            style: style,
            onPressed: () {
              AwesomeDialog(
                context: context,
                headerAnimationLoop: false,
                dialogType: DialogType.NO_HEADER,
                title: 'Your have 180.52 DT',
                desc: 'Do you want to recharge your account?',
                btnCancelText: "No",
                btnOkText: "Recharge",
                btnCancelOnPress: () {},
                btnOkOnPress: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => MyCard()));
                },
                btnOkColor: SecondaryRed,
                btnCancelColor: Colors.grey[500],
              )..show();
            },
            child: const Text('Credit:180.52 DT'),
          ),
          TextButton(
              style: style,
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => Profile()));
              },
              child: new Container(
                width: 70.0,
                height: 45.0,
                decoration: new BoxDecoration(
                    shape: BoxShape.circle,
                    image: new DecorationImage(
                        fit: BoxFit.contain,
                        image: AssetImage('images/pouya.jfif'))),
              ))
        ],
      ),
      body: Column(
        children: <Widget>[
          Text(
            'choose your product',
            textAlign: TextAlign.center,
            style: TextStyle(
              height: 2,
              fontSize: 30,
              color: Colors.grey,
            ),
          ),
          Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      height: 80,
                      padding: EdgeInsets.only(
                        top: 35,
                        left: 15,
                        right: 5,
                        bottom: 5,
                      ),
                      width: double.infinity,
                      color: Colors.white10,
                      child: TextField(
                        controller: controller,
                        decoration: InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                              borderRadius: BorderRadius.circular(25.7),
                              borderSide: BorderSide(color: Colors.black)),
                          focusedBorder: UnderlineInputBorder(
                              borderRadius: BorderRadius.circular(25.7),
                              borderSide: BorderSide(color: Colors.black)),
                          labelText: 'search',
                          filled: true,
                          fillColor: Colors.white12,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 80,
                    color: Colors.white,
                    padding: EdgeInsets.only(top: 25, right: 15),
                    child: Icon(Icons.search),
                  ),
                ],
              ),
            ],
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: GridView.builder(
                  itemCount: products.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 20.0,
                    crossAxisSpacing: 20.0,
                    childAspectRatio: 0.75,
                  ),
                  itemBuilder: (context, index) => ItemCard(
                        product: products[index],
                      )),
            ),
          ),
        ],
      ),
    );
  }
}

class ItemCard extends StatelessWidget {
  final Product product;
  const ItemCard({
    Key,
    required this.product,
  }) : super(key: Key);

  get itemcount => products.length;
  void onTap(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (_) => details()));
  }

  @override
  Widget build(BuildContext context) {
    var screensize = MediaQuery.of(context).size;
    return InkWell(
      onTap: () => onTap(context),
      child: Container(
        child: Stack(
          children: <Widget>[
            new Container(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
              child: Column(
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 10),
                    height: screensize.height * 0.25,
                    width: screensize.width * 0.5,
                    decoration: BoxDecoration(
                      color: PrimaryGrey.withOpacity(0.05),
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(
                        color: SecondaryRed,
                        width: 1,
                      ),
                    ),
                    child: LayoutBuilder(
                      builder: (_, constraints) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Hero(
                              tag: product.hashCode,
                              child: Image.asset(
                                product.image,
                                height: constraints.maxHeight * 0.4,
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              product.title,
                              style: TextStyle(color: PrimaryRed),
                            ),
                            Text(
                              product.description,
                              style: TextStyle(color: PrimaryRed),
                            ),
                            Spacer(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '${product.price} dt',
                                  style: TextStyle(color: PrimaryRed)
                                      .copyWith(fontWeight: FontWeight.w700),
                                ),
                                Container(
                                  padding: const EdgeInsets.all(7),
                                  decoration: BoxDecoration(
                                    color: PrimaryRed,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Icon(
                                    Icons.add,
                                    size: 20,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        );
                      },
                    ),
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
