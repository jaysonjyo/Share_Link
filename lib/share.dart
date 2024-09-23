import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:share_plus/share_plus.dart';

class Sharepage extends StatefulWidget {
  const Sharepage({super.key});

  @override
  State<Sharepage> createState() => _SharepageState();
}

class _SharepageState extends State<Sharepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: GestureDetector(
              onTap: () {
                Share.share(
                    "https://www.youtube.com/results?search_query=flutter+class+video");
              },
              child: Container(
                width: 100,
                height: 50,
                decoration: ShapeDecoration(
                  color: Colors.green,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
                child: Center(
                    child: Text(
                  "Share",
                  style: TextStyle(color: Colors.white),
                )),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Center(
            child: GestureDetector(
              onTap: () async {
                final ImagePicker picker = ImagePicker();
                final XFile? image =
                    await picker.pickImage(source: ImageSource.gallery);
                if(image!=null){
                  Share.shareXFiles([XFile(image.path)]
                  ,
                  text: "image text optional");
                }
              },
              child: Container(
                width: 100,
                height: 50,
                decoration: ShapeDecoration(
                  color: Colors.pink,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
                child: Center(
                    child: Text(
                  "Share image",
                  style: TextStyle(color: Colors.white),
                )),
              ),
            ),
          )
        ],
      ),
    );
  }
}
