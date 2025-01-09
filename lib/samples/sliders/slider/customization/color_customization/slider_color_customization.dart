///flutter package import
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart' show NumberFormat;

///Core theme import
// ignore: depend_on_referenced_packages
import 'package:syncfusion_flutter_core/theme.dart';

///Slider import
import 'package:syncfusion_flutter_sliders/sliders.dart';

///Local imports
import '../../../../../model/sample_view.dart';
import '../../../slider_utils.dart';

///Renders slider with customized color
class SliderColorCustomizationPage extends SampleView {
  ///Creates slider with customized color
  const SliderColorCustomizationPage(Key key) : super(key: key);

  @override
  _SliderColorCustomizationPageState createState() =>
      _SliderColorCustomizationPageState();
}

class _SliderColorCustomizationPageState extends SampleViewState {
  _SliderColorCustomizationPageState();
  double _trackSliderValue = 0;
  double _thumbStrokeSliderValue = 50;

  SfSliderTheme _sliderWithTrackColorCustomization() {
    return SfSliderTheme(
        data: SfSliderThemeData(
            activeTrackColor: Colors.teal,
            inactiveTrackColor: Colors.teal.withValues(alpha: 0.24),
            thumbColor: Colors.teal,
            tooltipBackgroundColor: Colors.teal,
            overlayColor: Colors.teal.withValues(alpha: 0.24)),
        child: SfSlider(
            showLabels: true,
            showTicks: true,
            interval: 25,
            min: -50.0,
            max: 50.0,
            value: _trackSliderValue,
            onChanged: (dynamic values) {
              setState(() {
                _trackSliderValue = values as double;
              });
            },
            enableTooltip: true,
            numberFormat: NumberFormat('#')));
  }

  SfSliderTheme _sliderWithThumbStrokeColorCustomization() {
    return SfSliderTheme(
        data: SfSliderThemeData(
            inactiveDividerColor: model.isWebFullView
                ? model.backgroundColor
                : model.sampleOutputCardColor,
            activeDividerColor: model.isWebFullView
                ? model.backgroundColor
                : model.sampleOutputCardColor,
            activeDividerStrokeWidth: 2,
            activeDividerStrokeColor: Colors.deepOrange.withValues(alpha: 0.24),
            inactiveDividerStrokeWidth: 2,
            inactiveDividerStrokeColor: Colors.deepOrange,
            activeDividerRadius: 5.0,
            inactiveDividerRadius: 5.0,
            activeTrackColor: Colors.deepOrange,
            inactiveTrackColor: Colors.deepOrange.withValues(alpha: 0.24),
            overlayColor: Colors.deepOrange.withValues(alpha: 0.12),
            thumbColor: model.isWebFullView
                ? model.backgroundColor
                : model.sampleOutputCardColor,
            thumbStrokeWidth: 2.0,
            tooltipBackgroundColor: Colors.deepOrange,
            thumbStrokeColor: Colors.deepOrange),
        child: SfSlider(
            interval: 25,
            showDividers: true,
            max: 100.0,
            value: _thumbStrokeSliderValue,
            onChanged: (dynamic values) {
              setState(() {
                _thumbStrokeSliderValue = values as double;
              });
            },
            enableTooltip: true,
            numberFormat: NumberFormat('#')));
  }

  Widget _buildWebLayout() {
    return Container(
      alignment: Alignment.center,
      child: Container(
        alignment: Alignment.center,
        width: MediaQuery.of(context).size.width >= 1000 ? 550 : 440,
        child: _buildMobileLayout(),
      ),
    );
  }

  Widget _buildMobileLayout() {
    final double padding = MediaQuery.of(context).size.width / 20.0;
    return Container(
        padding: EdgeInsets.fromLTRB(padding, 0, padding, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            title('Active and inactive track color'),
            columnSpacing10,
            _sliderWithTrackColorCustomization(),
            columnSpacing40,
            title('Thumb and divider stroke color'),
            columnSpacing10,
            _sliderWithThumbStrokeColorCustomization(),
            columnSpacing30,
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      final Widget slider =
          model.isWebFullView ? _buildWebLayout() : _buildMobileLayout();
      return constraints.maxHeight > 325
          ? slider
          : SingleChildScrollView(child: SizedBox(height: 325, child: slider));
    });
  }
}
