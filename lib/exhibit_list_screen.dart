import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test_tast_kirkach_k/cubit/exhibit_cubit.dart';
import 'package:flutter_test_tast_kirkach_k/exhibit_list_item.dart';

class ExhibitListScreen extends StatelessWidget {
  const ExhibitListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ExhibitCubit exhibitCubit = context.read<ExhibitCubit>();
    exhibitCubit.getExhibits();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Exhibit List'),
      ),
      body: BlocBuilder<ExhibitCubit, ExhibitState>(
        builder: (context, state) {
          if (state is ExhibitLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is ExhibitLoaded) {
            return ListView.builder(
              itemCount: state.exhibits.length,
              itemBuilder: (context, index) {
                return ExhibitListItem(exhibit: state.exhibits[index]);
              },
            );
          } else if (state is ExhibitError) {
            return Center(
              child: Text(state.errorMessage),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
