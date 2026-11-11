import 'package:flutter/material.dart';
import '../../viewmodels/cruise_booking_viewmodel.dart';

class BookingControlsWidget extends StatefulWidget {
  final CruiseBookingViewModel viewModel;

  const BookingControlsWidget({
    super.key,
    required this.viewModel,
  });

  @override
  State<BookingControlsWidget> createState() => _BookingControlsWidgetState();
}

class _BookingControlsWidgetState extends State<BookingControlsWidget> {
  Future<void> _pickDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: widget.viewModel.selectedDate,
      firstDate: DateTime(2026, 1, 1),
      lastDate: DateTime(2027, 12, 31),
    );
    if (picked != null) {
      widget.viewModel.updateDate(picked);
    }
  }

  @override
  Widget build(BuildContext context) {
    final vm = widget.viewModel;

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      elevation: 1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Trip Preferences & Interactive Controls',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15.0,
              ),
            ),
            const SizedBox(height: 12.0),

            // Date Picker Tile
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: const Icon(Icons.calendar_today),
              title: const Text('Cruise Date:'),
              trailing: FilledButton.tonal(
                onPressed: () => _pickDate(context),
                child: Text(vm.formattedDate),
              ),
              onTap: () => _pickDate(context),
            ),
            const Divider(),

            // Cruise Package Dropdown
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Expanded(
                  flex: 2,
                  child: Text(
                    'Cruise Package:',
                    style: TextStyle(fontSize: 15.0),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: DropdownButton<String>(
                    value: vm.selectedPackage,
                    isExpanded: true,
                    underline: Container(
                      height: 1,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    onChanged: vm.updatePackage,
                    items: vm.destination.packages
                        .map<DropdownMenuItem<String>>((String pkg) {
                      return DropdownMenuItem<String>(
                        value: pkg,
                        child: Text(
                          pkg,
                          style: const TextStyle(fontSize: 14.0),
                          overflow: TextOverflow.ellipsis,
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
            const Divider(),

            // Dark Mode Switch
            SwitchListTile(
              contentPadding: EdgeInsets.zero,
              secondary: Icon(
                vm.isDarkMode ? Icons.dark_mode : Icons.light_mode,
              ),
              title: const Text('Dark Mode Theme'),
              value: vm.isDarkMode,
              onChanged: vm.toggleTheme,
            ),
          ],
        ),
      ),
    );
  }
}