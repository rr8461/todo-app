//import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:todo_app/constants/colors.dart';
import 'package:todo_app/models/todo.dart';
import 'package:todo_app/widgets/todo_item.dart';

class Home extends StatefulWidget {
   Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final items=ToDo.list();
  final controlx=TextEditingController();
  //for search function
  List<ToDo> listSearch=[];

  @override
  
     initState(){
      listSearch=items;
      super.initState();
    }
  //search
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cream,
      appBar: appBarSet(),
      body: Stack(
        children:[ Container(
         //width:300, height:100,margin: EdgeInsets.only(left:20,right:20,top:20,bottom: 550)
          padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 15),
          decoration: const BoxDecoration(
            color: cream,
            //borderRadius: BorderRadius.circular(20), 
          ),
          child: Column(
            children: [
              searchBarSet(),
              Expanded(
                child: ListView(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 20,bottom: 10),
                      child:const Text('All ToDos',style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.w500),),
                    ),
                    for(ToDo i in listSearch)
                      TodoItem(x: i,onChanged: _changeCheckbox,onDeleted:_ontapdelete), 
                      //x mera ek kind of empty function hai jisko pata h uska data type ToDo class ka hoga aur data b wahi hoga but 
                      //access i k through hora hai in items jisme list of values h class ToDo ki!!!!
                    // TodoItem(),
                    // TodoItem(),
                    // TodoItem(),
                    // TodoItem(),
                    // TodoItem(),
                    // TodoItem(),
                    // TodoItem(),
                    // TodoItem(),
                    // TodoItem(),
        
              
                  ],
                ),
              )
            ],
          ),
        ),
        Align(alignment: Alignment.bottomCenter,
        child:Row(children: [
          Expanded(child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            color: blue,
            child:TextField(
              controller: controlx,
              decoration: InputDecoration(hintText: 'Add a new item'),
            ),
          ),
          ),
          Container(
            //decoration: InputDecoration(opacity),
            color: red,
            child:IconButton(onPressed: () {
              additem(controlx.text);
             },icon:Icon(Icons.add,color: white,size:30),color: red.withOpacity(1)),
          )
        ],)
        ),
      ],
      ),
    );
  }

  void _changeCheckbox(ToDo z){
  setState(() {
  z.isDone=!z.isDone;
  //if tapped then true becomes false and vice versa ie line through to normal and vice versa
  });
  }

void _ontapdelete(String id){
  setState(() {
      items.removeWhere((element)=>element.id==id);

  });
  }

  void additem(String str){
    setState(() {
          items.add(ToDo(id: DateTime.now().millisecondsSinceEpoch.toString(), todoText: str));
    });
    controlx.clear();
  }


  void filterSearch(String key){
      List<ToDo> resultList=[];
      if(key.isEmpty){
          resultList=items;
      }
      else{
        resultList=items.where((element) => element.todoText!.toLowerCase().contains(key.toLowerCase())).toList();
      }
       setState(() {
    listSearch=resultList;
    // TODO: implement setState
   // super.setState(fn);
  });
  }


  Container searchBarSet() {
    return Container(
      
       padding: const EdgeInsets.symmetric(horizontal: 15),
          decoration: BoxDecoration(color: white,borderRadius: BorderRadius.circular(20)),
            child: TextField(
              onChanged: (value) => filterSearch(value),//value that is to be searched is passed to filterSearch function,
              textAlign: TextAlign.start,
              decoration: InputDecoration(
                //contentPadding: EdgeInsets.only(left: 40),
                prefixIcon: Icon(Icons.search, color: grey, size: 20),
                prefixIconConstraints:
                    BoxConstraints(maxHeight: 20, minWidth: 25),
                    border: InputBorder.none,
                    hintText: 'Search',
                    hintStyle: TextStyle(color: grey),
                    
                    //contentPadding: EdgeInsets.symmetric(horizontal: 100),
              ),
            ),
          );
  }

  AppBar appBarSet() {
    return AppBar(
      backgroundColor: red,
        title: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Icon(
          Icons.menu,
          color: grey,
          size: 30,
        ),
        Container(
          height: 40,
          width: 40,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset('assets/images/profile.jpeg'),
          ),
        ),
      ],
    ));
  }
}
