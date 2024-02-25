import 'package:flutter/material.dart';
import 'package:statesaver/src/utils.dart';

class TranseferSuccess extends StatelessWidget {
  const TranseferSuccess({super.key});

  static const routeName = 'transfer-success';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFF5F7FE),
        title: Text(
          'Transfer Success',
          style: context.textTheme.headlineSmall,
        ),
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: const BoxDecoration(
              color: Color(0xFFF5F7FE),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(32),
                bottomRight: Radius.circular(32),
              ),
            ),
            child: Container(
              padding: const EdgeInsets.all(24),
              decoration: const BoxDecoration(
                color: Color(0xFFFFFFFF),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(32),
                  bottomRight: Radius.circular(32),
                ),
              ),
              child: Column(
                children: [
                  Icon(
                    Icons.check_circle,
                    size: 104,
                    color: Colors.green[900],
                  ),
                  const SizedBox(height: 16),
                  Column(
                    children: [
                      const Text(
                        '#TR-197675',
                        style: TextStyle(
                          color: Color(0xFFA2A0A8),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        '75.00',
                        style: context.textTheme.displayMedium?.copyWith(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  const Divider(height: 48),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Recipient'),
                      Text('Bruce Wayne'),
                    ],
                  ),
                  const Divider(height: 48),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Transfer to'),
                      Text('******1234'),
                    ],
                  ),
                  const Divider(height: 48),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Transfer date'),
                      Text('Feb 19, 2024'),
                    ],
                  ),
                  const Divider(height: 48),
                  const Text('History Transactions'),
                ],
              ),
            ),
          ),
          const SizedBox(height: 47),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            const MaterialStatePropertyAll(Color(0xFFF5F7FE)),
                        shape: MaterialStatePropertyAll(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                        fixedSize: const MaterialStatePropertyAll(
                            Size.fromHeight(56))),
                    onPressed: () {},
                    child: Text(
                      'Share',
                      style: context.textTheme.labelLarge?.copyWith(
                        color: const Color(0xFF212121),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: OutlinedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(purple),
                        shape: MaterialStatePropertyAll(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                        fixedSize: const MaterialStatePropertyAll(
                            Size.fromHeight(56))),
                    onPressed: () =>
                        Navigator.popUntil(context, (route) => route.isFirst),
                    child: Text(
                      'Done',
                      style: context.textTheme.labelLarge?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 22 + MediaQuery.paddingOf(context).bottom,
          )
        ],
      ),
    );
  }
}
