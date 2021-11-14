
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;


class StatisticsPage  extends StatefulWidget {
  @override
  _MyClassState createState() => _MyClassState();
}

class _MyClassState extends State< StatisticsPage> {
  bool pressGeoON = false;
  bool cmbscritta = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFEDE7F6),
        body:Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            SizedBox(
              width: 450.0,
              height: 480.0,
              child:  HorizontalBarChart.withSampleData(),),
            RaisedButton(
                shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(25.0),
                    side: BorderSide(color: Colors.white)),
                //color: pressGeoON ? Colors.deepOrange : Colors.indigo,
                color: pressGeoON ? Colors.red : Colors.green,
                //textColor: Colors.white,
                child: cmbscritta ? Text("Watch Out! Your expenses have exceeded your budget",textAlign: TextAlign.center, style: new TextStyle(fontSize: 18.0, color: Colors.white),)
                   : Text("Well done! You are spending within your budget" ,textAlign: TextAlign.center,style: new TextStyle(fontSize: 19.0, color: Colors.white),),
               // Text("Your expenses have exceeded the guide.We recommend you review your expenses",textAlign: TextAlign.center, style: new TextStyle(fontSize: 18.0, color: Colors.white),)
                //:Text("Watch out!Your expenses is almost reaching your allocated budget." ,textAlign: TextAlign.center,style: new TextStyle(fontSize: 19.0, color: Colors.white),),

                onPressed: () {
                  setState(() {
                    pressGeoON = !pressGeoON;
                    cmbscritta = !cmbscritta;
                  });
                }
            ),

          ],  )

    );


  }
}


class HorizontalBarChart extends StatelessWidget {
  final List<charts.Series> seriesList;
  final bool animate;

  HorizontalBarChart(this.seriesList, {this.animate});

  /// Creates a [BarChart] with sample data and no transition.
  factory HorizontalBarChart.withSampleData() {
    return new HorizontalBarChart(
      _createSampleData(),
      // Disable animations for image tests.
      animate: true,
    );
  }


  @override
  Widget build(BuildContext context) {
    // For horizontal bar charts, set the [vertical] flag to false.
    return new charts.BarChart(
      seriesList,
      animate: animate,
      barGroupingType: charts.BarGroupingType.grouped,
      vertical: false,
      domainAxis: new charts.OrdinalAxisSpec(
          renderSpec: new charts.SmallTickRendererSpec(

            // Tick and Label styling here.
            labelStyle: new charts.TextStyleSpec(
                fontSize: 15, // size in Pts.
                color: charts.MaterialPalette.black),

            // Change the line colors to match text color.
            //lineStyle: new charts.LineStyleSpec(
            // color: charts.MaterialPalette.black)
          )),

      /// Assign a custom style for the measure axis.
      primaryMeasureAxis: new charts.NumericAxisSpec(
          renderSpec: new charts.GridlineRendererSpec(

            // Tick and Label styling here.
            labelStyle: new charts.TextStyleSpec(
                fontSize: 15, // size in Pts.
                color: charts.MaterialPalette.black),

            // Change the line colors to match text color.
            //  lineStyle: new charts.LineStyleSpec(
            // color: charts.MaterialPalette.black)
          )),

      behaviors: [
        new charts.SeriesLegend(

          //position: charts.BehaviorPosition.end,

          //outsideJustification: charts.OutsideJustification.endDrawArea,

          //horizontalFirst: false,

          //desiredMaxRows: 2,

          // cellPadding: new EdgeInsets.all(16.0),

          entryTextStyle: charts.TextStyleSpec(
              color: charts.Color(r: 0, g: 0, b: 0),
              //fontFamily: 'T',
              fontSize: 16),
        )

      ],

    );
  }

  /// Create series list with multiple series
  static List<charts.Series<Statistics, String>> _createSampleData() {

    final budgetData = [
      new Statistics ('Food', 500),
      new Statistics('Housing', 400),
      new Statistics('Health', 200),
      new Statistics('Transport', 200),
      new Statistics('Utilities', 200),
      new Statistics('Savings', 300),
      new Statistics('Care', 50),
      new Statistics('Ad Hoc', 150),
      new Statistics('Social',100),
      new Statistics('Discretionary', 200),
    ];


    final expensesData = [
      new Statistics ('Food', 480),
      new Statistics('Housing', 300),
      new Statistics('Health', 100),
      new Statistics('Transport', 100),
      new Statistics('Utilities', 300),
      new Statistics('Savings',350 ),
      new Statistics('Care', 30),
      new Statistics('Ad Hoc', 90),
      new Statistics('Social', 50),
      new Statistics('Discretionary', 300),
    ];

    return [

      new charts.Series<Statistics , String>(
        id: 'Budget',
        domainFn: (Statistics  data, _) => data.category,
        measureFn: (Statistics  data, _) => data.spending,
        data: budgetData,
        colorFn: (_, __) => charts.MaterialPalette.cyan.shadeDefault,
      ),
      new charts.Series<Statistics , String>(
        id: 'Expenses',
        domainFn: (Statistics  data, _) => data.category,
        measureFn: (Statistics  data, _) => data.spending,
        data: expensesData,
        colorFn: (_, __) => charts.MaterialPalette.indigo.shadeDefault,
      ),
    ];
  }
}

/// Sample ordinal data type.
class  Statistics {
  final String category;
  final int spending;

  Statistics(this.category, this.spending);
}


