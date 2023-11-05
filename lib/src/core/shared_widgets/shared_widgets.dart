library shared_widgets;

import 'dart:io';

import 'package:cards_app/src/core/extensions/extensions.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:fast_cached_network_image/fast_cached_network_image.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

import '../../../generated/assets.dart';
import '../../screens/shared/media/view_models/media_view_model.dart';
import '../resources/app_radius.dart';
import '../resources/app_spaces.dart';
import '../resources/theme/theme.dart';
import '../utils/validations.dart';
import 'icon_widget/icon_widget.dart';

part 'animated/lottie_icon.dart';
part 'buttons/back_button.dart';
part 'buttons/button.dart';
part 'cached_images/main_cached_image.dart';
part 'loading/loading_widget.dart';
part 'loading/shimmer_loading/home_loading/slider_loading.dart';
part 'loading/shimmer_loading/main_shimmer_loading.dart';
part 'pick_image/pick_single_image/pick_single_image_widget.dart';
part 'pick_image/pick_single_image/widgets/pick_image_button.dart';
part 'pick_image/pick_single_image/widgets/view_network_image.dart';
part 'pick_image/pick_single_image/widgets/view_picked_image.dart';
part 'search/search.dart';
part 'text_fields/drop_down_field.dart';
part 'text_fields/text_field.dart';
