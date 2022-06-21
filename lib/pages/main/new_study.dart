import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:teamy/components/widget/photo_upload.dart';
import 'package:teamy/theme/style.dart';

enum studyFormat { OFFLINE, ONLINE }

class NewStudyPage extends StatefulWidget {
  const NewStudyPage({super.key});

  @override
  State<NewStudyPage> createState() => _NewStudyPageState();
}

class _NewStudyPageState extends State<NewStudyPage> {
  Widget _studyThumbnail() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(
        '대표 이미지',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
      SizedBox(
        height: 5,
      ),
      GestureDetector(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => PhotoUploadPage()));
        },
        child: Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
              color: headTextClr.withOpacity(0.1),
              borderRadius: BorderRadius.circular(10)),
          child: Center(child: Icon(CupertinoIcons.camera)),
        ),
      ),
    ]);
  }

  Widget _studyName() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '스터디명',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        SizedBox(
          height: 5,
        ),
        TextFormField(
          maxLength: 20,
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
              hintText: '스터디 이름을 지어주세요',
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: headTextClr))),
        ),
      ],
    );
  }

  Widget _studyMinDesc() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '스터디 요약',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        SizedBox(
          height: 5,
        ),
        TextFormField(
          maxLength: 20,
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
              hintText: '스터디에 대한 짧은 설명을 적어주세요',
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: headTextClr))),
        ),
      ],
    );
  }

  Widget _studyCategory() {
    List<String> categories = ['독서', '운동', '공부'];
    String? selectedItem = '공부';

    return Column(
      children: [
        Text(
          '카테고리',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        SizedBox(
          height: 5,
        ),
        DropdownButton<String>(
            value: selectedItem,
            items: categories
                .map((item) => DropdownMenuItem(
                    value: item,
                    child: Text(
                      item,
                      style: TextStyle(fontSize: 18),
                    )))
                .toList(),
            onChanged: (item) => setState(() => selectedItem = item))
      ],
    );
  }

  Widget _studyFormat() {
    studyFormat _value = studyFormat.OFFLINE;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '스터디 포맷',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        SizedBox(
          height: 5,
        ),
        RadioListTile(
            value: studyFormat.OFFLINE,
            title: Text('오프라인'),
            groupValue: _value,
            onChanged: (studyFormat? val) {
              setState(() {
                _value = val!;
              });
            }),
        RadioListTile(
            value: studyFormat.ONLINE,
            title: Text('온라인'),
            groupValue: _value,
            onChanged: (studyFormat? val) {
              setState(() {
                _value = val!;
              });
            })
      ],
    );
  }

  Widget _studyLocation() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '스터디 위치',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        SizedBox(
          height: 5,
        ),
        TextFormField(
          maxLength: 10,
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
              hintText: '00시 00구, 혹은 줌, 구글밋으로 적어주세요',
              counterText: '',
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: headTextClr))),
        ),
      ],
    );
  }

  Widget _studyPrice() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '스터디 비용',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        SizedBox(
          height: 5,
        ),
        TextFormField(
          maxLength: 10,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
              hintText: '1회당 비용을 입력해 주세요',
              counterText: '',
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: headTextClr))),
        ),
      ],
    );
  }

  Widget _studyMaxDesc() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '스터디 상세 정보',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        SizedBox(
          height: 5,
        ),
        TextFormField(
          minLines: 10,
          maxLines: 20,
          maxLength: 500,
          keyboardType: TextInputType.multiline,
          decoration: InputDecoration(
              hintText: '스터디를 자유롭게 소개해보세요',
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: headTextClr))),
        ),
      ],
    );
  }

  Widget _leaderName() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '스터디 리더',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        SizedBox(
          height: 5,
        ),
        TextFormField(
          maxLength: 10,
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
              hintText: '리더 이름을 지어주세요',
              counterText: '',
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: headTextClr))),
        ),
      ],
    );
  }

  Widget _leaderInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '리더 한줄 소개',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        SizedBox(
          height: 5,
        ),
        TextFormField(
          maxLength: 10,
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
              hintText: '당신에 대해 짧게 표현해주세요',
              counterText: '',
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: headTextClr))),
        ),
      ],
    );
  }

  Widget _leaderThumbnail() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '리더 프로필',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        SizedBox(
          height: 5,
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => PhotoUploadPage()));
          },
          child: Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
                color: headTextClr.withOpacity(0.1),
                borderRadius: BorderRadius.circular(10)),
            child: Center(child: Icon(CupertinoIcons.camera)),
          ),
        ),
      ],
    );
  }

  Widget _studyApplication() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '신청 링크',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        SizedBox(
          height: 5,
        ),
        TextFormField(
          maxLength: 10,
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
              hintText: '오픈 채팅방 링크 등을 넣어주세요',
              counterText: '',
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: headTextClr))),
        ),
      ],
    );
  }

  final textController1 = TextEditingController(text: '');
  final textController2 = TextEditingController(text: '');
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
            appBar: AppBar(
              iconTheme: IconThemeData(color: headTextClr),
              centerTitle: false,
              title: Image.asset(
                'assets/logo.png',
                fit: BoxFit.cover,
                height: 33,
              ),
              actions: [],
              elevation: 0,
            ),
            body: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.all(25),
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '새 스터디',
                      style: TextStyle(
                          fontSize: 26,
                          letterSpacing: -2,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _studyThumbnail(),
                        SizedBox(
                          height: 20,
                        ),
                        _studyName(),
                        SizedBox(
                          height: 20,
                        ),
                        _studyMinDesc(),
                        SizedBox(
                          height: 20,
                        ),
                        _studyCategory(),
                        SizedBox(
                          height: 20,
                        ),
                        _studyFormat(),
                        SizedBox(
                          height: 20,
                        ),
                        _studyLocation(),
                        SizedBox(
                          height: 20,
                        ),
                        _studyPrice(),
                        SizedBox(
                          height: 20,
                        ),
                        _studyMaxDesc(),
                        SizedBox(
                          height: 20,
                        ),
                        _leaderName(),
                        SizedBox(
                          height: 20,
                        ),
                        _leaderInfo(),
                        SizedBox(
                          height: 20,
                        ),
                        _leaderThumbnail(),
                        SizedBox(
                          height: 20,
                        ),
                        _studyApplication(),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          ElevatedButton(
                              style:
                                  ElevatedButton.styleFrom(primary: bluishClr),
                              onPressed: () {},
                              child: Text(
                                '스터디 등록',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              )),
                          TextButton(
                              onPressed: () {},
                              child: Text(
                                '스터디 삭제',
                                style: TextStyle(color: Colors.red),
                              )),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )),
      ),
    );
  }
}
