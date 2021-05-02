import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ibnsina_pharma_supplier/network/models/home/home.dart';
import 'package:ibnsina_pharma_supplier/utils/padding_helper.dart';

class HomeStatistics extends StatelessWidget {
  AppLocalizations data;
  Home homeResponse;
  HomeStatistics( this.data, this.homeResponse);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            getPaddingStart(val: 8.0),
            Expanded(
                child: Material(
                  elevation: 8,
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    children: [
                      getPaddingTop(val: 5.0),
                      SvgPicture.asset(
                        "assets/images/ic_consumed.svg",
                        height: 30,
                        width: 30,
                      ),
                      getPaddingTop(val: 4.0),
                      Text(
                        "${homeResponse.data?.acceptedTotalAmount ?? ''}${data.egp}",
                      ),
                      Text(data.confirmed),
                      getPaddingTop(val: 4.0),
                      getPaddingBottom(val: 5.0),
                    ],
                  ),
                )),
            getPaddingStart(),
            Expanded(
              //makes the red row full width
                child: Material(
                  color: Colors.white,
                  elevation: 8,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    children: [
                      getPaddingTop(val: 5.0),
                      SvgPicture.asset(
                        "assets/images/ic_users.svg",
                        height: 30,
                        width: 30,
                      ),
                      getPaddingTop(val: 4.0),
                      Text("${homeResponse.data?.customerCount ?? 0}"),
                      Text(data.bd_customers_list),
                      getPaddingTop(val: 4.0),
                      getPaddingBottom(val: 5.0),
                    ],
                  ),
                )),
            getPaddingStart(),
            Expanded(
              //makes the red row full width
                child: Material(
                  elevation: 8,
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    children: [
                      getPaddingTop(val: 5.0),
                      SvgPicture.asset(
                        "assets/images/ic_credit_limit.svg",
                        height: 30,
                        width: 30,
                      ),
                      getPaddingTop(val: 4.0),
                      Text(
                        "${homeResponse.data?.pendingTotalAmount ?? ''}${data.egp}",
                      ),
                      Text(data.pending),
                      getPaddingTop(val: 4.0),
                      getPaddingBottom(val: 5.0),
                    ],
                  ),
                )),
            getPaddingStart(),
            Expanded(
              //makes the red row full width
                child: Material(
                  elevation: 8,
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    children: [
                      getPaddingTop(val: 5.0),
                      SvgPicture.asset(
                        "assets/images/ic_balance.svg",
                        height: 30,
                        width: 30,
                      ),
                      getPaddingTop(val: 4.0),
                      Text(
                        "${homeResponse.data?.confirmedTotalAmount ?? ''}${data.egp}",
                      ),
                      Text(data.accepted_orders),
                      getPaddingTop(val: 4.0),
                      getPaddingBottom(val: 5.0),
                    ],
                  ),
                )),
            getPaddingStart(val: 8.0)
          ],
        ),
      ],
    );
  }
}
