import 'package:flutter/material.dart';
import 'package:flutter_coding_challenge/Model/List_model.dart';

import 'package:flutter_coding_challenge/services/api_service.dart';
import 'package:flutter_coding_challenge/widgets/textStyleWidget.dart';

class DetailsPage extends StatefulWidget {
  final ListModel listModel;
  const DetailsPage({super.key, required this.listModel});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {

  ApiService apiService = ApiService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar:  AppBar(
        backgroundColor: Colors.green,
        title: const Text('Company Details',style: TextStyle(color: Colors.white),),
        actions: const [
          Icon(Icons.list, color: Colors.white),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 20,),
              Text(widget.listModel.companyName ?? 'No Title', style: ApppWidget.headerTextStyle()),
              SizedBox(height: 20,),
              Divider(color: Colors.black38,),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(widget.listModel.title ?? 'No Title', style: ApppWidget.semiBoldTextStyle()),
          Chip(
            elevation: 5,
            backgroundColor: Colors.white54,
            label: Text(
              'Salary: \$${widget.listModel.salary?.toString() ?? ''}',
              style: ApppWidget.semiBoldTextStyle(),
            ),

          )
                ],
              ),
              SizedBox(height: 15,),
              Text(widget.listModel.description ?? 'No Title', style: ApppWidget.lightTextStyle()),
              SizedBox(height: 15,),
              Divider(color: Colors.black38,),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Create Date:  ${widget.listModel.createDate?.toString() ?? ''}',
                    style: ApppWidget.lightBoldTextStyle(),
                  ),
                  Text(
                    'Deadline:  ${widget.listModel.deadline?.toString() ?? ''}',
                    style: ApppWidget.lightBoldTextStyle(),
                  ),


                ],
              ),
              SizedBox(height: 50,),
              Chip(
                elevation: 5,
                backgroundColor: Colors.white54,
                label: Text(
                  widget.listModel.applyUrl?.toString() ?? '',
                  style: ApppWidget.semiBoldTextStyle(),
                ),

              )
            ],
          ),
        )
      ),
    );
  }
}
