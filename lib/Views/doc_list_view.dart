import 'dart:developer';

import 'package:ekam/Helpers/get_random_doc_image.dart';
import 'package:ekam/ViewModels/appointments_viewmodel.dart';
import 'package:ekam/ViewModels/doc_details_viewmodel.dart';
import 'package:ekam/Views/doc_detail/doc_details_view.dart';
import 'package:ekam/components/doc_info_card_widget.dart';
import 'package:ekam/components/empty_boxes.dart';
import 'package:ekam/model/doctor.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DocListView extends StatefulWidget {
  static const String id = "DocListView";
  const DocListView({Key? key}) : super(key: key);

  @override
  State<DocListView> createState() => _DocListViewState();
}

class _DocListViewState extends State<DocListView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        automaticallyImplyLeading: false,
        centerTitle: true,
        actions: [
          Consumer<DocDetailsViewModel>(
              builder: (context, docDetailsViewModel, _) {
            return PopupMenuButton<String>(
              icon: const Icon(Icons.filter_alt_outlined),
              itemBuilder: (context) {
                return [
                  ...docDetailsViewModel
                      .getDoctorSpecialities()
                      .map((e) => PopupMenuItem<String>(
                            child: Text(e),
                            value: e,
                          ))
                      .toList(),
                ];
              },
              onSelected: (String speciality) {
                log("selected $speciality");
                Provider.of<DocDetailsViewModel>(context, listen: false)
                    .filterDocBySpeciality(speciality);
              },
            );
          }),
        ],
      ),
      body: Consumer<DocDetailsViewModel>(
          builder: (context, docDetailsViewModel, _) {
        return ListView.builder(
          itemCount: docDetailsViewModel.filterdDoctorsList.length,
          itemBuilder: (context, index) {
            Doctor doctor = docDetailsViewModel.filterdDoctorsList[index];
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
                    const Spacer(),
                    IconButton(
                      onPressed: () {
                        Provider.of<AppointmentsViewModel>(context,
                                listen: false)
                            .setSelectedDoctor(doctor);
                        Navigator.pushNamed(context, DocDetailsView.id,
                            arguments: doctor.doctorName);
                      },
                      icon: const Icon(
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
