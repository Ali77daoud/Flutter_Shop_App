import 'package:agora_shop/shared/widgets/page_header.dart';
import 'package:flutter/material.dart';
import '../../shared/helpers/screen_size_utils.dart';
import 'components/add_address_widget.dart';
import 'components/addresses_widget.dart';

class AddressesPage extends StatelessWidget {
  const AddressesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      bottomNavigationBar: const AddAddressWidget(),
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: [
                const PageHeader(pageTitle: 'Addresses'),
                //////////////////
                SliverToBoxAdapter(
                  child: SizedBox(
                    height: getHeightInPercent(context, 3),
                  ),
                ),
                /////////////////////
                SliverToBoxAdapter(
                    child: ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: 10,
                        itemBuilder: (context, index) {
                          return AddressesWidget(
                            onTap: () {},
                            icon: index == 1
                                ? Icons.circle
                                : Icons.circle_outlined,
                          );
                        })),
              ])),
    ));
  }
}
