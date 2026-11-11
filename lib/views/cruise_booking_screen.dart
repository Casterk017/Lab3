import 'package:flutter/material.dart';
import '../viewmodels/cruise_booking_viewmodel.dart';
import 'widgets/header_image_widget.dart';
import 'widgets/title_section_widget.dart';
import 'widgets/action_bar_widget.dart';
import 'widgets/description_widget.dart';
import 'widgets/booking_controls_widget.dart';

class CruiseBookingScreen extends StatelessWidget {
  final CruiseBookingViewModel viewModel;

  const CruiseBookingScreen({
    super.key,
    required this.viewModel,
  });

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) {
        final bool isLandscape = orientation == Orientation.landscape;

        return Scaffold(
          appBar: AppBar(
            title: Text(
              isLandscape
                  ? 'Sibu River Cruise & Heritage (Landscape Split View)'
                  : 'Sibu River Cruise & Heritage',
            ),
            backgroundColor: Colors.indigo,
            foregroundColor: Colors.white,
          ),
          body: isLandscape
              ? _buildLandscapeLayout()
              : _buildPortraitLayout(),
        );
      },
    );
  }

  // Portrait Mode: Single Column ListView
  Widget _buildPortraitLayout() {
    final dest = viewModel.destination;
    return ListView(
      children: [
        HeaderImageWidget(
          imagePath: dest.imagePath,
          caption: dest.imageCaption,
        ),
        TitleSectionWidget(
          name: dest.name,
          location: dest.location,
          starCount: viewModel.starCount,
          isStarred: viewModel.isStarred,
          onStarToggle: viewModel.toggleStar,
        ),
        const Divider(height: 1),
        const ActionBarWidget(),
        const Divider(height: 1),
        DescriptionWidget(description: dest.description),
        BookingControlsWidget(viewModel: viewModel),
        const SizedBox(height: 24.0),
      ],
    );
  }

  // Landscape Mode: Side-by-Side Split Pane (Row + Expanded)
  Widget _buildLandscapeLayout() {
    final dest = viewModel.destination;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Left Pane: Image + Description
        Expanded(
          flex: 1,
          child: ListView(
            children: [
              HeaderImageWidget(
                imagePath: dest.imagePath,
                caption: 'Rajang River Horizon',
                height: 200.0,
              ),
              DescriptionWidget(
                description: dest.description,
                showHeader: true,
              ),
            ],
          ),
        ),
        const VerticalDivider(width: 1, thickness: 1),
        // Right Pane: Title, Action Bar, Interactive Controls
        Expanded(
          flex: 1,
          child: ListView(
            children: [
              TitleSectionWidget(
                name: dest.name,
                location: dest.location,
                starCount: viewModel.starCount,
                isStarred: viewModel.isStarred,
                onStarToggle: viewModel.toggleStar,
              ),
              const Divider(height: 1),
              const ActionBarWidget(),
              const Divider(height: 1),
              BookingControlsWidget(viewModel: viewModel),
              const SizedBox(height: 24.0),
            ],
          ),
        ),
      ],
    );
  }
}