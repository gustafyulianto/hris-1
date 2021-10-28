import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hris/utils/constant.dart';
import 'package:shared_preferences/shared_preferences.dart';

dynamicText(
  String text,
  {
    Color color = Colors.black87,
    double fontSize = 16,
    FontWeight fontWeight,
    FontStyle fontStyle = FontStyle.normal,
    TextOverflow overflow,
    TextAlign textAlign,
    bool price = false,
    bool number = false,
    // String fontFamily = "OpenSans",
    int maxLines,
    TextDecoration textDecoration
  }) {
  
  return Text(
    text != null ? text : "",
    style: 
    GoogleFonts.openSans(
      textStyle: TextStyle(
        // fontFamily: fontFamily,
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
        fontStyle: fontStyle,
        decoration: textDecoration
      )
    ),
    overflow: overflow,
    textAlign: textAlign,
    maxLines: maxLines,
  );
}

navigationManager(context, Widget pageScreen, {isPushReplaced = false}) {
  isPushReplaced
    ? Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => pageScreen,
        settings: RouteSettings(name: '${pageScreen.toString()}')))
    : Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => pageScreen,
        settings: RouteSettings(name: '${pageScreen.toString()}')));
}

savePreferences(String key,
  {bool boolValue,
  int intValue,
  double doubleValue,
  List<String> listValue,
  String stringValue}) async {
  var ref = await SharedPreferences.getInstance();
  if (boolValue != null) {
    ref.setBool(key, boolValue);
  } else if (intValue != null) {
    ref.setInt(key, intValue);
  } else if (doubleValue != null) {
    ref.setDouble(key, doubleValue);
  } else if (stringValue != null) {
    ref.setString(key, stringValue);
  } else if (listValue != null) {
    ref.setStringList(key, listValue);
  }
}

//GET LOCAL DATA STORAGE
getPreferences(String key, {kType}) async {
  var ref = await SharedPreferences.getInstance();
  var value;
  if (kType == 'int') {
    value = ref.getInt(key);
  } else if (kType == 'double') {
    value = ref.getDouble(key);
  } else if (kType == 'string') {
    value = ref.getString(key);
  } else if (kType == 'bool') {
    value = ref.getBool(key);
  } else if (kType == 'list') {
    value = ref.getStringList(key);
  }
  return value;
}

// bottomBarIcons({IconData icon, String title}) {
//   return BottomNavigationBarItem(
//     icon: Icon(
//       icon,
//       size: 28,
//       // color: Colors.black45,
//     ),
//     activeIcon: Icon(
//       icon,
//       size: 28,
//     ),
//     label: title,
//   );
// }

bottomBarIcons({Widget icon, String title}) {
  return BottomNavigationBarItem(
    icon: icon,
    activeIcon: icon,
    label: title,
  );
}

defaultCard(Widget content) {
  return Card(
    elevation: 0,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.0),
      side: BorderSide(color: Colors.grey[300], width: 1.0),
    ),
    child: Container(
      padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
      child: content
    ),
  );
}

defaultMenuCard(Widget content) {
  return Card(
    elevation: 0,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.0),
      // side: BorderSide(color: Colors.grey[300], width: 1.0),
      // side: BorderSide(color: Colors.blueAccent, width: 1.0),
    ),
    color: Colors.blueAccent.withOpacity(0.2),
    child: Container(
      padding: EdgeInsets.fromLTRB(6, 10, 6, 10),
      child: content
    ),
  );
}

defaultList(Widget content) {
  return Container(
    padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
    child: Container(
      // padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.grey[300], width: 0.7)
        ),
      ),
      child: content
    ),
  );
}

defaultChip(String label) {
  return Container(
    decoration: BoxDecoration(
      color: Colors.blue[50],
      borderRadius: BorderRadius.circular(20),
    ),
    padding: EdgeInsets.symmetric(vertical: 3, horizontal: 6),
    child: dynamicText(label, color: Colors.blue, fontSize: 14, fontWeight: FontWeight.w600),
  );
}

defaultRaisedButton(String label, Function onPres) {
  return RaisedButton(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(6.0),
    ),
    color: Colors.blueAccent,
    padding: EdgeInsets.symmetric(vertical: 0, horizontal: 4),
    onPressed: onPres, 
    child: dynamicText(label, fontWeight: FontWeight.w600, color: Colors.white, fontSize: 13),
  );
}

defaultFlatButton(String label, Function onPres) {
 return FlatButton(
    padding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
    onPressed: onPres, 
    child: dynamicText(label, fontWeight: FontWeight.w600, color: Colors.blueAccent, fontSize: 13),
  );
}

defaultImageThumb(String url) {
  return Container(
    height: 100,
    width: 100,
    decoration: BoxDecoration(
      color: Colors.blue[50],
      borderRadius: BorderRadius.circular(6),
      image: DecorationImage(
        image: NetworkImage(url)
      //   image: CachedNetworkImage(
      //     placeholder: (context, url) => CircularProgressIndicator(),
      //     imageUrl: 'https://picsum.photos/250?image=9',
      //   )
      )
    ),
    // padding: EdgeInsets.symmetric(vertical: 3, horizontal: 6),
    margin: EdgeInsets.only(right: 6),
    // child: image
  );
}

defaultButtonTab(Widget content) {
  return Card(
    elevation: 0,
    child: Container(
      decoration: BoxDecoration(
        // color: Color.fromRGBO(64, 75, 96, .9),
        borderRadius: BorderRadius.circular(100),
        border: Border.all(color: Colors.grey[200], width: 1.0),
      ),
      padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
      child: content
    ),
  );
}

defaultHighlightButtonTab(Widget content) {
  return Card(
    elevation: 0,
    child: Container(
      decoration: BoxDecoration(
        color: Colors.blueAccent,
        borderRadius: BorderRadius.circular(100),
        border: Border.all(color: Colors.grey[200], width: 1.0),
      ),
      padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
      child: content
    ),
  );
}

defaultListCard(Widget content) {
  return Card(
    elevation: 0,
    child: Container(
      width: 140,
      decoration: BoxDecoration(
        // color: kSecondaryColor,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey[200], width: 1.0),
      ),
      padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
      child: content
    ),
  );
}

defaultCircleImageThumb(String url, String employeeName) {
  return Padding(
    padding: const EdgeInsets.only(right: 0),
    child: Column(
      // crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 60,
          width: 60,
          decoration: BoxDecoration(
            color: Colors.blue[50],
            borderRadius: BorderRadius.circular(100),
            image: DecorationImage(
              image: NetworkImage(url),
              fit: BoxFit.fitHeight
            //   image: CachedNetworkImage(
            //     placeholder: (context, url) => CircularProgressIndicator(),
            //     imageUrl: 'https://picsum.photos/250?image=9',
            //   )
            )
          ),

          // padding: EdgeInsets.symmetric(vertical: 3, horizontal: 6),
          // margin: EdgeInsets.only(right: kDefaultPadding),
          // child: image
        ),
        Container(
          width: 80,
          padding: EdgeInsets.only(top: 5), 
          child: dynamicText(employeeName, fontSize: 10, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center)
        )
      ],
    ),
  );
}