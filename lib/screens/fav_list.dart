import 'package:exercise/model/data_model.dart';
import 'package:exercise/providers/data_model_provider.dart';
import 'package:exercise/providers/webSeriesProvider.dart';
import 'package:exercise/util/utlis.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class MyfavList extends StatefulWidget {
  const MyfavList({super.key});

  @override
  State<MyfavList> createState() => _MyfavListState();
}

class _MyfavListState extends State<MyfavList> {
  @override
  Widget build(BuildContext context) {
    final _mylist=context.watch<WebSeriesProvider>().myList;

    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              height: 100,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                  itemBuilder: (_,index){
                final currentwebseries=_mylist[index];
                return Card(
                  key: ValueKey(currentwebseries.title),
                  child: SizedBox(
                    height: 250,
                    width: 200,
                    child: ListTile(
                      title: Text(currentwebseries.title),
                      subtitle: Text(currentwebseries.duration),
                      trailing: InkWell(child: Text("Remove"),onTap: (){
                        context.read<WebSeriesProvider>().removeFromList(currentwebseries);
                      }),

                    ),
                  ),
                );
              }, itemCount: _mylist.length

              ),
            ),
            Expanded(
              child: Consumer<DataModelProvider>(
                builder: (context,provider,child){
                  return Column(
                    children: [
                      Align(
                        alignment: Alignment.bottomRight,
                        child: FloatingActionButton(onPressed: () async {
                          List<DataModel> data=await DataUtil().getData();
                          provider.getDataModel(data);
                        }, child: Icon(Icons.refresh)),
                      ),
                      Expanded(
                        child: Container(
                          child:provider.datalist.isEmpty
                          ? Center(child: Text("There is no data to display"))
                              : ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                              itemBuilder: (context ,index){
                                final currentdata=provider.datalist[index];
                                return Card(
                                  key: ValueKey(currentdata.title),
                                  child: SizedBox(
                                    height: 115,
                                    width: 150,
                                    child: ListTile(
                                      leading: Text("${currentdata.id}"),
                                      title: Text(currentdata.title),
                                      subtitle: Text(currentdata.body),
                                    ),
                                  ),
                                );
                          },itemCount: provider.datalist.length,)
                        ),
                      ),

                    ],

                  );
                },
              )
            ),

          ],
        ),
      ),
    );
  }
}
