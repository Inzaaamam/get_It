import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:git_it_bloc/bloc/getbloc/get_bloc.dart';
import 'package:git_it_bloc/bloc/getbloc/get_event.dart';
import 'package:git_it_bloc/bloc/getbloc/get_state.dart';
import 'package:git_it_bloc/services/model_class.dart';
import 'package:git_it_bloc/utails/uatil.dart';

class ShowDataScreen extends StatefulWidget {
  const ShowDataScreen({super.key});

  @override
  State<ShowDataScreen> createState() => _ShowDataScreenState();
}

class _ShowDataScreenState extends State<ShowDataScreen> {
  @override
  void initState() {
    super.initState();
    context.read<GetBloc>().add(const  FatchedData());
  }
  @override
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Get_It Services', style: TextStyle(color: Colors.white),),
      ),
      // floatingActionButton: FloatingActionButton(
      //   child: const  Icon(Icons.refresh),
      //   onPressed: (){
      //   context.read<GetBloc>().add(const  FatchedData());
      // }, ),
      body: BlocBuilder<GetBloc, GetState>(
        builder: (context, state) {
          if (state.status == PostStatus.loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state.status == PostStatus.sucess) {
            return ListView.builder(
              itemCount: state.posts!.length,
              itemBuilder: (context, index) {
                GetItModelClass post = state.posts![index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    child: ListTile(
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                         Text('ID: ${post.id.toString()}'),
                         Text('Name: ${post.name.toString()}'),
                       Text('Email: ${post.email.toString()}'),
                       Text('Post: ${post.body.toString()}')
                      ],)
                      
                    ),
                  ),
                );
              },
            );
          } else if (state.status == PostStatus.fail) {
            return Center(
              child: Text('Failed to load data: ${state.error}'),
            );
          } else {
            return const Center(
              child: Text('No data available'),
            );
          }
        },
      ),
    );
  }
}