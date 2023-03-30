// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// class ProductListing extends StatefulWidget {
//   const ProductListing({Key? key}) : super(key: key);
//
//   @override
//   State<ProductListing> createState() => _ProductListingState();
// }
//
// class _ProductListingState extends State<ProductListing> {
//   @override
//   Widget build(BuildContext context) {
//    return Scaffold(
//      body: Badge(
//        badgeContent: Text(
//          '${cartItem.length}',
//          style: AppTheme.of(context).bodyText1.override(
//            fontFamily: 'Poppins',
//            color: Colors.white,
//          ),
//        ),
//        showBadge: true,
//        shape: BadgeShape.circle,
//        badgeColor: AppTheme.of(context).primaryColor,
//        elevation: 4,
//        padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
//        position: BadgePosition.topEnd(),
//        animationType: BadgeAnimationType.scale,
//        toAnimate: true,
//        child: IconButton(
//          icon: Icon(
//            Icons.shopping_cart_outlined,
//            color: AppTheme.of(context).secondaryText,
//            size: 30,
//          ),
//          onPressed: () {
//            Navigator.push(
//              context,
//              MaterialPageRoute(
//                builder: (context) => CheckoutWidget(),
//              ),
//            );
//          },
//        ),
//      ),
//    )
//   }
// }
