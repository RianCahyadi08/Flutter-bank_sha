import 'package:bank_sha/bloc/auth/auth_bloc.dart';
import 'package:bank_sha/bloc/data_plan/data_plan_bloc.dart';
import 'package:bank_sha/models/data_plan_form_model.dart';
import 'package:bank_sha/models/data_plan_model.dart';
import 'package:bank_sha/models/operator_card_model.dart';
import 'package:bank_sha/shared/shared_methods.dart';
import 'package:bank_sha/shared/theme.dart';
// import 'package:bank_sha/views/screens/package_data_success.dart';
import 'package:bank_sha/views/widgets/buttons.dart';
import 'package:bank_sha/views/widgets/forms.dart';
import 'package:bank_sha/views/widgets/package_select_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PackageDataPage extends StatefulWidget {
  final OperatorCardModel operatorCard;

  const PackageDataPage({
    Key? key,
    required this.operatorCard,
  }) : super(key: key);

  @override
  State<PackageDataPage> createState() => _PackageDataPageState();
}

class _PackageDataPageState extends State<PackageDataPage> {
  final phoneController = TextEditingController(text: '');
  DataPlanModel? selectedDataPlan;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DataPlanBloc(),
      child: BlocConsumer<DataPlanBloc, DataPlanState>(
        listener: (context, state) {
          if (state is DataPlanSuccess) {
            context.read<AuthBloc>().add(
                  AuthUpdateBalance(
                    selectedDataPlan!.price! * -1,
                  ),
                );
            Navigator.pushNamedAndRemoveUntil(
              context,
              '/transfer-success',
              (route) => false,
            );
          }

          if (state is DataPlanFail) {
            showCustomSnackBar(context, state.e);
          }
        },
        builder: (context, state) {
          if (state is DataPlanLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return Scaffold(
            appBar: AppBar(
              title: const Text('Paket Data'),
            ),
            body: ListView(
              padding: const EdgeInsets.only(
                left: 24,
                top: 40,
                right: 24,
                bottom: 40,
              ),
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Phone Number',
                      style: blackTextStyle.copyWith(
                        fontSize: 16,
                        fontWeight: semiBold,
                      ),
                    ),
                    const SizedBox(
                      height: 14,
                    ),
                    CustomFormField(
                      title: '+628',
                      isShowTitle: false,
                      controller: phoneController,
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Text(
                      'Select Package',
                      style: blackTextStyle.copyWith(
                        fontSize: 16,
                        fontWeight: semiBold,
                      ),
                    ),
                    const SizedBox(
                      height: 14,
                    ),
                    Wrap(
                      runSpacing: 18,
                      spacing: 17,
                      children: widget.operatorCard.dataPlans!.map((dataPlan) {
                        return GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedDataPlan = dataPlan;
                              });
                            },
                            child: PackageSelectItem(
                              dataPlan: dataPlan,
                              isSelected: dataPlan.id == selectedDataPlan?.id,
                            ));
                      }).toList(),
                    ),
                    const SizedBox(
                      height: 57,
                    ),
                  ],
                )
              ],
            ),
            floatingActionButton:
                (selectedDataPlan != null && phoneController.text.isNotEmpty)
                    ? Container(
                        margin: const EdgeInsets.only(
                          left: 24,
                          top: 100,
                          right: 24,
                        ),
                        child: CustomFilledButton(
                          title: 'Continue',
                          width: 327,
                          height: 50,
                          onPressed: () async {
                            if (await Navigator.pushNamed(context, '/pin') ==
                                true) {
                              // ignore: use_build_context_synchronously
                              final authState = context.read<AuthBloc>().state;
                              String pin = '';
                              if (authState is AuthSuccess) {
                                pin = authState.user.pin!;
                              }
                              // ignore: use_build_context_synchronously
                              context.read<DataPlanBloc>().add(
                                    DataPlanPost(
                                      DataPlanFormModel(
                                        dataPlanId: selectedDataPlan!.id!,
                                        phoneNumber: phoneController.text,
                                        pin: pin,
                                      ),
                                    ),
                                  );
                            }
                          },
                        ),
                      )
                    : Container(),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
          );
        },
      ),
    );
  }
}
