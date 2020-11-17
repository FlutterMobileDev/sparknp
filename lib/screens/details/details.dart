import 'package:flutter/material.dart';
import 'package:sparknp/screens/details/detailscomponents/detailsbody.dart';

import 'package:sparknp/widgets/appbar/appbar.dart';

class DetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: DetailsBody(),
    );
  }
}
