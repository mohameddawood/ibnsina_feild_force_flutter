import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ibnsina_pharma_supplier/utils/padding_helper.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeActionsCards extends StatelessWidget {

  AppLocalizations data;
  HomeActionsCards( this.data);

  @override
  Widget build(BuildContext context) {
    return     Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          color: Colors.transparent,
          height: 200,
          width: double.infinity,
          child: Material(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(50),
                    topLeft: Radius.circular(50))),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 100,
                  width: 100,
                  child: Material(
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          "assets/images/ic_online_ordering.svg",
                          width: 50,
                          height: 50,
                        ),
                        Text(data.customer_orders)
                      ],
                    ),
                  ),
                ),
                getPadding(val: 15.0),
                Container(
                  height: 100,
                  width: 100,
                  child: Material(
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          "assets/images/ic_shopping.svg",
                          width: 50,
                          height: 50,
                        ),
                        Text(data.list_of_orders)
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
