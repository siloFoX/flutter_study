import "package:flutter/material.dart";
import "package:image_picker/image_picker.dart";
import "dart.io";

import "package:image_editor/component/main_app_bar.dart";
import "package:image_editor/component/footer.dart";


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key : key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  XFile? image;

  @override
  Widget build (BuildContext context) {
    return Scaffold(
      body : Stack(
        fit : StackFit.expand,
        children : [
          renderBody(),
          MainAppBar(
            onPickIamge : onPickIamge,
            onSaveImage : onSaveImage,
            onDeleteItem : onDeleteItem,
          ),
        ],
      ),
    );
  }

  Widget renderBody() {
    if(image != null) {
      return Positioned.fill(
        child : InteractiveViewer(
          child : Image.file(
            File(image!.path),
            fit : Boxfit.cover,
          ),
        ),
      );
    } else {
      return Center(
        child : TextButton(
          style : TextButton.styleFrom(
            primary : Colors.grey,            
          ),
          onPressed : onPickImage,
          child : Text("Choose image");
        )
      )
    }
  }

  void onPickIamge () async {
    final image = await ImagePicker().pickImage(source : ImageSource.gallery);

    setState(() {
      this.image = image;
    });
  }

  void onSaveImage () {

  }

  void onDeleteItem () {

  }
}