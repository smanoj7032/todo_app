import 'package:flutter/material.dart';
class Setting extends StatefulWidget {
  const Setting({Key? key}) : super(key: key);

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  bool isDarkTheme = false;
  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: size.width,
      child: Column(
        children: [
          SizedBox(
            height: size.height*0.05,
            width: size.width,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,

            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(isDarkTheme? 'Dark Mode' : 'Light Mode',style: TextStyle(fontSize: 30)),
              ),
              Transform.scale(scale: 1.5,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Switch(value: isDarkTheme, onChanged: (bool value){
                    setState(() {
                      isDarkTheme = value;
                    });

                  }),
                ),
              )
            ],
          )
        ],
      ),

    );
  }
}
