part of '../date_ranger.dart';

class SecondaryPage extends StatelessWidget {
  final DateTime dateTime;
  static final String route = "secondary";

  SecondaryPage({Key? key, required this.dateTime}) : super(key: key);

  late final pickedDate = ValueNotifier(dateTime);
  late var years = List.generate(
      ranger.maxYear - ranger.minYear + 1, (index) => ranger.minYear + index);
  late var yearController = FixedExtentScrollController(
      initialItem: years.indexWhere((element) => element == dateTime.year));
  late var monthController =
      FixedExtentScrollController(initialItem: dateTime.month - 1);
  late InheritedRanger ranger;

  @override
  Widget build(BuildContext context) {
    ranger = InheritedRanger.of(context);
    return ValueListenableBuilder<DateTime>(
      valueListenable: pickedDate,
      builder: (context, date, child) => Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Center(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Text(
                  DateFormat("${DateFormat.ABBR_MONTH} ${DateFormat.YEAR}")
                      .format(date)),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: CupertinoPicker.builder(
                      itemExtent: 50,
                      scrollController: yearController,
                      childCount: years.length,
                      onSelectedItemChanged: (value) =>
                          pickedDate.value = DateTime(years[value], date.month),
                      itemBuilder: (context, index) =>
                          Center(child: Text("${years[index]}"))),
                ),
                SizedBox(width: 4),
                Expanded(
                  child: CupertinoPicker.builder(
                      itemExtent: 50,
                      scrollController: monthController,
                      childCount: 12,
                      onSelectedItemChanged: (value) =>
                          pickedDate.value = DateTime(date.year, value + 1),
                      itemBuilder: (context, index) => Center(
                          child: Text(DateFormat.MMM()
                              .format(DateTime(date.year, index + 1))))),
                )
              ],
            ),
          ),
          InkWell(
            onTap: () =>
                InheritedRanger.of(context).navKey.currentState!.pop(date),
            child: Container(
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                  borderRadius: BorderRadius.circular(8)),
              margin: EdgeInsets.symmetric(horizontal: 8),
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(horizontal: 14, vertical: 12),
              child: Text(
                "Done",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
