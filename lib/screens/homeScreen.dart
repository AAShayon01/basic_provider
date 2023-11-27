import 'package:exercise/providers/webSeriesProvider.dart';
import 'package:exercise/screens/fav_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  @override
  Widget build(BuildContext context) {
    var webseries=context.watch<WebSeriesProvider>().listWebseries;
    var myList=context.watch<WebSeriesProvider>().myList;
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(15.0),
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              InkWell(
                child: Container(
                  height: 50,
                  color: Colors.tealAccent,
                  child: Center(child: Text("My Fav List ${myList.length}")
                  ),

                ),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>MyfavList()));
                },
              ),
              Container(
                height: 100,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context,index){
                    final currentWebseries=webseries[index];
                    return Card(
                      shape:RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100)
                      ),
                      key: ValueKey(currentWebseries.title),
                      color: Colors.redAccent,
                      child: SizedBox(
                        width: 150.0,
                        height: 150.0,
                        // height: 250.0,
                        child: ListTile(
                          // minLeadingWidth: 25.0,
                          title: Text(currentWebseries.title,style: const TextStyle(color: Colors.white),),
                          subtitle:Text(currentWebseries.duration,
                            style: const TextStyle(
                            color: Colors.white
                          ),) ,
                          trailing: IconButton(
                            icon: const Icon(Icons.favorite,size: 30,),
                            color: myList.contains(currentWebseries) ? Colors.orange:Colors.white,
                            onPressed: () {
                              if(!myList.contains(currentWebseries)){
                             context.read<WebSeriesProvider>().addtoList(currentWebseries);
                              }
                              else
                              {
                             context.read<WebSeriesProvider>().removeFromList(currentWebseries);

                              }
                            },
                          ),
                        ),
                      ),
                    );
                  },
                  itemCount:webseries.length ,),
              )
            ],
          ),
        ),
      ),
    );
  }
}
