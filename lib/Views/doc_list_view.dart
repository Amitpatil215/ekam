import 'package:ekam/Helpers/get_random_doc_image.dart';
import 'package:ekam/Views/doc_details_view.dart';
import 'package:ekam/components/doc_info_card_widget.dart';
import 'package:ekam/components/empty_boxes.dart';
import 'package:flutter/material.dart';

class DocListView extends StatefulWidget {
  static const String id = "DocListView";
  const DocListView({Key? key}) : super(key: key);

  @override
  _DocListViewState createState() => _DocListViewState();
}

class _DocListViewState extends State<DocListView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              child: Row(
                children: [
                  DocInfoCardWidget(
                    docName: 'Dr. Mukesh Ambani',
                    docSpeciality: 'Psychiatrist',
                    docLocation: 'UK, US western street',
                    fallBackUrl: getRandomDocImage(),
                    profileUrl: "",
                  ),
                  Spacer(),
                  IconButton(
                    onPressed: () {
                      Navigator.pushNamed(context, DocDetailsView.id);
                    },
                    icon: Icon(
                      Icons.arrow_forward_ios,
                      size: 20,
                    ),
                  ),
                  EmptyBox.horizontalSpaceMedium,
                ],
              ),
              onTap: () {
                Navigator.pushNamed(context, DocDetailsView.id);
              },
            ),
          );
        },
      ),
    );
  }
}
