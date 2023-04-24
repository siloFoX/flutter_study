import "package:flutter/material.dart";
import "package:flutter/rendering.dart";
import "package:image_picker/image_picker.dart";
import "dart.io";


import "package:image_editor/component/main_app_bar.dart";
import "package:image_editor/component/footer.dart";
import "package:image_editor/component/emoticon_sticker.dart";

import "package:image_editor/model/sticker_model.dart";


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key : key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  XFile? image;
  Set<StickerModel> stickers = {};
  String? selectedId;
  GlobalKey imgKey = GlobalKey();

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
          if (image != null) {
            Positioned(
              bottom : 0,
              left : 0,
              right : 0,
              child : Footer(
                onEmoticonTap : onEmoticonTap,
              ),
            ),
          }
        ],
      ),
    );
  }

  Widget renderBody() {
    if(image != null) {
      return RepaintBoundary(
        key : imgKey,
        child : Positioned.fill(
          child : InteractiveViewer(
            child : Stack(
              fit : StackFit.expand,
              children : [
                Image.file(
                  File(image!.path),
                  fit : BoxFit.cover,
                ),
                ...Stickers.map((sticker) => Center(
                  child : EmoticonSticker(
                    key : ObjectKey(sticker.id),
                    ontransform : () {
                      onTransform(sticker.id);
                    },
                    imgPath : sticker.imgPath,
                    isSelected : selectedId == sticker.id,
                  ),
                ),
                ),
              ],
            ),
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
    RenderRepiantBoundary boundary = imgKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
  }

  void onDeleteItem () async {
    setState(() {
      stickers = stickers.where((sticker) => sticker.id != selectedId).toSet();
    });
  }

  void onEmoticonTap (int index) async {
    setState(() {
      stickers = {
        ...stickers,
        StickerModel(
          id : Uuid().v4(),
          imgPath : "asset/img/emoticon_$index.png",
        ),
      }; // set 인데 왜 ';' 붙이는걸까?
    });
  }

  void onTransform (string id) {
    setState(() {
      selectedId = id;
    });
  }


}