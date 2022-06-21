import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:teamy/components/service/study_service.dart';
import 'package:teamy/pages/account/email_auth.dart';
import 'package:teamy/pages/main/new_study.dart';
import 'package:teamy/theme/style.dart';

class StudyListStatus extends StatefulWidget {
  StudyListStatus({Key? key}) : super(key: key);

  @override
  State<StudyListStatus> createState() => _StudyListStatusState();
}

class _StudyListStatusState extends State<StudyListStatus> {
  @override
  Widget build(BuildContext context) {
    final emailAuth = context.read<EmailAuth>();
    final user = emailAuth.currentUser()!;

    return Consumer<StudyService>(builder: (context, studyService, child) {
      return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: headTextClr),
          centerTitle: false,
          title: Image.asset(
            'assets/logo.png',
            fit: BoxFit.cover,
            height: 33,
          ),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => NewStudyPage()));
                },
                child: Text(
                  '새 스터디',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ))
          ],
          elevation: 0,
        ),
        body: Expanded(
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
      );
    });
  }
}
