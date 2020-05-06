import 'package:flutter/material.dart';
import 'package:learn_app_6/widget/wordpress/common/constants.dart';

Widget searchBoxes(BuildContext context) {
  return GridView.count(
    padding: EdgeInsets.all(16),
    shrinkWrap: true,
    physics: ScrollPhysics(),
    crossAxisCount: 2,
    children: List.generate(CUSTOM_CATEGORIES.length, (index) {
      var cat = CUSTOM_CATEGORIES[index];
      var name = cat[0];
      var image = cat[1];
      var catId = cat[2];

      return Card(
        child: InkWell(
          onTap: () {
//            Navigator.push(
//              context,
//              MaterialPageRoute(
//                builder: (context) => CategoryArticles(catId, name),
//              ),
//            );
          },
          child: Container(
            padding: EdgeInsets.fromLTRB(8, 16, 8, 8),
            child: Column(
              children: <Widget>[
                SizedBox( height:80,child: Image.asset(image)),
                Spacer(),
                Text(
                  name,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    height: 1.2,
                    fontWeight: FontWeight.w500,
                  ),
                )
              ],
            ),
          ),
        ),
      );
    }),
  );
}
