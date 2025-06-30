import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:keja_hunt/core/presentation/components/custom_network_image.dart';
import 'package:keja_hunt/core/utils/theme/colors.dart';

import '../bloc/agent_apartments_bloc.dart';

class AgentProfileApartments extends StatefulWidget {
  const AgentProfileApartments({super.key});

  @override
  State<AgentProfileApartments> createState() => _AgentProfileApartmentsState();
}

class _AgentProfileApartmentsState extends State<AgentProfileApartments> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AgentApartmentsBloc, AgentApartmentsState>(
      builder: (context, apartmentsState) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: MasonryGridView.count(
            crossAxisCount: 2,
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
            physics: AlwaysScrollableScrollPhysics(
              parent: BouncingScrollPhysics(),
            ),
            itemBuilder: (context, index) {
              return apartmentsState is AgentApartmentsSuccess
                  ? SizedBox(
                      width: 100,
                      height: (index % 5 + 1) * 100,
                      child: CustomNetworkImage(
                        url:
                            apartmentsState.apartments[index].coverImageUrl ??
                            '',
                        borderRadius: BorderRadius.circular(32),
                      ),
                    )
                  : Container(
                      width: 100,
                      height: (index % 5 + 1) * 100,
                      decoration: BoxDecoration(
                        color: redColor,
                        borderRadius: BorderRadius.circular(24),
                      ),
                    );
            },
            itemCount: apartmentsState is AgentApartmentsSuccess
                ? apartmentsState.apartments.length
                : 10,
          ),
        );
        return SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          sliver: SliverGrid(
            delegate: SliverChildBuilderDelegate(
              (context, index) => apartmentsState is AgentApartmentsSuccess
                  ? Container(
                      width: double.infinity,
                      height: double.infinity,
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.onPrimary,
                        borderRadius: BorderRadius.circular(32),
                      ),
                      child: CustomNetworkImage(
                        url:
                            apartmentsState.apartments[index].coverImageUrl ??
                            '',
                        borderRadius: BorderRadius.circular(32),
                      ),
                    )
                  : Container(
                      width: double.infinity,
                      height: double.infinity,
                      decoration: BoxDecoration(
                        color: redColor,
                        borderRadius: BorderRadius.circular(32),
                      ),
                      child: CustomNetworkImage(
                        url:
                            "https://images.unsplash.com/photo-1722421492323-eaf9c401befe?q=80&w=802&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                        borderRadius: BorderRadius.circular(32),
                      ),
                    ),
              childCount: apartmentsState is AgentApartmentsSuccess
                  ? apartmentsState.apartments.length
                  : 10,
            ),
            gridDelegate: SliverWovenGridDelegate.count(
              crossAxisCount: 2,
              mainAxisSpacing: 0,
              crossAxisSpacing: 0,
              pattern: [
                WovenGridTile(1),
                WovenGridTile(
                  5 / 7,
                  crossAxisRatio: 0.9,
                  alignment: AlignmentDirectional.centerEnd,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
