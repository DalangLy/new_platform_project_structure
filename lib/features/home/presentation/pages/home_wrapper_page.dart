import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/core_export.dart';
import '../../home_export.dart';

class HomeWrapperPage extends StatefulWidget {
  const HomeWrapperPage({Key? key}) : super(key: key);

  @override
  State<HomeWrapperPage> createState() => _HomeWrapperPageState();
}

class _HomeWrapperPageState extends State<HomeWrapperPage> {
  final List<MainNavigationItem> _navigationItems = const <MainNavigationItem>[
    MainNavigationItem(title: 'Dashboard', iconData: Icons.speed, path: '',),
    MainNavigationItem(title: 'Item', iconData: Icons.category, path: 'items', children: <MainNavigationItem>[
      MainNavigationItem(title: 'Items', iconData: Icons.title, path: 'items',),
      MainNavigationItem(title: 'Item Groups', iconData: Icons.group_work, path: 'item_groups',),
      MainNavigationItem(title: 'Item Types', iconData: Icons.format_align_center, path: 'item_types',),
      MainNavigationItem(title: 'Item Sources', iconData: Icons.raw_on, path: 'item_sources',),
      MainNavigationItem(title: 'Item Tax Duties', iconData: Icons.price_change, path: 'item_tax_duties',),
      MainNavigationItem(title: 'Sizes', iconData: Icons.line_weight, path: 'item_sizes',),
      MainNavigationItem(title: 'Item SKUs', iconData: Icons.receipt, path: 'item-sku',),
      MainNavigationItem(title: 'Item Prices', iconData: Icons.money, path: 'item_prices',),
      MainNavigationItem(title: 'Item Classes', iconData: Icons.grading, path: 'item-class',),
    ]),
    MainNavigationItem(title: 'Period', iconData: Icons.schedule, path: 'period',),
    MainNavigationItem(title: 'Record Status Type', iconData: Icons.fiber_new, path: 'record-status-type',
      children: <MainNavigationItem>[
        MainNavigationItem(title: 'Record Status Type', iconData: Icons.fiber_new, path: 'record-status-type',),
        MainNavigationItem(title: 'Record Status Type Subscripting', iconData: Icons.new_releases, path: 'record-status-type-subscripting',),
      ],
    ),
    MainNavigationItem(title: 'Reason Code', iconData: Icons.info, path: 'reason-code',),
    MainNavigationItem(title: 'Language', iconData: Icons.language, path: 'language',),
    // MainNavigationItem(title: 'Subscriptions', iconData: Icons.subscriptions, path: 'regions',
    //   children: <MainNavigationItem>[
    //     MainNavigationItem(title: 'Regions', iconData: Icons.my_location, path: 'regions',),
    //     MainNavigationItem(title: 'Kinds', iconData: Icons.title, path: 'kinds',),
    //     MainNavigationItem(title: 'Subscription Types', iconData: Icons.account_tree, path: 'subscription_types',),
    //     MainNavigationItem(title: 'Subscriptions', iconData: Icons.share, path: 'subscriptions',),
    //     MainNavigationItem(title: 'User Subscripting', iconData: Icons.manage_accounts, path: 'user_subscripting',),
    //   ],
    // ),
    MainNavigationItem(title: 'Currencies', iconData: Icons.paid, path: 'currencies',
      children: <MainNavigationItem>[
        MainNavigationItem(title: 'Currencies', iconData: Icons.attach_money, path: 'currencies',),
        MainNavigationItem(title: 'Currency Notes', iconData: Icons.description, path: 'currency_notes',),
      ],
    ),
    MainNavigationItem(title: 'Floor Plans', iconData: Icons.menu, path: 'floor-plan',
      children: <MainNavigationItem>[
        MainNavigationItem(title: 'Floor Plan Types', iconData: Icons.menu_open, path: 'floor-plan-type',),
        MainNavigationItem(title: 'Floor Plans', iconData: Icons.menu, path: 'floor-plan',),
      ],
    ),
    MainNavigationItem(title: 'Tax', iconData: Icons.account_balance, path: 'tax',
      children: <MainNavigationItem>[
        MainNavigationItem(title: 'Tax', iconData: Icons.account_balance, path: 'tax',),
        MainNavigationItem(title: 'Tax Types', iconData: Icons.euro_symbol, path: 'tax-type',),
        // MainNavigationItem(title: 'Tax Apply Types', iconData: Icons.gavel, path: 'tax_apply_types',),
        // MainNavigationItem(title: 'Tax Applying', iconData: Icons.picture_in_picture, path: 'tax_applying',),
      ],
    ),
    MainNavigationItem(title: 'Discounts', iconData: Icons.money_off, path: 'discounts',
      children: <MainNavigationItem>[
        MainNavigationItem(title: 'Discounts', iconData: Icons.money_off, path: 'discounts',),
        MainNavigationItem(title: 'Discount Types', iconData: Icons.local_atm, path: 'discount_types',),
        MainNavigationItem(title: 'Manual Value Types', iconData: Icons.create, path: 'manual_value_types',),
        MainNavigationItem(title: 'Reference Types', iconData: Icons.no_photography, path: 'reference_types',),
      ],
    ),
    MainNavigationItem(title: 'Promotions', iconData: Icons.redeem, path: 'promotion',
      children: <MainNavigationItem>[
        MainNavigationItem(title: 'Promotions', iconData: Icons.redeem, path: 'promotions',),
        // MainNavigationItem(title: 'Promotion Targets', iconData: Icons.adjust, path: 'promotion_targets',),
        // MainNavigationItem(title: 'Promotion Types', iconData: Icons.title, path: 'promotion_types',),
        // MainNavigationItem(title: 'Promotion Sub Types', iconData: Icons.crib, path: 'promotion_sub_types',),
        // MainNavigationItem(title: 'Promotion Conditions', iconData: Icons.ac_unit, path: 'promotion_conditions',),
        // MainNavigationItem(title: 'Promotion Details', iconData: Icons.privacy_tip, path: 'promotion_details',),
      ],
    ),
    MainNavigationItem(title: 'Campaigns', iconData: Icons.campaign, path: 'campaigns',
      children: <MainNavigationItem>[
        MainNavigationItem(title: 'Campaigns', iconData: Icons.campaign, path: 'campaigns',),
        //MainNavigationItem(title: 'Campaign Types', iconData: Icons.hearing, path: 'campaign_types',),
      ],
    ),
    MainNavigationItem(title: 'Channels', iconData: Icons.signal_cellular_0_bar, path: 'channels',
      children: <MainNavigationItem>[
        MainNavigationItem(title: 'Channels', iconData: Icons.signal_cellular_0_bar, path: 'channels',),
        MainNavigationItem(title: 'Channel Types', iconData: Icons.podcasts, path: 'channel_types',),
      ],
    ),
    MainNavigationItem(title: 'Sources', iconData: Icons.architecture, path: 'sources',
      children: <MainNavigationItem>[
        MainNavigationItem(title: 'Sources', iconData: Icons.architecture, path: 'sources',),
        MainNavigationItem(title: 'Source Types', iconData: Icons.imagesearch_roller, path: 'source_types',),
      ],
    ),
    MainNavigationItem(title: 'Giveaways', iconData: Icons.card_giftcard, path: 'give-away',
      children: <MainNavigationItem>[
        MainNavigationItem(title: 'Giveaway', iconData: Icons.card_giftcard, path: 'give-away',),
        MainNavigationItem(title: 'Giveaway Type', iconData: Icons.present_to_all, path: 'giveaway-type',),
        MainNavigationItem(title: 'Giveaway Condition Type', iconData: Icons.timelapse, path: 'giveaway-condition-type',),
      ],
    ),
    MainNavigationItem(title: 'Photos', iconData: Icons.photo, path: 'photos',
      children: <MainNavigationItem>[
        MainNavigationItem(title: 'Photos', iconData: Icons.photo, path: 'photos',),
        MainNavigationItem(title: 'Photo Types', iconData: Icons.photo_album, path: 'photo_types',),
      ],
    ),
    MainNavigationItem(title: 'Serial Number Type', iconData: Icons.confirmation_number, path: 'serial_number_types',),
    MainNavigationItem(title: 'Numbering Type', iconData: Icons.format_list_numbered, path: 'numbering_types',),
    MainNavigationItem(title: 'Version Type', iconData: Icons.edit_road_sharp, path: 'version_types',),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocListener<NetworkCheckerBloc, NetworkCheckerState>(
      listener: (context, state) {
        if(state is IsOnline){
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Online using ${state.type}'),),);
        }
        else{
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Offline'),),);
        }
      },
      child: MainScaffold(
        appBar: AppBar(
          leading: _toggleDrawerButton(),
          backgroundColor: Colors.grey,
        ),
        drawer: MainNavigation(
          navigationItems: _navigationItems,
        ),
        endDrawer: const MainEndDrawer(),
        body: const SafeArea(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: AutoRouter(),
          ),
        ),
      ),
    );
  }

  Widget _toggleDrawerButton(){
    return Builder(
        builder: (context) {
          return AnimatedMenuIcon(
            onPressed: () => MainScaffold.of(context).toggleDrawer(),
          );
        }
    );
  }
}