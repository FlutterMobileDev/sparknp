import 'package:flutter/material.dart';

import 'package:sparknp/constants.dart';
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
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Stack(
            children: [
              Container(
                height: AppTheme.fullHeight(context),
                width: AppTheme.fullWidth(context),
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
                        width: AppTheme.fullWidth(context) * 0.7,
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
                          height: AppTheme.fullHeight(context),
                          width: AppTheme.fullWidth(context),
                          child: FutureBuilder(
                              future: SearchService.getlist(searchString),
                              // ignore: missing_return
                              builder: (context, snapshot) {
                                switch (snapshot.connectionState) {
                                  case ConnectionState.waiting:
                                    return Center(
                                      child: CircularProgressIndicator(),
                                    );
                                  case ConnectionState.done:
                                    return (snapshot.hasError)
                                        ? Center(child: Text("No Connection"))
                                        : (snapshot.data["products"].length ==
                                                0)
                                            ? Container(
                                                height: AppTheme.fullHeight(
                                                        context) *
                                                    0.4,
                                                child: Center(
                                                  child: Text("No Products"),
                                                ),
                                              )
                                            : ListView.builder(
                                                itemCount: snapshot
                                                    .data["products"].length,
                                                itemBuilder: (context, index) {
                                                  dynamic product = snapshot
                                                      .data["products"][index];
                                                  return GestureDetector(
                                                    onTap: () {
                                                      Navigator.pushNamed(
                                                          context, details,
                                                          arguments: product);
                                                    },
                                                    child: Container(
                                                      width: AppTheme.fullWidth(
                                                          context),
                                                      height: 90,
                                                      child: Card(
                                                        child: ListTile(
                                                          title: Text(
                                                            product["name"],
                                                            maxLines: 3,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                          ),
                                                          leading:
                                                              Image.network(
                                                            imgpath +
                                                                product[
                                                                    "thumbnail"],
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                });
                                  default:
                                }
                              }),
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
