import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:teamy/components/service/study_service.dart';
import 'package:teamy/pages/account/email_auth.dart';
import 'package:teamy/pages/account/email_login.dart';
import 'package:teamy/theme/style.dart';

class NewStudyStatus extends StatefulWidget {
  const NewStudyStatus({super.key});

  @override
  State<NewStudyStatus> createState() => _NewStudyStatusState();
}

class _NewStudyStatusState extends State<NewStudyStatus> {
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
          controller: studyNameController,
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

  final studyNameController = TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    final emailAuth = context.read<EmailAuth>();
    final user = emailAuth.currentUser()!;
    return Consumer<StudyService>(builder: (context, studyService, child) {
      return Scaffold(
        appBar: AppBar(
            title: Text(
              '새 스터디',
              style: TextStyle(color: headTextClr, letterSpacing: -1),
            ),
            actions: [
              TextButton(
                child: Text(
                  "로그아웃",
                  style: TextStyle(color: subTextClr),
                ),
                onPressed: () {
                  context.read<EmailAuth>().signOut();
                  print("유저가 로그아웃했습니다");
                  // 로그인 페이지로 이동
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => EmailLoginPage()),
                  );
                },
              ),
            ]),
        body: Container(
          padding: EdgeInsets.all(20),
          width: double.infinity,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            _studyName(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  height: 15,
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: bluishClr),
                    onPressed: () {
                      if (studyNameController.text.isNotEmpty) {
                        studyService.create(studyNameController.text, user.uid);
                        print('스터디가 등록됐습니다');
                      }
                    },
                    child: Text(
                      '스터디 등록',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    )),
                SizedBox(
                  height: 30,
                )
              ],
            ),
            Expanded(
              child: FutureBuilder<QuerySnapshot>(
                  future: studyService.read(user.uid),
                  builder: (context, snapshot) {
                    final docs = snapshot.data?.docs ?? [];
                    if (docs.isEmpty) {
                      return Center(
                        child: Text('스터디를 만들어주세요!'),
                      );
                    }
                    return ListView.builder(
                      itemCount: docs.length,
                      itemBuilder: (context, index) {
                        final doc = docs[index];
                        String study = doc.get('study');
                        bool isDone = doc.get('isDone');
                        return ListTile(
                          title: Text(
                            study,
                            style: TextStyle(
                              fontSize: 16,
                              color: isDone ? Colors.grey : Colors.black,
                              decoration: isDone
                                  ? TextDecoration.lineThrough
                                  : TextDecoration.none,
                            ),
                          ),
                          // 삭제 아이콘 버튼
                          trailing: IconButton(
                            icon: Icon(CupertinoIcons.delete),
                            onPressed: () {
                              studyService.delete(doc.id);
                            },
                          ),
                          onTap: () {
                            studyService.update(doc.id, !isDone);
                          },
                        );
                      },
                    );
                  }),
            ),
          ]),
        ),
      );
    });
  }
}
