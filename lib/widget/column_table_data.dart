import 'package:flutter/material.dart';

class ColumnDataTable extends StatelessWidget {
  final String titleColumn;
  List<String> data = [];
  List<Widget> widgets = [];
  ColumnDataTable({Key? key, required this.titleColumn, List<String>? data, List<Widget>? widgets}):super(key: key){
    if(data!=null){
      this!.data = data;
    }
    if(widgets!=null){
      this!.widgets = widgets;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        titleColumnWidget(),
        const Divider(
          color: Colors.black,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: dataColumnWidget(),
        )
      ],
    );
  }

  Widget titleColumnWidget(){
    return Container(
      child: Text(
        titleColumn,
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, fontFamily: 'Bungee'),
        textAlign: TextAlign.center,
      ),
    );
  }

  List<Widget> dataColumnWidget(){
    List<Widget> dataColumn = [];

    if(data.isNotEmpty){
      for(var element in data){
        dataColumn.add(
            Container(
              margin: const EdgeInsets.symmetric(vertical: 20),
              child: Text(
                element,
                style: const TextStyle(fontSize: 20),
                textAlign: TextAlign.center,
              ),
            )
        );
      }
    }else if(widgets.isNotEmpty){
      for(var element in widgets){
        dataColumn.add(
            Container(
              margin: const EdgeInsets.symmetric(vertical: 20),
              child: element
            )
        );
      }
    }

    return dataColumn;
  }
}
