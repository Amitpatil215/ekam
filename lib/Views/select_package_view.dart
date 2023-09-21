import 'package:ekam/Views/review_summary_view.dart';
import 'package:ekam/components/buttons.dart';
import 'package:ekam/components/empty_boxes.dart';
import 'package:ekam/constants/textStyles.dart';
import 'package:flutter/material.dart';

class SelectPackageView extends StatefulWidget {
  static const String id = "SelectPackageView";
  const SelectPackageView({Key? key}) : super(key: key);

  @override
  _SelectPackageViewState createState() => _SelectPackageViewState();
}

class _SelectPackageViewState extends State<SelectPackageView> {
  String? _selectedDuration;
  String? _selectedPackage;
  final List<String> _durations = ['30 min', '1 hour', '2 hours'];
  final Map<String, IconData> _packages = {
    'Messaging': Icons.message,
    'Voice Call': Icons.call,
    'Video Call': Icons.video_call,
    'In Person': Icons.person,
  };
  final Map<String, String> _packagesDescriptions = {
    'Messaging': "Chat with Doctor",
    'Voice Call': "Voice call with doctor",
    'Video Call': "Video call with doctor",
    'In Person': "In Person visit with doctor",
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Package'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Column(
                children: <Widget>[
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('Select Duration',
                            style: TextStyleInventory.regBold
                                .copyWith(fontSize: 20)),
                        EmptyBox.verticalSpaceMedium,
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Expanded(
                            child: InputDecorator(
                              decoration: const InputDecoration(
                                  border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0)),
                              )),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton<String>(
                                  value: _selectedDuration,
                                  hint: Text('Select Duration'),
                                  isExpanded: true,
                                  isDense: true,
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      _selectedDuration = newValue;
                                    });
                                  },
                                  items: _durations
                                      .map<DropdownMenuItem<String>>(
                                          (String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Row(
                                        children: [
                                          Icon(Icons.access_time,
                                              color: Colors.blue.shade700),
                                          EmptyBox.horizontalSpaceTiny,
                                          Text(value,
                                              style:
                                                  TextStyleInventory.regBold),
                                        ],
                                      ),
                                    );
                                  }).toList(),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        Text('Select Package',
                            style: TextStyleInventory.regBold
                                .copyWith(fontSize: 20)),
                        EmptyBox.verticalSpaceMedium,
                        Column(
                          children: _packages.keys.map((String key) {
                            return PackageRowItemWidget(
                              title: key,
                              value: _packagesDescriptions[key] ?? '',
                              iconData: _packages[key],
                              trailing: Radio<String>(
                                value: key,
                                groupValue: _selectedPackage,
                                onChanged: (String? value) {
                                  setState(() {
                                    _selectedPackage = value;
                                  });
                                },
                              ),
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                  ),
                  HorizontalFullWidthButton(
                    text: 'Next',
                    onPressed: () {
                      Navigator.pushNamed(context, ReviewSummaryView.id);
                    },
                  ),
                  EmptyBox.verticalSpaceMedium
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PackageRowItemWidget extends StatelessWidget {
  final String title;
  final String value;
  final IconData? iconData;
  final Widget trailing;

  const PackageRowItemWidget({
    this.title = '',
    this.value = '',
    this.iconData,
    this.trailing = const SizedBox(),
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.blueGrey.shade100, width: 1.0),
        borderRadius: BorderRadius.circular(10.0),
      ),
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
      margin: EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: <Widget>[
          CircleAvatar(
            radius: 30,
            child: Icon(
              iconData,
              size: 25,
              color: Colors.blue.shade700,
            ),
          ),
          EmptyBox.horizontalSpaceSmall,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: TextStyleInventory.regBold),
              Text(
                value,
              ),
            ],
          ),
          Spacer(),
          trailing,
        ],
      ),
    );
  }
}
