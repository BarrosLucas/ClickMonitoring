import 'package:embarcados/models/order/OrderModel.dart';
import 'package:embarcados/ui/history/controller.dart';
import 'package:embarcados/widget/chart.dart';
import 'package:embarcados/widget/column_table_data.dart';
import 'package:embarcados/widget/line_chart.dart';
import 'package:embarcados/widget/title.dart';
import 'package:flutter/material.dart';

class History extends StatefulWidget {
  final OrderModel orderModel;
  const History({Key? key, required this.orderModel}) : super(key: key);

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  Controller controller = Controller();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
        future: controller.loadDataHistory(widget.orderModel),
        builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
          if(snapshot.hasData){
            return body(context);
          }else{
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        }

    );
  }

  Widget body(BuildContext context){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            TitlePage(title: "HISTÓRICO"),
          ],
        ),
        Expanded(child: Container(
          width: MediaQuery.of(context).size.width,
          child: SingleChildScrollView(
            child: Column(
              children: [
                getChart(),
                getTable(),
                Container(height: 20,)
              ],
            ),
          ),
        ))

      ],
    );
  }

  Widget getChart(){
    return Container(
      color: const Color(0xfff0f0f0),
      padding: const EdgeInsets.all(15),
      child: ChartContainer(
        title: 'Line Chart',
        color: Colors.white,
        chart: LineChartContent(measures: controller.measures,),
      ),
    );
  }

  Widget getTable(){
    return Container(
      margin: const EdgeInsets.only(left: 50,right: 50,top: 30),
      height: 300,
      padding: const EdgeInsets.only(top: 20),
      decoration: BoxDecoration(
          color: const Color(0xFFFFFFFF),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.shade600,
                spreadRadius: 1,
                blurRadius: 2
            )
          ]
      ),
      child: SingleChildScrollView(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: ColumnDataTable(titleColumn: "HORÁRIO", data: controller.times),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: ColumnDataTable(titleColumn: "TEMPERATURAS", data: controller.temperature),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: ColumnDataTable(titleColumn: "SAÚDE", data: controller.health),
            ),
          ],
        ),
      )
    );
  }

}
