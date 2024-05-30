import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class TimePage extends StatefulWidget {
  @override
  _TimePageState createState() => _TimePageState();
}

class _TimePageState extends State<TimePage> {
  String selectedLocation = 'WIB';

  @override
  void initState() {
    super.initState();
    tz.initializeTimeZones();
  }

  String getTimeByLocation(String location) {
    DateTime now = DateTime.now();
    String time = DateFormat('HH:mm:ss').format(now);

    switch (location) {
      case 'WIB':
        return time;
      case 'WIT':
        return DateFormat('HH:mm:ss').format(now.add(Duration(hours: 1)));
      case 'WITA':
        return DateFormat('HH:mm:ss').format(now.add(Duration(hours: 2)));
      default:
        var locationTimeZone = tz.getLocation(location);
        var locationTime = tz.TZDateTime.from(now, locationTimeZone);
        return DateFormat('HH:mm:ss').format(locationTime);
    }
  }

  @override
  Widget build(BuildContext context) {
    DateTime currentDate = DateTime.now();
    String formattedDate = DateFormat('MMMM dd, yyyy').format(currentDate);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Time'),
        backgroundColor: const Color(0xFF1B1A55),
        centerTitle: true,
        titleTextStyle: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Current Time:',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 10),
            StreamBuilder(
              stream: Stream.periodic(Duration(seconds: 1)),
              builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                return Text(
                  getTimeByLocation(selectedLocation),
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                );
              },
            ),
            SizedBox(height: 10),
            Text(
              'Current Date:',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 10),
            Text(
              formattedDate,
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text(
              'Selected Location: $selectedLocation',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Select Location'),
                      content: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            ListTile(
                              title: Text('WIB'),
                              onTap: () {
                                setState(() {
                                  selectedLocation = 'WIB';
                                });
                                Navigator.pop(context);
                              },
                            ),
                            ListTile(
                              title: Text('WIT'),
                              onTap: () {
                                setState(() {
                                  selectedLocation = 'WIT';
                                });
                                Navigator.pop(context);
                              },
                            ),
                            ListTile(
                              title: Text('WITA'),
                              onTap: () {
                                setState(() {
                                  selectedLocation = 'WITA';
                                });
                                Navigator.pop(context);
                              },
                            ),
                            ListTile(
                              title: Text('Europe/London'),
                              onTap: () {
                                setState(() {
                                  selectedLocation = 'Europe/London';
                                });
                                Navigator.pop(context);
                              },
                            ),
                            ListTile(
                              title: Text('America/New_York'),
                              onTap: () {
                                setState(() {
                                  selectedLocation = 'America/New_York';
                                });
                                Navigator.pop(context);
                              },
                            ),
                            ListTile(
                              title: Text('Asia/Tokyo'),
                              onTap: () {
                                setState(() {
                                  selectedLocation = 'Asia/Tokyo';
                                });
                                Navigator.pop(context);
                              },
                            ),
                            ListTile(
                              title: Text('Australia/Sydney'),
                              onTap: () {
                                setState(() {
                                  selectedLocation = 'Australia/Sydney';
                                });
                                Navigator.pop(context);
                              },
                            ),
                            ListTile(
                              title: Text('Asia/Dubai'),
                              onTap: () {
                                setState(() {
                                  selectedLocation = 'Asia/Dubai';
                                });
                                Navigator.pop(context);
                              },
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
              child: Text('Change Location',
                  style: TextStyle(color: Colors.white)),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF1B1A55),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
