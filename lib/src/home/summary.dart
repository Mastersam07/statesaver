import 'package:ficonsax/ficonsax.dart';
import 'package:flutter/material.dart';
import 'package:slide_to_act/slide_to_act.dart';
import 'package:statesaver/src/utils.dart';

import '../models/beneficiary.dart';
import 'success.dart';

class TransferSummary extends StatelessWidget {
  const TransferSummary({super.key});

  static const routeName = 'transfer-summary';

  @override
  Widget build(BuildContext context) {
    final args = (ModalRoute.of(context)?.settings.arguments ?? {})
        as Map<String, dynamic>;
    final beneficiary = Beneficiary.fromJson(args);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Transfer',
          style: context.textTheme.headlineSmall,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              decoration: BoxDecoration(
                color: const Color(0xFFF5F7FE),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                children: [
                  const Text('Amount (USD)'),
                  const SizedBox(height: 22),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          IconsaxBold.minus_cirlce,
                          size: 32,
                        ),
                      ),
                      Text(
                        '75',
                        style: context.textTheme.displayMedium,
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          IconsaxBold.add_circle,
                          size: 32,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 15),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
              decoration: BoxDecoration(
                color: const Color(0xFFFFFFFF),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                children: [
                  const Text('Transfer To'),
                  const SizedBox(height: 22),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            child: Center(
                              child: Text(
                                  beneficiary.name?.substring(0, 2) ?? 'TA'),
                            ),
                          ),
                          const SizedBox(width: 31),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(beneficiary.name ?? ''),
                              Text(
                                  '${beneficiary.bank ?? ''} - ${beneficiary.accountNumber ?? ''}'),
                            ],
                          )
                        ],
                      ),
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: const Color(0xFFE9E2F5),
                          borderRadius: BorderRadius.circular(33),
                        ),
                        child: const Text('Change'),
                      ),
                    ],
                  ),
                  const SizedBox(height: 22),
                  TextField(
                    maxLines: 2,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: const Color(0xFFF4F5F7),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide.none,
                      ),
                      hintText: 'Add Note',
                      suffix: const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            IconsaxBold.emoji_happy,
                            color: Color(0xFFACACAC),
                          ),
                          Icon(
                            IconsaxBold.gift,
                            color: Color(0xFFACACAC),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 22),
                  SlideAction(
                    elevation: 0,
                    text: 'Swipe to transfer',
                    innerColor: purple,
                    outerColor: const Color(0xFFF5F7FE),
                    textColor: const Color(0xFF15141F),
                    sliderButtonIcon: const Icon(
                      Icons.keyboard_double_arrow_right,
                      color: Colors.white,
                    ),
                    borderRadius: 12,
                    onSubmit: () async {
                      Navigator.restorablePushReplacementNamed(
                          context, TranseferSuccess.routeName);
                    },
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
