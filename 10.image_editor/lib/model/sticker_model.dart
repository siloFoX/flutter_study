class StickerModel {
    final String id;
    final String imgPath;

    StickerModel({
        required this.id;
        required this.imgPath;
    });

    @override
    bool operator == (Object other) {
        return (other as StickerModel).id == this.id; // 당연히 this 가능하겠지?
    }

    @override
    int get hashCode => this.id.hasCode;
}