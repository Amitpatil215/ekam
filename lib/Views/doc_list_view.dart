import 'package:ekam/Helpers/get_random_doc_image.dart';
import 'package:ekam/ViewModels/appointments_viewmodel.dart';
import 'package:ekam/ViewModels/doc_details_viewmodel.dart';
import 'package:ekam/Views/doc_details_view.dart';
import 'package:ekam/components/doc_info_card_widget.dart';
import 'package:ekam/components/empty_boxes.dart';
import 'package:ekam/model/doctor.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
      body: Consumer<DocDetailsViewModel>(
          builder: (context, docDetailsViewModel, _) {
        return ListView.builder(
          itemCount: docDetailsViewModel.doctorsList.length,
          itemBuilder: (context, index) {
            Doctor doctor = docDetailsViewModel.doctorsList[index];
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                child: Row(
                  children: [
                    DocInfoCardWidget(
                      docName: doctor.doctorName,
                      docSpeciality: doctor.speciality,
                      docLocation: doctor.location,
                      fallBackUrl: doctor.fallBackUrl,
                      profileUrl: doctor.image,
                    ),
                    Spacer(),
                    IconButton(
                      onPressed: () {
                        Provider.of<AppointmentsViewModel>(context,
                                listen: false)
                            .setSelectedDoctor(doctor);
                        Navigator.pushNamed(context, DocDetailsView.id,
                            arguments: doctor.doctorName);
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
                  Provider.of<AppointmentsViewModel>(context, listen: false)
                      .setSelectedDoctor(doctor);
                  Navigator.pushNamed(context, DocDetailsView.id,
                      arguments: doctor.doctorName);
                },
              ),
            );
          },
        );
      }),
    );
  }
}
