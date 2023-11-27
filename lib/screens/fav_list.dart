import 'package:exercise/providers/webSeriesProvider.dart';
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
    return Scaffold(
      backgroundColor: Colors.tealAccent,
      body: ListView.builder(
          itemBuilder: (_,index){
        final currentwebseries=_mylist[index];
        return Card(
          key: ValueKey(currentwebseries.title),
          child: ListTile(
            title: Text(currentwebseries.title),
            subtitle: Text(currentwebseries.duration ?? 'No information'),
            trailing: InkWell(child: Text("Remove"),onTap: (){
              context.read<WebSeriesProvider>().removeFromList(currentwebseries);
            }),

          ),
        );
      },
          itemCount: _mylist.length

      ),
    );
  }
}
