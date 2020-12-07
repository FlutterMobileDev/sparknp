import 'package:flutter/material.dart';

import 'package:sparknp/constants.dart';
import 'package:sparknp/model/searchmodel.dart';
import 'package:sparknp/router.dart';
import 'package:sparknp/services/searchservice.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  String searchString;
  String imgpath = "https://sparknp.com/assets/images/thumbnails/";

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Stack(
            children: [
              Container(
                height: size.height,
                width: size.width,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    LightColor.background,
                    LightColor.background,
                    LightColor.background,
                    LightColor.background,
                  ],
                  stops: [0.1, 0.4, 0.7, 0.9],
                )),
              ),
              Column(
                children: [
                  Row(children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
                      child: Container(
                        width: 45,
                        height: 43,
                        decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.6),
                            shape: BoxShape.circle,
                            border: Border.all(
                                width: 1.5, color: LightColor.primaryColor)),
                        child: IconButton(
                          icon: Icon(Icons.arrow_back_ios_outlined),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(16, 10, 0, 0),
                      child: Container(
                        width: size.width * 0.7,
                        height: 40,
                        decoration: BoxDecoration(
                          color: LightColor.primaryColor.withOpacity(0.02),
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(
                            color: LightColor.primaryColor,
                            width: 1.5,
                          ),
                        ),
                        child: TextField(
                          autofocus: true,
                          decoration: InputDecoration(
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              hintText: "Search",
                              prefixIcon: Icon(Icons.search),
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: 5,
                                vertical: 5,
                              )),
                          onChanged: (val) {
                            setState(() {
                              searchString = val;
                            });
                          },
                        ),
                      ),
                    ),
                  ]),
                  SizedBox(
                    height: 10,
                  ),
                  (searchString != '' && searchString != null)
                      ? Container(
                          height: size.height,
                          width: size.width,
                          child: FutureBuilder<SearchProducts>(
                            future: SearchService.getlist(searchString),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                      ConnectionState.none &&
                                  snapshot.hasData == null &&
                                  snapshot.hasData) {
                                return Container(
                                  child: CircularProgressIndicator(),
                                );
                              }
                              if (snapshot.connectionState ==
                                      ConnectionState.done &&
                                  snapshot.hasData == null) {
                                return Container(
                                  child: Text("No such Products"),
                                );
                              }
                              if (snapshot.hasData == null) {
                                return Container(
                                  child: Text("No Such products"),
                                );
                              }
                              if (snapshot.data == null) {
                                return Padding(
                                  padding: EdgeInsets.fromLTRB(20, 20, 0, 0),
                                  child: Container(
                                    child: Text("No such product"),
                                  ),
                                );
                              }
                              return (snapshot.connectionState ==
                                      ConnectionState.waiting)
                                  ? Center(
                                      child: CircularProgressIndicator(),
                                    )
                                  : ListView.builder(
                                      itemCount: snapshot.data.products.length,
                                      itemBuilder: (context, index) {
                                        dynamic product =
                                            snapshot.data.products[index];
                                        return GestureDetector(
                                          onTap: () {
                                            Navigator.pushNamed(
                                                context, details,
                                                arguments: product);
                                          },
                                          child: Container(
                                            width: size.width,
                                            height: 90,
                                            child: Card(
                                              child: ListTile(
                                                title: Text(
                                                  product.name,
                                                ),
                                                leading: Image.network(
                                                  imgpath + product.thumbnail,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                          ),
                                        );
                                      });
                            },
                          ),
                        )
                      : Container(
                          child: Text("What are you looking for?"),
                        ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
