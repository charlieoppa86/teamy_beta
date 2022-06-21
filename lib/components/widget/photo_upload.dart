import 'dart:typed_data';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:teamy/theme/style.dart';

class PhotoUploadPage extends StatefulWidget {
  const PhotoUploadPage({Key? key}) : super(key: key);

  @override
  State<PhotoUploadPage> createState() => _PhotoUploadPageState();
}

class _PhotoUploadPageState extends State<PhotoUploadPage> {
  var albums = <AssetPathEntity>[];
  var headerTiltle = '';
  var imageList = <AssetEntity>[];
  AssetEntity? selectedImage;

  @override
  void initState() {
    super.initState();
    _loadPhotos();
  }

  void _loadPhotos() async {
    var result = await PhotoManager.requestPermissionExtend();
    if (result.isAuth) {
      albums = await PhotoManager.getAssetPathList(
          type: RequestType.image,
          filterOption: FilterOptionGroup(
              orders: [
                OrderOption(type: OrderOptionType.createDate, asc: false),
              ],
              imageOption: FilterOption(
                  sizeConstraint:
                      SizeConstraint(minHeight: 100, minWidth: 100))));
      albums.addAll([
        AssetPathEntity(id: '0', name: 'Favorite'),
        AssetPathEntity(id: '0', name: 'Popular'),
      ]);
      _loadData();
    } else {}
  }

  void _loadData() async {
    headerTiltle = albums.first.name;
    await _pagingPhoto();
    update();
  }

  Future<void> _pagingPhoto() async {
    var photos = await albums.first.getAssetListPaged(page: 0, size: 40);
    imageList.addAll(photos);
    selectedImage = imageList.first;
  }

  void update() => setState(() {});

  Widget _imagePreview() {
    var width = MediaQuery.of(context).size.width;
    return Container(
        width: width,
        height: width,
        color: lightBgClr,
        child: selectedImage == null
            ? Container()
            : _photoWidget(selectedImage!, width.toInt(), builder: (data) {
                return Image.memory(
                  data,
                  fit: BoxFit.cover,
                );
              }));
  }

  Widget _header() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              showModalBottomSheet(
                  context: context,
                  constraints: BoxConstraints(
                      maxHeight: MediaQuery.of(context).size.height -
                          MediaQuery.of(context).padding.top),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20))),
                  builder: (_) => Container(
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Center(
                                child: Container(
                                  margin: EdgeInsets.only(top: 10),
                                  width: 40,
                                  height: 5,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: headTextClr.withOpacity(0.6)),
                                ),
                              ),
                              Expanded(
                                child: SingleChildScrollView(
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      children: [
                                        ...List.generate(
                                            albums.length,
                                            (index) => Container(
                                                  padding: EdgeInsets.symmetric(
                                                      vertical: 15,
                                                      horizontal: 20),
                                                  child:
                                                      Text(albums[index].name),
                                                ))
                                      ]),
                                ),
                              )
                            ]),
                      ));
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text(
                    '갤러리',
                    style: TextStyle(
                        letterSpacing: -1,
                        color: headTextClr,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Icon(CupertinoIcons.chevron_down)
                ],
              ),
            ),
          ),
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: lightBgClr.withOpacity(0.7)),
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Row(children: [
                  Icon(CupertinoIcons.camera),
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                    '사진 찍기',
                    style: TextStyle(
                        letterSpacing: -1, color: Colors.black, fontSize: 16),
                  )
                ]),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _imageSelectList() {
    return GridView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: imageList.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisSpacing: 1,
            childAspectRatio: 1,
            crossAxisSpacing: 1,
            crossAxisCount: 4),
        itemBuilder: (BuildContext context, int index) {
          return _photoWidget(imageList[index], 200, builder: (data) {
            return GestureDetector(
              onTap: () {
                selectedImage = imageList[index];
                update();
              },
              child: Opacity(
                opacity: imageList[index] == selectedImage ? 0.3 : 1,
                child: Image.memory(
                  data,
                  fit: BoxFit.cover,
                ),
              ),
            );
          });
        });
  }

  Widget _photoWidget(AssetEntity asset, int size,
      {required Widget Function(Uint8List) builder}) {
    return FutureBuilder(
        future: asset.thumbnailDataWithSize(ThumbnailSize(size, size)),
        builder: (_, AsyncSnapshot<Uint8List?> snapshot) {
          if (snapshot.hasData) {
            return builder(snapshot.data!);
          } else {
            return Container();
          }
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: false,
          backgroundColor: lightBgClr,
          elevation: 0,
          leading: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
                CupertinoIcons.xmark,
                color: headTextClr,
              )),
          title: Text(
            '사진 선택',
            style: TextStyle(
                color: headTextClr,
                fontWeight: FontWeight.bold,
                letterSpacing: -1),
          ),
          actions: [
            GestureDetector(
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: Icon(
                    CupertinoIcons.forward,
                    color: headTextClr,
                  ),
                )),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
              children: [_imagePreview(), _header(), _imageSelectList()]),
        ));
  }
}
