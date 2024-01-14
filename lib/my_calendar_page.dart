import 'package:flutter/material.dart';
import 'package:flutter_toggle_tab/flutter_toggle_tab.dart';
import 'package:flutterapp_test/in_app_calendar_page.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class MyCalendarPage extends StatefulWidget {
  @override
  _MyCalendarPageState createState() => _MyCalendarPageState();
}

class _MyCalendarPageState extends State<MyCalendarPage> {

  DateTime _selectedDay = DateTime.now();
  DateTime _focusedDay = DateTime.now();

  int _tabSelectedIndexSelected = 0;

  List<DateTime> _selectedDays = [DateTime.now()];

  void _handleDaySelection(DateTime selectedDay) {
    setState(() {

      if (_selectedDays.contains(selectedDay)) {
        _selectedDays.remove(selectedDay);
      } else {
        _selectedDays.add(selectedDay);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.grey,
        title: Text('My Calendar'),
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
            selectionMode: DateRangePickerSelectionMode.range,
            onSelectionChanged: (DateRangePickerSelectionChangedArgs args) {
              setState(() {
                _selectedDays = args.value;
              });
            },
          ),
          // TableCalendar(
          //   focusedDay: _focusedDay,
          //   firstDay: DateTime(2022, 1, 1),
          //   lastDay: DateTime(2024, 12, 31),
          //   selectedDayPredicate: (day) {
          //     return isSameDay(_selectedDay, day);
          //   },
          //   onDaySelected: (selectedDay, focusedDay) {
          //     setState(() {
          //       _selectedDay = selectedDay;
          //       _focusedDay = focusedDay;
          //       _handleDaySelection(selectedDay);
          //     });
          //   },
          //   calendarFormat: CalendarFormat.week,
          //   startingDayOfWeek: StartingDayOfWeek.sunday,
          //   availableGestures: AvailableGestures.all,
          //   calendarBuilders: CalendarBuilders(
          //     markerBuilder: (context, date, events) {
          //       final isSelected = _selectedDays.contains(date);
          //       return Container(
          //         width: 30,
          //         height: 30,
          //         decoration: BoxDecoration(
          //           shape: BoxShape.circle,
          //           color: isSelected ? Colors.blue : null,
          //         ),
          //         child: Center(
          //           child: Text(
          //             date.day.toString(),
          //             style: TextStyle(
          //               color: isSelected ? Colors.white : null,
          //             ),
          //           ),
          //         ),
          //       );
          //     },
          //   ),
          // ),
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
                        CustomCard(
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

}


class CustomCard extends StatelessWidget {
  final String selectedDay;
  final String month;
  final int hrdCount;
  final int tech1Count;
  final int followUpCount;
  final int totalCount;

  CustomCard({
    required this.selectedDay,
    required this.month,
    required this.hrdCount,
    required this.tech1Count,
    required this.followUpCount,
    required this.totalCount,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
    itemCount: 7,
    itemBuilder: (context, index) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: InkWell(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => InAppCalendarPage(selectedDay: DateTime.now()),));
          },
          child: Card(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
            child:  Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 70.0,
                    width: 2.0,
                    color: Colors.red, // Vertical red line
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        selectedDay,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        month,
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  _buildColumn("HRD", hrdCount),
                  _buildColumn("Tech 1", tech1Count),
                  _buildColumn("Follow Up", followUpCount),

                  Column(
                    children: [
                      Container(
                        height: 40.0,
                        width: 40.0,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.black54,
                          border: Border.all(color: Colors.black12, width: 1.0),
                        ),
                        child: Center(
                          child: Text(
                            "10",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 8.0),
                      Text(
                        "Total",
                        style: TextStyle(
                          fontSize: 14.0,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  SizedBox()
                ],
              ),
            ),
          ),
        ),
      );
    },);
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

