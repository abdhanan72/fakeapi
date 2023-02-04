import 'package:api/apicall.dart';
import 'package:api/model.dart';
import 'package:flutter/material.dart';

class FetchApi extends StatefulWidget {
  const FetchApi({super.key});

  @override
  State<FetchApi> createState() => _FetchApiState();
}

class _FetchApiState extends State<FetchApi> {
  @override
  void initState() {
    super.initState();
    fetchdata();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder<List<FasalApi>>(
      future: fetchdata(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, mainAxisSpacing: 5, crossAxisSpacing: 5),
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              return Container(
                child: Text(snapshot.data![index].title),
              );
            },
          );
        } else {
          return const CircularProgressIndicator();
        }
      },
    ));
  }
}
