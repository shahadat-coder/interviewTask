import 'package:flutter/material.dart';
import 'package:flutter_coding_challenge/Model/List_model.dart';
import 'package:flutter_coding_challenge/services/api_service.dart';
import 'package:flutter_coding_challenge/views/details_page.dart';
import 'package:flutter_coding_challenge/widgets/textStyleWidget.dart';

class ListPage extends StatefulWidget {
  const ListPage({super.key});

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  ApiService apiService = ApiService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text(
          'Company List',
          style: TextStyle(color: Colors.white),
        ),
        actions: const [
          Icon(Icons.list, color: Colors.white),
        ],
      ),
      body: SafeArea(
        child: FutureBuilder<List<ListModel>>(
          future: apiService.getListData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(
                child: Text(
                  'Error occurred: ${snapshot.error}',
                  style: const TextStyle(color: Colors.red),
                ),
              );
            } else if (snapshot.hasData) {
              List<ListModel>? listModels = snapshot.data;
              if (listModels == null || listModels.isEmpty) {
                return const Center(child: Text('No data available.'));
              }

              return ListView.separated(
                itemCount: listModels.length,
                itemBuilder: (context, index) {
                  final item = listModels[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailsPage(listModel: item), // Fixed: Pass the current item
                        ),
                      );
                    },
                    child: ListTile(
                      title: Text(
                        item.title ?? 'No Title',
                        style: ApppWidget.boldTextStyle(),
                      ),
                      subtitle: Text(
                        item.description ?? 'No Description',
                        style: ApppWidget.lightTextStyle(),
                      ),
                      trailing: Text(
                        item.salary != null ? '\$${item.salary}' : 'No Salary',
                        style: ApppWidget.semiBoldTextStyle(),
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return const Divider(color: Colors.grey); // Added const
                },
              );
            } else {
              return const Center(child: Text('Unexpected error.'));
            }
          },
        ),
      ),
    );
  }
}