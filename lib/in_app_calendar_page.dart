import 'package:flutter/material.dart';
import 'package:flutter_toggle_tab/flutter_toggle_tab.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import 'my_calendar_page.dart';

class InAppCalendarPage extends StatefulWidget {
  final DateTime selectedDay;

  InAppCalendarPage({required this.selectedDay});

  @override
  State<InAppCalendarPage> createState() => _InAppCalendarPageState();
}

class _InAppCalendarPageState extends State<InAppCalendarPage> {
  int _tabSelectedIndexSelected = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.grey,
        title: Text('In App Calendar'),
        leading: Icon(Icons.arrow_back_outlined),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.blue),
                  borderRadius: BorderRadius.all(Radius.circular(5))
              ),
              child: FlutterToggleTab
                (
                width: 40,
                borderRadius: 5,
                selectedBackgroundColors: [Colors.blue],
                unSelectedBackgroundColors: [Colors.white],
                selectedIndex: _tabSelectedIndexSelected,
                selectedTextStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w600),
                unSelectedTextStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                    fontWeight: FontWeight.w400),
                labels: ["Day", "Week"],
                selectedLabelIndex: (index) {
                  setState(() {
                    _tabSelectedIndexSelected = index;
                  });
                },
              ),
            ),
          )

        ],
      ),
      body: Column(
        children: [
          SfDateRangePicker(  // Update this line
            view: DateRangePickerView.month,
            backgroundColor: Colors.grey.shade100,
            rangeSelectionColor: Colors.blue.shade100,
            endRangeSelectionColor: Colors.blue,
            startRangeSelectionColor: Colors.blue,
            selectionMode: DateRangePickerSelectionMode.single,
            onSelectionChanged: (DateRangePickerSelectionChangedArgs args) {
              setState(() {
                _tabSelectedIndexSelected = args.value;
              });
            },
          ),
          Expanded(
            child: DefaultTabController(
              length: 4,
              child: Column(
                children: [
                  Container(
                    constraints: BoxConstraints.expand(height: 50),
                    child: TabBar(
                      unselectedLabelColor: Colors.black54,
                      labelColor: Colors.black,
                      tabs: [
                        Tab(text: 'All'),
                        Tab(text: 'HRD'),
                        Tab(text: 'Tech 1'),
                        Tab(text: 'Follow Up'),
                      ],
                    ),
                  ),
                  Expanded(
                    child: TabBarView(
                      children: [
                        ListView.builder(
                          itemCount: 3
                          ,itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 15),
                            child: Container(
                              width: 200.0,
                              height: 200.0,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8.0),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.shade300,
                                    spreadRadius: 5,
                                    blurRadius: 7,
                                    offset: Offset(0, 3),
                                  ),
                                ],
                              ),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                       Column(
                                         mainAxisAlignment: MainAxisAlignment.start,
                                         crossAxisAlignment: CrossAxisAlignment.start,
                                         children: [
                                           Text("Balram, Naidu",
                                             style: TextStyle(
                                                 color: Colors.black87,
                                                 fontSize: 16
                                             ),),
                                           Text("ID: LOREM1343545",
                                             style: TextStyle(
                                                 color: Colors.grey,
                                                 fontSize: 16
                                             ),),
                                           Row(
                                              children: [
                                                Text("Offered: ",
                                                  style: TextStyle(
                                                      color: Colors.grey,
                                                      fontSize: 16
                                                  ),),
                                                Text("₹x,xx,xxx",
                                                  style: TextStyle(
                                                      color: Colors.black87,
                                                      fontSize: 16
                                                  ),)
                                              ],
                                           ),
                                           Row(
                                             children: [
                                               Text("Current: ",
                                                 style: TextStyle(
                                                     color: Colors.grey,
                                                     fontSize: 16
                                                 ),),
                                               Text("₹x,xx,xxx",
                                                 style: TextStyle(
                                                     color: Colors.black87,
                                                     fontSize: 16
                                                 ),)
                                             ],
                                           ),
                                           Text("• Medium Priority",
                                             style: TextStyle(
                                                 color: Colors.orange,
                                                 fontSize: 14
                                             ),)
                                         ],
                                       ),
                                    Center(
                                      child: ClipOval(
                                        child: Card(
                                          color: Colors.white,
                                          elevation: 5.0,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(50.0),
                                          ),
                                          child: Container(
                                            width: 50.0,
                                            height: 50.0,
                                            child: Center(
                                              child: Icon(
                                                Icons.phone,
                                                size: 35.0,
                                                color: Colors.blue, // Adjust the color as needed
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      color: Colors.grey.shade400,
                                      height: 1,
                                      width: double.infinity,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          children: [

                                            Text("Due Date",
                                              style: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 14
                                              ),),

                                            Text("05 Jan 23",
                                              style: TextStyle(
                                                  color: Colors.black87,
                                                  fontSize: 14
                                              ),)

                                          ],
                                        ),
                                        Column(
                                          children: [

                                            Text("Level",
                                              style: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 14
                                              ),),

                                            Text("10",
                                              style: TextStyle(
                                                  color: Colors.black87,
                                                  fontSize: 14
                                              ),)

                                          ],
                                        ),
                                        Column(
                                          children: [

                                            Text("Days Left",
                                              style: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 14
                                              ),),

                                            Text("92",
                                              style: TextStyle(
                                                  color: Colors.black87,
                                                  fontSize: 14
                                              ),)

                                          ],
                                        )

                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        },),
                        CustomCard(
                          selectedDay: "Mon",
                          month: "Jan",
                          hrdCount: 10,
                          tech1Count: 15,
                          followUpCount: 5,
                          totalCount: 30,
                        ),
                        CustomCard(
                          selectedDay: "Mon",
                          month: "Jan",
                          hrdCount: 10,
                          tech1Count: 15,
                          followUpCount: 5,
                          totalCount: 30,
                        ), CustomCard(
                          selectedDay: "Mon",
                          month: "Jan",
                          hrdCount: 10,
                          tech1Count: 15,
                          followUpCount: 5,
                          totalCount: 30,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );

  }

  Widget _buildColumn(String label, int count) {
    return Column(
      children: [
        Container(
          height: 40.0,
          width: 40.0,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Colors.grey.shade400, width: 1.0),
          ),
          child: Center(
            child: Text(
              count.toString(),
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black54,
              ),
            ),
          ),
        ),
        SizedBox(height: 8.0),
        Text(
          label,
          style: TextStyle(
            fontSize: 14.0,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}
