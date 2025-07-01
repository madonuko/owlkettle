# MIT License
#
# Copyright (c) 2025 madonuko <mado@fyralabs.com>
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

# Bindings for Helium

# INFO: https://docs.developers.tauos.co/libhelium/libhelium-1/index.html

import std/strutils as strutils
import ./gtk

const HeMajor {.intdefine: "hemajor".}: int = 1
  ## Specifies the minimum Helium major version required to run an application. Overwriteable via `-d:hemajor=X`. Defaults to 1.
const HeMinor {.intdefine: "heminor".}: int = 8
  ## Specifies the minimum Helium minor version required to run an application. Overwriteable via `-d:heminor=X`. Defaults to 8.
const HePatch {.intdefine: "hepatch".}: int = 12
  ## Specifies the minimum Helium patch version required to run an application. Overwriteable via `-d:hepatch=X`. Defaults to 12.

const HeVersion* = (HeMajor, HeMinor, HePatch)

{.passl: strutils.strip(gorge("pkg-config --libs libhelium-1")).}

type
  StyleManager* = distinct pointer
  DynamicScheme* = distinct pointer

  HeAnimationTarget* = distinct pointer
  HeCallbackAnimationTarget* = distinct pointer
  HePropertyAnimationTarget* = distinct pointer
  HeAnimation* = distinct pointer
  HeSpringParams* = distinct pointer
  HeSpringAnimation* = distinct pointer
  HeTimedAnimation* = distinct pointer
  HeApplication* = distinct pointer
  HeBin* = distinct pointer
  HeButtonContent* = distinct pointer
  HeTip* = distinct pointer
  HeView* = distinct pointer
  HeWindow* = distinct pointer
  HeContentBlock* = distinct pointer
  HeMiniContentBlock* = distinct pointer
  HeChip* = distinct pointer
  HeChipGroup* = distinct pointer
  HeContentBlockImage* = distinct pointer
  HeContentBlockImageCluster* = distinct pointer
  HeContentList* = distinct pointer
  HeDatePicker* = distinct pointer
  HeDialog* = distinct pointer
  HeDivider* = distinct pointer
  HeEmptyPage* = distinct pointer
  HeGroupedButton* = distinct pointer
  HeModifierBadge* = distinct pointer
  HeNavigationRail* = distinct pointer
  HeNavigationSection* = distinct pointer
  HeOverlayButton* = distinct pointer
  HeProgressBar* = distinct pointer
  HeSegmentedButton* = distinct pointer
  HeSettingsList* = distinct pointer
  HeSettingsPage* = distinct pointer
  HeSettingsRow* = distinct pointer
  HeSettingsWindow* = distinct pointer
  HeSideBar* = distinct pointer
  HeSlider* = distinct pointer
  HeSwitch* = distinct pointer
  HeSwitchBar* = distinct pointer
  HeTab* = distinct pointer
  HeTabPage* = distinct pointer
  HeTabSwitcher* = distinct pointer
  HeTextField* = distinct pointer
  HeTimePicker* = distinct pointer
  HeTipView* = distinct pointer
  HeToast* = distinct pointer
  HeViewAux* = distinct pointer
  HeViewChooser* = distinct pointer
  HeViewDual* = distinct pointer
  HeViewMono* = distinct pointer
  HeViewSubTitle* = distinct pointer
  HeViewSwitcher* = distinct pointer
  HeViewTitle* = distinct pointer
  HeWelcomeScreen* = distinct pointer
  HeAboutWindow* = distinct pointer
  HeAppBar* = distinct pointer
  HeApplicationWindow* = distinct pointer
  HeAvatar* = distinct pointer
  HeBadge* = distinct pointer
  HeBanner* = distinct pointer
  HeBottomBar* = distinct pointer
  HeBottomSheet* = distinct pointer
  HeCard* = distinct pointer
  HeScore* = distinct pointer
  HeScoreAnnotatedColor* = distinct pointer
  HeTemperatureCache* = distinct pointer
  HeTonalPalette* = distinct pointer
  HeToneDeltaPair* = distinct pointer
  HeViewingConditions* = distinct pointer
  HeLABColor* = distinct pointer
  HeXYZColor* = distinct pointer
  HeCAM16Color* = distinct pointer
  HeHCTColor* = distinct pointer
  HeLCHColor* = distinct pointer
  HeContrast* = distinct pointer
  HeContrastCurve* = distinct pointer
  HeKeyColor* = distinct pointer
  HeQuantizer* = distinct pointer
  HeQuantizerCelebi* = distinct pointer
  HeQuantizerMap* = distinct pointer
  HeQuantizerResult* = distinct pointer
  HeQuantizerWsmeans* = distinct pointer
  HeQuantizerWu* = distinct pointer
  HeContentScheme* = distinct pointer
  HeDefaultScheme* = distinct pointer
  HeMonochromaticScheme* = distinct pointer
  HeMutedScheme* = distinct pointer
  HeSaladScheme* = distinct pointer
  HeScheme* = distinct pointer
  HeVibrantScheme* = distinct pointer

  HeRGBColor* = object
    r*: cdouble
    g*: cdouble
    b*: cdouble

  HeLABColorObj* = object
    l*: cdouble
    a*: cdouble
    b*: cdouble

  HeXYZColorObj* = object
    x*: cdouble
    y*: cdouble
    z*: cdouble

  HeCAM16ColorObj* = object
    j*: cdouble
    a*: cdouble
    b*: cdouble
    c*: cdouble
    h*: cdouble
    m*: cdouble
    s*: cdouble

  HeHCTColorObj* = object
    h*: cdouble
    c*: cdouble
    t*: cdouble
    a*: cint

  HeLCHColorObj* = object
    l*: cdouble
    c*: cdouble
    h*: cdouble

  HeAnimationState* = enum
    HeAnimationStateIdle
    HeAnimationStatePaused
    HeAnimationStatePlaying
    HeAnimationStateFinished

  HeEasing* = enum
    HeEasingLinear
    HeEasingEaseOutCubic
    HeEasingEaseInOutBounce

  HeColors* = enum
    HeColorsNone
    HeColorsRed
    HeColorsOrange
    HeColorsYellow
    HeColorsGreen
    HeColorsBlue
    HeColorsIndigo
    HeColorsPurple
    HeColorsPink
    HeColorsMint
    HeColorsBrown
    HeColorsLight
    HeColorsDark

  HeSchemeVariant* = enum
    HeSchemeVariantDefault
    HeSchemeVariantVibrant
    HeSchemeVariantMuted
    HeSchemeVariantMonochrome
    HeSchemeVariantSalad
    HeSchemeVariantContent

  HeTipViewStyle* = enum
    HeTipViewStyleNone
    HeTipViewStylePopup
    HeTipViewStyleView

  HeDesktopColorScheme* = enum
    HeDesktopColorSchemeNoPreference
    HeDesktopColorSchemeDark
    HeDesktopColorSchemeLight

  HeDesktopEnsorScheme* = enum
    HeDesktopEnsorSchemeDefault
    HeDesktopEnsorSchemeVibrant
    HeDesktopEnsorSchemeMuted
    HeDesktopEnsorSchemeMonochromatic
    HeDesktopEnsorSchemeSalad

  HeTonePolarity* = enum
    HeTonePolarityDarker
    HeTonePolarityRelativeDarker
    HeTonePolarityLighter
    HeTonePolarityRelativeLighter

  HeToneResolve* = enum
    HeToneResolveExact
    HeToneResolveNearer
    HeToneResolveFarther

  HeAboutWindowLicenses* = enum
    HeAboutWindowLicensesGplv3
    HeAboutWindowLicensesMit
    HeAboutWindowLicensesMplv2
    HeAboutWindowLicensesUnlicense
    HeAboutWindowLicensesApachev2
    HeAboutWindowLicensesWtfpl
    HeAboutWindowLicensesProprietary

  HeOverlayButtonSize* = enum
    HeOverlayButtonSizeSmall
    HeOverlayButtonSizeMedium
    HeOverlayButtonSizeLarge

  HeOverlayButtonTypeButton* = enum
    HeOverlayButtonTypeButtonSurface
    HeOverlayButtonTypeButtonPrimary
    HeOverlayButtonTypeButtonSecondary
    HeOverlayButtonTypeButtonTertiary

  HeOverlayButtonAlignment* = enum
    HeOverlayButtonAlignmentLeft
    HeOverlayButtonAlignmentCenter
    HeOverlayButtonAlignmentRight

  HeAvatarStatusColor* = enum
    HeAvatarStatusColorRed
    HeAvatarStatusColorGreen
    HeAvatarStatusColorYellow

  HeBannerStyle* = enum
    HeBannerStyleInfo
    HeBannerStyleWarning
    HeBannerStyleError

  HeBottomBarMode* = enum
    HeBottomBarModeDocked
    HeBottomBarModeFloating

  HeBottomBarStyle* = enum
    HeBottomBarStyleDefault
    HeBottomBarStyleVibrant

  HeBottomBarFloatingPosition* = enum
    HeBottomBarFloatingPositionBottom
    HeBottomBarFloatingPositionLeft
    HeBottomBarFloatingPositionRight

  HeBottomBarPosition* = enum
    HeBottomBarPositionLeft
    HeBottomBarPositionRight

  HeButtonColor* = enum
    HeButtonColorSurface
    HeButtonColorPrimary
    HeButtonColorSecondary
    HeButtonColorTertiary

  HeButtonSize* = enum
    HeButtonSizeXsmall
    HeButtonSizeSmall
    HeButtonSizeMedium
    HeButtonSizeLarge
    HeButtonSizeXlarge

  HeButtonWidth* = enum
    HeButtonWidthDefault
    HeButtonWidthNarrow
    HeButtonWidthWide

  HeCardType* = enum
    HeCardTypeDefault
    HeCardTypeOutline
    HeCardTypeFilled
    HeCardTypeElevated

  HeCardLayout* = enum
    HeCardLayoutVertical
    HeCardLayoutHorizontal

  HeChipGroupMode* = enum
    HeChipGroupModeSelection
    HeChipGroupModeFiltering

  HeContentBlockImageClusterImagePosition* = enum
    HeContentBlockImageClusterImagePositionTopLeft
    HeContentBlockImageClusterImagePositionBottomLeft
    HeContentBlockImageClusterImagePositionTopRight
    HeContentBlockImageClusterImagePositionBottomRight

  HeGroupedButtonSize* = enum
    HeGroupedButtonSizeSmall
    HeGroupedButtonSizeMedium
    HeGroupedButtonSizeLarge
    HeGroupedButtonSizeXlarge

  HeModifierBadgeAlignment* = enum
    HeModifierBadgeAlignmentLeft
    HeModifierBadgeAlignmentCenter
    HeModifierBadgeAlignmentRight

  HeTabSwitcherTabBarBehavior* = enum
    HeTabSwitcherTabBarBehaviorAlways
    HeTabSwitcherTabBarBehaviorSingle
    HeTabSwitcherTabBarBehaviorNever

  HeAnimationTargetFunc* = proc(value: cdouble, user_data: pointer)
  HePaletteFunc* = proc(s: pointer, user_data: pointer): pointer
  HeToneFunc* = proc(s: pointer, user_data: pointer): cdouble
  HeBackgroundFunc* = proc(s: pointer, user_data: pointer): pointer
  HeToneDeltaPairFunc* = proc(s: pointer, user_data: pointer): pointer

{.push importc, cdecl.}
proc he_animation_state_get_type*(): GType
proc he_animation_target_get_type*(): GType
proc he_animation_target_construct*(object_type_v: GType): pointer
proc he_animation_target_set_value*(self: GtkWidget, value: cdouble)
proc he_callback_animation_target_get_type*(): GType
proc he_callback_animation_target_new*(
  callback: HeAnimationTargetFunc,
  callback_target: pointer,
  callback_target_destroy_notify: GDestroyNotify,
): pointer

proc he_callback_animation_target_construct*(
  object_type_v: GType,
  callback: HeAnimationTargetFunc,
  callback_target: pointer,
  callback_target_destroy_notify: GDestroyNotify,
): pointer

proc he_property_animation_target_get_type*(): GType
proc he_property_animation_target_get_object*(self: GtkWidget): pointer
proc he_property_animation_target_set_object*(self: GtkWidget, value: pointer)
proc he_property_animation_target_get_pspec*(self: GtkWidget): pointer
proc he_property_animation_target_set_pspec*(self: GtkWidget, value: pointer)
proc he_property_animation_target_new*(): GtkWidget
proc he_property_animation_target_construct*(object_type_v: GType): pointer
proc he_property_animation_target_animate_property*(self: GtkWidget, value: cdouble)
proc he_animation_get_type*(): GType
proc he_animation_get_state*(self: GtkWidget): HeAnimationState
proc he_animation_set_state*(self: GtkWidget, value: HeAnimationState)
proc he_animation_get_target*(self: GtkWidget): pointer
proc he_animation_set_target*(self: GtkWidget, value: pointer)
proc he_animation_get_widget*(self: GtkWidget): pointer
proc he_animation_set_widget*(self: GtkWidget, value: pointer)
proc he_animation_get_avalue*(self: GtkWidget): cdouble
proc he_animation_set_avalue*(self: GtkWidget, value: cdouble)
proc he_animation_construct*(object_type_v: GType): pointer
proc he_animation_pause*(self: GtkWidget)
proc he_animation_play*(self: GtkWidget)
proc he_animation_reset*(self: GtkWidget)
proc he_animation_resume*(self: GtkWidget)
proc he_animation_skip*(self: GtkWidget)
proc he_animation_estimate_duration*(self: GtkWidget): cint
proc he_animation_calculate_value*(self: GtkWidget, t: cint): cdouble
proc he_spring_params_get_type*(): GType
proc he_spring_params_get_damping*(self: GtkWidget): cdouble
proc he_spring_params_set_damping*(self: GtkWidget, value: cdouble)
proc he_spring_params_get_damping_ratio*(self: GtkWidget): cdouble
proc he_spring_params_set_damping_ratio*(self: GtkWidget, value: cdouble)
proc he_spring_params_get_mass*(self: GtkWidget): cdouble
proc he_spring_params_set_mass*(self: GtkWidget, value: cdouble)
proc he_spring_params_get_stiffness*(self: GtkWidget): cdouble
proc he_spring_params_set_stiffness*(self: GtkWidget, value: cdouble)
proc he_spring_params_new*(
  damping_ratio: cdouble, mass: cdouble, stiffness: cdouble
): pointer

proc he_spring_params_construct*(
  object_type_v: GType, damping_ratio: cdouble, mass: cdouble, stiffness: cdouble
): pointer

proc he_spring_params_new_full*(
  damping: cdouble, mass: cdouble, stiffness: cdouble
): pointer

proc he_spring_params_construct_full*(
  object_type_v: GType, damping: cdouble, mass: cdouble, stiffness: cdouble
): pointer

proc he_spring_animation_get_type*(): GType
proc he_spring_animation_get_epsilon*(self: GtkWidget): cdouble
proc he_spring_animation_set_epsilon*(self: GtkWidget, value: cdouble)
proc he_spring_animation_get_estimated_duration*(self: GtkWidget): cint
proc he_spring_animation_set_estimated_duration*(self: GtkWidget, value: cint)
proc he_spring_animation_get_initial_velocity*(self: GtkWidget): cdouble
proc he_spring_animation_set_initial_velocity*(self: GtkWidget, value: cdouble)
proc he_spring_animation_get_latch*(self: GtkWidget): cint
proc he_spring_animation_set_latch*(self: GtkWidget, value: cint)
proc he_spring_animation_get_spring_params*(self: GtkWidget): pointer
proc he_spring_animation_set_spring_params*(self: GtkWidget, value: pointer)
proc he_spring_animation_get_value_from*(self: GtkWidget): cdouble
proc he_spring_animation_set_value_from*(self: GtkWidget, value: cdouble)
proc he_spring_animation_get_value_to*(self: GtkWidget): cdouble
proc he_spring_animation_set_value_to*(self: GtkWidget, value: cdouble)
proc he_spring_animation_get_velocity*(self: GtkWidget): cdouble
proc he_spring_animation_set_velocity*(self: GtkWidget, value: cdouble)
proc he_spring_animation_new*(
  widget: pointer, from_v: cdouble, to: cdouble, sparams: pointer, target: pointer
): pointer

proc he_spring_animation_construct*(
  object_type_v: GType,
  widget: pointer,
  from_v: cdouble,
  to: cdouble,
  sparams: pointer,
  target: pointer,
): pointer

proc he_easing_get_type*(): GType
proc he_timed_animation_get_type*(): GType
proc he_timed_animation_get_value_from*(self: GtkWidget): cdouble
proc he_timed_animation_set_value_from*(self: GtkWidget, value: cdouble)
proc he_timed_animation_get_value_to*(self: GtkWidget): cdouble
proc he_timed_animation_set_value_to*(self: GtkWidget, value: cdouble)
proc he_timed_animation_get_duration*(self: GtkWidget): cint
proc he_timed_animation_set_duration*(self: GtkWidget, value: cint)
proc he_timed_animation_get_easing*(self: GtkWidget): HeEasing
proc he_timed_animation_set_easing*(self: GtkWidget, value: HeEasing)
proc he_timed_animation_get_repeat_count*(self: GtkWidget): cint
proc he_timed_animation_set_repeat_count*(self: GtkWidget, value: cint)
proc he_timed_animation_get_reverse*(self: GtkWidget): cint
proc he_timed_animation_set_reverse*(self: GtkWidget, value: cint)
proc he_timed_animation_get_alternate*(self: GtkWidget): cint
proc he_timed_animation_set_alternate*(self: GtkWidget, value: cint)
proc he_timed_animation_new*(
  widget: pointer, from_v: cdouble, to: cdouble, duration: cint, target: pointer
): pointer

proc he_timed_animation_construct*(
  object_type_v: GType,
  widget: pointer,
  from_v: cdouble,
  to: cdouble,
  duration: cint,
  target: pointer,
): pointer

proc he_application_get_type*(): GType
proc he_rgb_color_get_type*(): GType
proc he_rgb_color_dup*(self: GtkWidget): pointer
proc he_rgb_color_free*(self: GtkWidget)
proc he_application_new*(
  application_id: cstring, flags: GApplicationFlags
): GApplication

proc he_application_get_is_mono*(app: GApplication): cbool
proc he_application_set_is_mono*(app: GApplication, value: cbool)
proc he_application_get_is_content*(app: GApplication): cbool
proc he_application_set_is_content*(app: GApplication, value: cbool)
proc he_application_get_default_contrast*(app: GApplication): cdouble
proc he_application_set_default_contrast*(app: GApplication, value: cdouble)
proc he_application_get_override_contrast*(app: GApplication): cdouble
proc he_application_set_override_contrast*(app: GApplication, value: cdouble)
proc he_application_get_override_dark_style*(app: GApplication): cbool
proc he_application_set_override_dark_style*(app: GApplication, value: cbool)
proc he_application_get_default_accent_color*(app: GApplication): ptr HeRGBColor
proc he_application_set_default_accent_color*(app: GApplication, value: ptr HeRGBColor)
proc he_application_get_override_accent_color*(app: GApplication): ptr HeRGBColor
proc he_application_set_override_accent_color*(app: GApplication, value: ptr HeRGBColor)
proc he_application_construct*(
  object_type_v: GType, application_id: pointer, flags: GApplicationFlags
): GApplication

proc he_bin_get_type*(): GType
proc he_bin_get_child*(self: GtkWidget): pointer
proc he_bin_set_child*(self: GtkWidget, value: pointer)
proc he_bin_add_child*(
  self: GtkWidget, builder: pointer, child: pointer, type_v: pointer
)

proc he_bin_new*(): GtkWidget
proc he_bin_construct*(object_type_v: GType): pointer
proc he_button_content_get_type*(): GType
proc he_button_content_get_icon*(self: GtkWidget): pointer
proc he_button_content_set_icon*(self: GtkWidget, value: pointer)
proc he_button_content_get_label*(self: GtkWidget): pointer
proc he_button_content_set_label*(self: GtkWidget, value: pointer)
proc he_button_content_new*(): GtkWidget
proc he_button_content_construct*(object_type_v: GType): pointer
proc he_colors_get_type*(): GType
proc he_colors_to_css_class*(self: HeColors): pointer
proc he_colors_to_string*(self: HeColors): pointer
proc he_style_manager_get_type*(): GType
proc he_scheme_variant_get_type*(): GType
proc he_dynamic_scheme_get_type*(): GType
proc he_style_manager_new*(): StyleManager
proc he_style_manager_update*(manager: StyleManager)
proc he_style_manager_register*(manager: StyleManager)
proc he_style_manager_unregister*(manager: StyleManager)
proc he_style_manager_get_user_base*(manager: StyleManager): GtkCssProvider
proc he_style_manager_get_user_dark*(manager: StyleManager): GtkCssProvider
proc he_style_manager_style_refresh*(
  manager: StyleManager, scheme_factory: DynamicScheme
): cstring

proc he_style_manager_weight_refresh*(
  manager: StyleManager, font_weight: cdouble
): cstring

proc he_style_manager_get_is_registered*(manager: StyleManager): cbool
proc he_tip_view_style_get_type*(): GType
proc he_tip_view_style_to_css_class*(self: HeTipViewStyle): pointer
proc he_tip_view_style_to_string*(self: HeTipViewStyle): pointer
proc he_tip_get_type*(): GType
proc he_tip_get_title*(self: GtkWidget): pointer
proc he_tip_set_title*(self: GtkWidget, value: pointer)
proc he_tip_get_image*(self: GtkWidget): pointer
proc he_tip_set_image*(self: GtkWidget, value: pointer)
proc he_tip_get_message*(self: GtkWidget): pointer
proc he_tip_set_message*(self: GtkWidget, value: pointer)
proc he_tip_get_action_label*(self: GtkWidget): pointer
proc he_tip_set_action_label*(self: GtkWidget, value: pointer)
proc he_tip_new*(
  title: pointer, image: pointer, message: pointer, action_label: pointer
): pointer

proc he_tip_construct*(
  object_type_v: GType,
  title: pointer,
  image: pointer,
  message: pointer,
  action_label: pointer,
): pointer

proc he_view_get_type*(): GType
proc he_view_get_title*(self: GtkWidget): pointer
proc he_view_set_title*(self: GtkWidget, value: pointer)
proc he_view_get_stack*(self: GtkWidget): pointer
proc he_view_set_stack*(self: GtkWidget, value: pointer)
proc he_view_get_subtitle*(self: GtkWidget): pointer
proc he_view_set_subtitle*(self: GtkWidget, value: pointer)
proc he_view_get_has_margins*(self: GtkWidget): cint
proc he_view_set_has_margins*(self: GtkWidget, value: cint)
proc he_view_add_child*(
  self: GtkWidget, builder: pointer, child: pointer, type_v: pointer
)

proc he_view_add*(self: GtkWidget, widget: pointer)
proc he_view_construct*(object_type_v: GType): pointer
proc he_window_get_type*(): GType
proc he_window_get_parent*(self: GtkWidget): pointer
proc he_window_set_parent*(self: GtkWidget, value: pointer)
proc he_window_get_has_title*(self: GtkWidget): cint
proc he_window_set_has_title*(self: GtkWidget, value: cint)
proc he_window_get_has_back_button*(self: GtkWidget): cint
proc he_window_set_has_back_button*(self: GtkWidget, value: cint)
proc he_window_new*(): GtkWidget
proc he_window_construct*(object_type_v: GType): pointer
proc he_rgb_to_argb_int*(color: pointer): cint
proc he_lab_color_get_type*(): GType
proc he_lab_color_dup*(self: GtkWidget): pointer
proc he_lab_color_free*(self: GtkWidget)
proc he_lab_to_argb_int*(lab: pointer): cint
proc he_argb_from_rgb_int*(red: cint, green: cint, blue: cint): cint
proc he_xyz_color_get_type*(): GType
proc he_xyz_color_dup*(self: GtkWidget): pointer
proc he_xyz_color_free*(self: GtkWidget)
proc he_xyz_to_argb*(xyz: pointer): cint
proc he_argb_to_rgb*(argb: cint, result_length1: pointer): pointer
proc he_alpha_from_rgba_int*(argb: cint): cint
proc he_red_from_rgba_int*(argb: cint): cint
proc he_green_from_rgba_int*(argb: cint): cint
proc he_blue_from_rgba_int*(argb: cint): cint
proc he_ca_m16_color_get_type*(): GType
proc he_ca_m16_color_dup*(self: GtkWidget): pointer
proc he_ca_m16_color_free*(self: GtkWidget)
proc he_xyz_to_cam16*(color: pointer, result: pointer)
proc he_cam16_from_int*(argb: cint, result: pointer)
proc he_to_gdk_rgba*(color: pointer, result: pointer)
proc he_critical_plane_below*(x: cdouble): cint
proc he_critical_plane_above*(x: cdouble): cint
proc he_hct_color_get_type*(): GType
proc he_hct_color_dup*(self: GtkWidget): pointer
proc he_hct_color_free*(self: GtkWidget)
proc he_hct_color_to_int*(self: HeHCTColor): cint
proc he_hct_color_get_argb*(self: HeHCTColor): cint
proc he_hct_color_hue_is_yellow*(hue: cdouble): cint
proc he_hct_color_hue_is_blue*(hue: cdouble): cint
proc he_hct_color_hue_is_cyan*(hue: cdouble): cint
proc he_set_internal_state*(argb: cint, result: pointer)
proc he_from_params*(hue: cdouble, chroma: cdouble, tone: cdouble, result: pointer)
proc he_viewing_conditions_get_type*(): GType
proc he_in_vc*(hct: pointer, vc: pointer, result: pointer)
proc he_disliked*(hct: pointer): cint
proc he_fix_disliked*(hct: pointer, result: pointer)
proc he_hct_from_int*(argb: cint, result: pointer)
proc he_hct_to_hex*(hue: cdouble, chroma: cdouble, lstar: cdouble): pointer
proc he_hex_from_hct_with_contrast*(hct: pointer, contrast: cdouble): pointer
proc he_hex_from_hct*(hct: pointer): pointer
proc he_hct_to_argb*(hue: cdouble, chroma: cdouble, lstar: cdouble): cint
proc he_hct_blend*(a: pointer, b: pointer, result: pointer)
proc he_get_rotated_hue*(
  hct: pointer,
  hues: pointer,
  hues_length1: cint,
  rotations: pointer,
  rotations_length1: cint,
): cdouble

proc he_piecewise_val*(
  hct: pointer, huebps: pointer, huebps_length1: cint, hues: pointer, hues_length1: cint
): cdouble

proc he_rgb_from_linrgb*(red: cint, green: cint, blue: cint): cint
proc he_argb_from_linrgb*(linrgb: pointer, linrgb_length1: cint): cint
proc he_from_solved*(h: cdouble, c: cdouble, lstar: cdouble): cint
proc he_find_result_by_j*(hr: cdouble, c: cdouble, y: cdouble): cint
proc he_hexcode*(r: cdouble, g: cdouble, b: cdouble): pointer
proc he_hexcode_argb*(color: cint): pointer
proc he_lab_color_distance*(self: HeLABColor, lab: pointer): cdouble
proc he_xyz_value_to_lab*(v: cdouble): cdouble
proc he_xyz_to_lab*(color: pointer, result: pointer)
proc he_lch_color_get_type*(): GType
proc he_lch_color_dup*(self: GtkWidget): pointer
proc he_lch_color_free*(self: GtkWidget)
proc he_lch_to_lab*(color: pointer, result: pointer)
proc he_rgb_to_lab*(color: pointer, result: pointer)
proc he_lab_from_argb*(argb: cint, result: pointer)
proc he_rgb_to_lch*(color: pointer, result: pointer)
proc he_lab_to_lch*(color: pointer, result: pointer)
proc he_hct_to_lch*(color: pointer, result: pointer)
proc he_xyz_to_rgb*(color: pointer, result: pointer)
proc he_lab_to_rgb*(color: pointer, result: pointer)
proc he_lch_to_rgb*(color: pointer, result: pointer)
proc he_from_gdk_rgba*(color: pointer, result: pointer)
proc he_from_hex*(color: pointer, result: pointer)
proc he_from_argb_int*(argb: cint, result: pointer)
proc he_argb_to_xyz*(argb: cint, result: pointer)
proc he_rgb_value_to_xyz*(v: cdouble): cdouble
proc he_rgb_to_xyz*(color: pointer, result: pointer)
proc he_cam16_to_xyz*(color: pointer, result: pointer)
proc he_lab_to_xyz*(color: pointer, result: pointer)
proc he_desktop_get_type*(): GType
proc he_desktop_color_scheme_get_type*(): GType
proc he_desktop_ensor_scheme_get_type*(): GType
proc he_desktop_ensor_scheme_to_variant*(self: HeDesktopEnsorScheme): HeSchemeVariant
proc he_desktop_get_prefers_color_scheme*(self: GtkWidget): HeDesktopColorScheme
proc he_desktop_set_prefers_color_scheme*(self: GtkWidget, value: HeDesktopColorScheme)
proc he_desktop_get_ensor_scheme*(self: GtkWidget): HeDesktopEnsorScheme
proc he_desktop_get_accent_color*(self: GtkWidget): pointer
proc he_desktop_set_accent_color*(self: GtkWidget, value: pointer)
proc he_desktop_get_font_weight*(self: GtkWidget): cdouble
proc he_desktop_set_font_weight*(self: GtkWidget, value: cdouble)
proc he_desktop_get_roundness*(self: GtkWidget): cdouble
proc he_desktop_set_roundness*(self: GtkWidget, value: cdouble)
proc he_desktop_get_contrast*(self: GtkWidget): cdouble
proc he_desktop_set_contrast*(self: GtkWidget, value: cdouble)
proc he_desktop_new*(): GtkWidget
proc he_desktop_construct*(object_type_v: GType): pointer
proc he_contrast_ref*(instance: pointer): pointer
proc he_contrast_unref*(instance: pointer)
proc he_param_spec_contrast*(
  name: pointer, nick: pointer, blurb: pointer, object_type_v: GType, flags: pointer
): pointer

proc he_value_set_contrast*(value: pointer, v_object: pointer)
proc he_value_take_contrast*(value: pointer, v_object: pointer)
proc he_value_get_contrast*(value: pointer): pointer
proc he_contrast_get_type*(): GType
proc he_contrast_ratio_of_ys*(y1: cdouble, y2: cdouble): cdouble
proc he_contrast_ratio_of_tones*(t1: cdouble, t2: cdouble): cdouble
proc he_contrast_lighter*(tone: cdouble, ratio: cdouble): cdouble
proc he_contrast_lighter_unsafe*(tone: cdouble, ratio: cdouble): cdouble
proc he_contrast_darker*(tone: cdouble, ratio: cdouble): cdouble
proc he_contrast_darker_unsafe*(tone: cdouble, ratio: cdouble): cdouble
proc he_contrast_curve_ref*(instance: pointer): pointer
proc he_contrast_curve_unref*(instance: pointer)
proc he_param_spec_contrast_curve*(
  name: pointer, nick: pointer, blurb: pointer, object_type_v: GType, flags: pointer
): pointer

proc he_value_set_contrast_curve*(value: pointer, v_object: pointer)
proc he_value_take_contrast_curve*(value: pointer, v_object: pointer)
proc he_value_get_contrast_curve*(value: pointer): pointer
proc he_contrast_curve_get_type*(): GType
proc he_contrast_curve_new*(
  low: cdouble, normal: cdouble, medium: cdouble, high: cdouble
): pointer

proc he_contrast_curve_construct*(
  object_type_v: GType, low: cdouble, normal: cdouble, medium: cdouble, high: cdouble
): pointer

proc he_contrast_curve_get*(self: GtkWidget, contrast: cdouble): cdouble
proc he_tonal_palette_get_type*(): GType
proc he_tone_delta_pair_get_type*(): GType
proc he_dynamic_color_get_type*(): GType
proc he_dynamic_color_get_name*(self: GtkWidget): pointer
proc he_dynamic_color_set_name*(self: GtkWidget, value: pointer)
proc he_dynamic_color_get_is_background*(self: GtkWidget): cint
proc he_dynamic_color_set_is_background*(self: GtkWidget, value: cint)
proc he_dynamic_color_get_chromamult*(self: GtkWidget): cdouble
proc he_dynamic_color_set_chromamult*(self: GtkWidget, value: cdouble)
proc he_dynamic_color_get_contrast_curve*(self: GtkWidget): pointer
proc he_dynamic_color_set_contrast_curve*(self: GtkWidget, value: pointer)
proc he_dynamic_color_new*(
  name: pointer,
  palette: HePaletteFunc,
  palette_target: pointer,
  tone: HeToneFunc,
  tone_target: pointer,
  chromamult: cdouble,
  is_background: pointer,
  background: HeBackgroundFunc,
  background_target: pointer,
  second_background: HeBackgroundFunc,
  second_background_target: pointer,
  contrast_curve: pointer,
  tone_delta_pair: HeToneDeltaPairFunc,
  tone_delta_pair_target: pointer,
): pointer

proc he_dynamic_color_construct*(
  object_type_v: GType,
  name: pointer,
  palette: HePaletteFunc,
  palette_target: pointer,
  tone: HeToneFunc,
  tone_target: pointer,
  chromamult: cdouble,
  is_background: pointer,
  background: HeBackgroundFunc,
  background_target: pointer,
  second_background: HeBackgroundFunc,
  second_background_target: pointer,
  contrast_curve: pointer,
  tone_delta_pair: HeToneDeltaPairFunc,
  tone_delta_pair_target: pointer,
): pointer

proc he_dynamic_color_new_from_palette*(
  name: pointer,
  palette: HePaletteFunc,
  palette_target: pointer,
  tone: HeToneFunc,
  tone_target: pointer,
): pointer

proc he_dynamic_color_construct_from_palette*(
  object_type_v: GType,
  name: pointer,
  palette: HePaletteFunc,
  palette_target: pointer,
  tone: HeToneFunc,
  tone_target: pointer,
): pointer

proc he_dynamic_color_build*(self: GtkWidget): pointer
proc he_dynamic_color_get_hct*(
  self: GtkWidget, scheme: pointer, color: pointer, result: pointer
)

proc he_dynamic_color_get_hue*(self: GtkWidget, scheme: pointer): cdouble
proc he_dynamic_color_get_initial_tone_from_background*(
  self: GtkWidget,
  background: HeBackgroundFunc,
  background_target: pointer,
  result_target: pointer,
  result_target_destroy_notify: pointer,
): HeToneFunc

proc he_dynamic_color_get_tone_from_scheme*(self: GtkWidget, scheme: pointer): cdouble
proc he_dynamic_color_get_tone*(
  self: GtkWidget, scheme: pointer, color: pointer
): cdouble

proc he_dynamic_color_foreground_tone*(
  self: GtkWidget, bg_tone: cdouble, ratio: cdouble
): cdouble

proc he_dynamic_color_enable_light_foreground*(tone: cdouble): cdouble
proc he_dynamic_color_tone_prefers_light_foreground*(tone: cdouble): cint
proc he_dynamic_color_tone_allows_light_foreground*(tone: cdouble): cint
proc he_dynamic_scheme_new*(
  hct: pointer,
  variant: HeSchemeVariant,
  is_dark: cint,
  contrast_level: cdouble,
  primary: pointer,
  secondary: pointer,
  tertiary: pointer,
  neutral: pointer,
  neutral_variant: pointer,
  error: pointer,
): DynamicScheme

proc he_dynamic_scheme_construct*(
  object_type_v: GType,
  hct: pointer,
  variant: HeSchemeVariant,
  is_dark: cint,
  contrast_level: cdouble,
  primary: pointer,
  secondary: pointer,
  tertiary: pointer,
  neutral: pointer,
  neutral_variant: pointer,
  error: pointer,
): DynamicScheme

proc he_dynamic_scheme_get_hct*(
  self: DynamicScheme, dynamic_color: pointer, result: pointer
)

proc he_dynamic_scheme_get_hue*(self: DynamicScheme, dynamic_color: pointer): cdouble
proc he_dynamic_scheme_get_rotated_hue*(
  self: DynamicScheme, hb: pointer, hb_length1: cint, r: pointer, r_length1: cint
): cdouble

proc he_dynamic_scheme_get_primary_key*(self: DynamicScheme): pointer
proc he_dynamic_scheme_get_secondary_key*(self: DynamicScheme): pointer
proc he_dynamic_scheme_get_tertiary_key*(self: DynamicScheme): pointer
proc he_dynamic_scheme_get_neutral_key*(self: DynamicScheme): pointer
proc he_dynamic_scheme_get_neutral_variant_key*(self: DynamicScheme): pointer
proc he_dynamic_scheme_get_background*(self: DynamicScheme): pointer
proc he_dynamic_scheme_get_background_hct*(self: DynamicScheme, result: pointer)
proc he_dynamic_scheme_get_on_background*(self: DynamicScheme): pointer
proc he_dynamic_scheme_get_surface*(self: DynamicScheme): pointer
proc he_dynamic_scheme_get_surface_dim*(self: DynamicScheme): pointer
proc he_dynamic_scheme_get_surface_bright*(self: DynamicScheme): pointer
proc he_dynamic_scheme_get_surface_container_lowest*(self: DynamicScheme): pointer
proc he_dynamic_scheme_get_surface_container_low*(self: DynamicScheme): pointer
proc he_dynamic_scheme_get_surface_container*(self: DynamicScheme): pointer
proc he_dynamic_scheme_get_surface_container_high*(self: DynamicScheme): pointer
proc he_dynamic_scheme_get_surface_container_highest*(self: DynamicScheme): pointer
proc he_dynamic_scheme_get_on_surface*(self: DynamicScheme): pointer
proc he_dynamic_scheme_get_surface_variant*(self: DynamicScheme): pointer
proc he_dynamic_scheme_get_on_surface_variant*(self: DynamicScheme): pointer
proc he_dynamic_scheme_get_inverse_surface*(self: DynamicScheme): pointer
proc he_dynamic_scheme_get_inverse_on_surface*(self: DynamicScheme): pointer
proc he_dynamic_scheme_get_outline*(self: DynamicScheme): pointer
proc he_dynamic_scheme_get_outline_variant*(self: DynamicScheme): pointer
proc he_dynamic_scheme_get_shadow*(self: DynamicScheme): pointer
proc he_dynamic_scheme_get_scrim*(self: DynamicScheme): pointer
proc he_dynamic_scheme_get_primary*(self: DynamicScheme): pointer
proc he_dynamic_scheme_get_on_primary*(self: DynamicScheme): pointer
proc he_dynamic_scheme_get_primary_container*(self: DynamicScheme): pointer
proc he_dynamic_scheme_get_on_primary_container*(self: DynamicScheme): pointer
proc he_dynamic_scheme_get_inverse_primary*(self: DynamicScheme): pointer
proc he_dynamic_scheme_get_secondary*(self: DynamicScheme): pointer
proc he_dynamic_scheme_get_on_secondary*(self: DynamicScheme): pointer
proc he_dynamic_scheme_get_secondary_container*(self: DynamicScheme): pointer
proc he_dynamic_scheme_get_on_secondary_container*(self: DynamicScheme): pointer
proc he_dynamic_scheme_get_tertiary*(self: DynamicScheme): pointer
proc he_dynamic_scheme_get_on_tertiary*(self: DynamicScheme): pointer
proc he_dynamic_scheme_get_tertiary_container*(self: DynamicScheme): pointer
proc he_dynamic_scheme_get_on_tertiary_container*(self: DynamicScheme): pointer
proc he_dynamic_scheme_get_error*(self: DynamicScheme): pointer
proc he_dynamic_scheme_get_on_error*(self: DynamicScheme): pointer
proc he_dynamic_scheme_get_error_container*(self: DynamicScheme): pointer
proc he_dynamic_scheme_get_on_error_container*(self: DynamicScheme): pointer
proc he_ensor_accent_from_pixels_async*(
  pixels: pointer,
  pixels_length1: cint,
  alpha: cint,
  callback: GAsyncReadyCallback,
  user_data: pointer,
)

proc he_ensor_accent_from_pixels_finish*(res: pointer): pointer
proc he_key_color_get_type*(): GType
proc he_key_color_get_hue*(self: GtkWidget): cdouble
proc he_key_color_set_hue*(self: GtkWidget, value: cdouble)
proc he_key_color_get_requested_chroma*(self: GtkWidget): cdouble
proc he_key_color_set_requested_chroma*(self: GtkWidget, value: cdouble)
proc he_key_color_new*(hue: cdouble, requested_chroma: cdouble): pointer
proc he_key_color_construct*(
  object_type_v: GType, hue: cdouble, requested_chroma: cdouble
): pointer

proc he_key_color_create*(self: GtkWidget, result: pointer)
proc he_quantizer_get_type*(): GType
proc he_quantizer_result_get_type*(): GType
proc he_quantizer_quantize*(
  self: GtkWidget, pixels: pointer, pixels_length1: cint, max_colors: cint
): pointer

proc he_quantizer_construct*(object_type_v: GType): pointer
proc he_quantizer_celebi_ref*(instance: pointer): pointer
proc he_quantizer_celebi_unref*(instance: pointer)
proc he_param_spec_quantizer_celebi*(
  name: pointer, nick: pointer, blurb: pointer, object_type_v: GType, flags: pointer
): pointer

proc he_value_set_quantizer_celebi*(value: pointer, v_object: pointer)
proc he_value_take_quantizer_celebi*(value: pointer, v_object: pointer)
proc he_value_get_quantizer_celebi*(value: pointer): pointer
proc he_quantizer_celebi_get_type*(): GType
proc he_quantizer_celebi_new*(): GtkWidget
proc he_quantizer_celebi_construct*(object_type_v: GType): pointer
proc he_quantizer_celebi_quantize*(
  self: GtkWidget, pixels: pointer, pixels_length1: cint, max_colors: cint
): pointer

proc he_quantizer_map_get_type*(): GType
proc he_quantizer_map_get_color_to_count*(self: GtkWidget): pointer
proc he_quantizer_map_new*(): GtkWidget
proc he_quantizer_map_construct*(object_type_v: GType): pointer
proc he_quantizer_result_new*(color_to_count: pointer): pointer
proc he_quantizer_result_construct*(
  object_type_v: GType, color_to_count: pointer
): pointer

proc he_quantizer_wsmeans_get_type*(): GType
proc he_quantizer_wsmeans_quantize*(
  input_pixels: pointer,
  input_pixels_length1: cint,
  starting_clusters: pointer,
  starting_clusters_length1: cint,
  max_colors: cint,
): pointer

proc he_quantizer_wu_get_type*(): GType
proc he_quantizer_wu_new*(): GtkWidget
proc he_quantizer_wu_construct*(object_type_v: GType): pointer
proc he_content_scheme_get_type*(): GType
proc he_content_scheme_generate*(
  self: GtkWidget, hct: pointer, is_dark: cint, contrast: cdouble
): pointer

proc he_content_scheme_new*(): GtkWidget
proc he_content_scheme_construct*(object_type_v: GType): pointer
proc he_default_scheme_get_type*(): GType
proc he_default_scheme_generate*(
  self: GtkWidget, hct: pointer, is_dark: cint, contrast: cdouble
): pointer

proc he_default_scheme_new*(): GtkWidget
proc he_default_scheme_construct*(object_type_v: GType): pointer
proc he_monochromatic_scheme_get_type*(): GType
proc he_monochromatic_scheme_generate*(
  self: GtkWidget, hct: pointer, is_dark: cint, contrast: cdouble
): pointer

proc he_monochromatic_scheme_new*(): GtkWidget
proc he_monochromatic_scheme_construct*(object_type_v: GType): pointer
proc he_muted_scheme_get_type*(): GType
proc he_muted_scheme_generate*(
  self: GtkWidget, hct: pointer, is_dark: cint, contrast: cdouble
): pointer

proc he_muted_scheme_new*(): GtkWidget
proc he_muted_scheme_construct*(object_type_v: GType): pointer
proc he_salad_scheme_get_type*(): GType
proc he_salad_scheme_generate*(
  self: GtkWidget, hct: pointer, is_dark: cint, contrast: cdouble
): pointer

proc he_salad_scheme_new*(): GtkWidget
proc he_salad_scheme_construct*(object_type_v: GType): pointer
proc he_scheme_ref*(instance: pointer): pointer
proc he_scheme_unref*(instance: pointer)
proc he_param_spec_scheme*(
  name: pointer, nick: pointer, blurb: pointer, object_type_v: GType, flags: pointer
): pointer

proc he_value_set_scheme*(value: pointer, v_object: pointer)
proc he_value_take_scheme*(value: pointer, v_object: pointer)
proc he_value_get_scheme*(value: pointer): pointer
proc he_scheme_get_type*(): GType
proc he_scheme_new*(): GtkWidget
proc he_scheme_construct*(object_type_v: GType): pointer
proc he_scheme_t_max_c*(
  self: GtkWidget,
  palette: pointer,
  lower_bound: cdouble,
  upper_bound: cdouble,
  chroma_multiplier: cdouble,
): cdouble

proc he_scheme_t_min_c*(
  self: GtkWidget, palette: pointer, lower_bound: cdouble, upper_bound: cdouble
): cdouble

proc he_scheme_find_best_tone_for_chroma*(
  self: GtkWidget,
  hue: cdouble,
  chroma: cdouble,
  tone: cdouble,
  by_decreasing_tone: cint,
): cdouble

proc he_scheme_get_curve*(self: GtkWidget, def_c: cdouble): pointer
proc he_scheme_primary_key*(self: GtkWidget): pointer
proc he_scheme_secondary_key*(self: GtkWidget): pointer
proc he_scheme_tertiary_key*(self: GtkWidget): pointer
proc he_scheme_neutral_key*(self: GtkWidget): pointer
proc he_scheme_neutral_variant_key*(self: GtkWidget): pointer
proc he_scheme_background*(self: GtkWidget): pointer
proc he_scheme_on_background*(self: GtkWidget): pointer
proc he_scheme_surface*(self: GtkWidget): pointer
proc he_scheme_surface_variant*(self: GtkWidget): pointer
proc he_scheme_on_surface*(self: GtkWidget): pointer
proc he_scheme_on_surface_variant*(self: GtkWidget): pointer
proc he_scheme_outline*(self: GtkWidget): pointer
proc he_scheme_outline_variant*(self: GtkWidget): pointer
proc he_scheme_inverse_surface*(self: GtkWidget): pointer
proc he_scheme_inverse_on_surface*(self: GtkWidget): pointer
proc he_scheme_inverse_primary*(self: GtkWidget): pointer
proc he_scheme_surface_bright*(self: GtkWidget): pointer
proc he_scheme_surface_dim*(self: GtkWidget): pointer
proc he_scheme_surface_container_lowest*(self: GtkWidget): pointer
proc he_scheme_surface_container_low*(self: GtkWidget): pointer
proc he_scheme_surface_container*(self: GtkWidget): pointer
proc he_scheme_surface_container_high*(self: GtkWidget): pointer
proc he_scheme_surface_container_highest*(self: GtkWidget): pointer
proc he_scheme_primary*(self: GtkWidget): pointer
proc he_scheme_on_primary*(self: GtkWidget): pointer
proc he_scheme_primary_container*(self: GtkWidget): pointer
proc he_scheme_on_primary_container*(self: GtkWidget): pointer
proc he_scheme_secondary*(self: GtkWidget): pointer
proc he_scheme_on_secondary*(self: GtkWidget): pointer
proc he_scheme_secondary_container*(self: GtkWidget): pointer
proc he_scheme_on_secondary_container*(self: GtkWidget): pointer
proc he_scheme_tertiary*(self: GtkWidget): pointer
proc he_scheme_on_tertiary*(self: GtkWidget): pointer
proc he_scheme_tertiary_container*(self: GtkWidget): pointer
proc he_scheme_on_tertiary_container*(self: GtkWidget): pointer
proc he_scheme_shadow*(self: GtkWidget): pointer
proc he_scheme_scrim*(self: GtkWidget): pointer
proc he_scheme_error*(self: GtkWidget): pointer
proc he_scheme_on_error*(self: GtkWidget): pointer
proc he_scheme_error_container*(self: GtkWidget): pointer
proc he_scheme_on_error_container*(self: GtkWidget): pointer
proc he_vibrant_scheme_get_type*(): GType
proc he_vibrant_scheme_generate*(
  self: GtkWidget, hct: pointer, is_dark: cint, contrast: cdouble
): pointer

proc he_vibrant_scheme_new*(): GtkWidget
proc he_vibrant_scheme_construct*(object_type_v: GType): pointer
proc he_score_ref*(instance: pointer): pointer
proc he_score_unref*(instance: pointer)
proc he_param_spec_score*(
  name: pointer, nick: pointer, blurb: pointer, object_type_v: GType, flags: pointer
): pointer

proc he_value_set_score*(value: pointer, v_object: pointer)
proc he_value_take_score*(value: pointer, v_object: pointer)
proc he_value_get_score*(value: pointer): pointer
proc he_score_get_type*(): GType
proc he_score_score*(
  self: GtkWidget, colors_to_population: pointer, desired: pointer
): pointer

proc he_score_new*(): GtkWidget
proc he_score_construct*(object_type_v: GType): pointer
proc he_score_annotated_color_ref*(instance: pointer): pointer
proc he_score_annotated_color_unref*(instance: pointer)
proc he_score_param_spec_annotated_color*(
  name: pointer, nick: pointer, blurb: pointer, object_type_v: GType, flags: pointer
): pointer

proc he_score_value_set_annotated_color*(value: pointer, v_object: pointer)
proc he_score_value_take_annotated_color*(value: pointer, v_object: pointer)
proc he_score_value_get_annotated_color*(value: pointer): pointer
proc he_score_annotated_color_get_type*(): GType
proc he_score_annotated_color_new*(): GtkWidget
proc he_score_annotated_color_construct*(object_type_v: GType): pointer
proc he_temperature_cache_get_type*(): GType
proc he_temperature_cache_get_input*(self: GtkWidget, result: pointer)
proc he_temperature_cache_set_input*(self: GtkWidget, value: pointer)
proc he_temperature_cache_new*(input: pointer): pointer
proc he_temperature_cache_construct*(object_type_v: GType, input: pointer): pointer
proc he_temperature_cache_get_hcts_by_temp*(self: GtkWidget): pointer
proc he_temperature_cache_diff_temps*(self: GtkWidget, a: pointer, b: pointer): cint
proc he_temperature_cache_get_warmest*(self: GtkWidget, result: pointer)
proc he_temperature_cache_get_coldest*(self: GtkWidget, result: pointer)
proc he_temperature_cache_get_complement*(self: GtkWidget, result: pointer)
proc he_temperature_cache_analogous*(
  self: GtkWidget, count: cint, divisions: cint
): pointer

proc he_temperature_cache_get_input_relative_temperature*(self: GtkWidget): cdouble
proc he_temperature_cache_get_temp*(self: GtkWidget, hct: pointer): cdouble
proc he_tonal_palette_get_hue*(self: GtkWidget): cdouble
proc he_tonal_palette_set_hue*(self: GtkWidget, value: cdouble)
proc he_tonal_palette_get_chroma*(self: GtkWidget): cdouble
proc he_tonal_palette_set_chroma*(self: GtkWidget, value: cdouble)
proc he_tonal_palette_get_key_color*(self: GtkWidget, result: pointer)
proc he_tonal_palette_set_key_color*(self: GtkWidget, value: pointer)
proc he_tonal_palette_new*(hue: cdouble, chroma: cdouble, key_color: pointer): pointer
proc he_tonal_palette_construct*(
  object_type_v: GType, hue: cdouble, chroma: cdouble, key_color: pointer
): pointer

proc he_tonal_palette_from_int*(argb: cint): pointer
proc he_tonal_palette_from_hct*(hct: pointer): pointer
proc he_tonal_palette_from_hue_and_chroma*(hue: cdouble, chroma: cdouble): pointer
proc he_tonal_palette_get_tone*(self: GtkWidget, tone: cint): cint
proc he_tonal_palette_get_hct*(self: GtkWidget, tone: cdouble, result: pointer)
proc he_tone_polarity_get_type*(): GType
proc he_tone_resolve_get_type*(): GType
proc he_tone_delta_pair_new*(
  role_a: pointer, role_b: pointer, delta: cdouble, polarity: pointer, resolve: pointer
): pointer

proc he_tone_delta_pair_construct*(
  object_type_v: GType,
  role_a: pointer,
  role_b: pointer,
  delta: cdouble,
  polarity: pointer,
  resolve: pointer,
): pointer

proc he_math_utils_clamp_int*(min: cint, max: cint, input: cint): cint
proc he_math_utils_clamp_double*(min: cdouble, max: cdouble, input: cdouble): cdouble
proc he_math_utils_signum*(num: cdouble): cint
proc he_math_utils_to_degrees*(radians: cdouble): cdouble
proc he_math_utils_to_radians*(degrees: cdouble): cdouble
proc he_math_utils_chromatic_adaptation*(component: cdouble): cdouble
proc he_math_utils_inverse_chromatic_adaptation*(adapted: cdouble): cdouble
proc he_math_utils_lerp_point*(
  source: pointer,
  source_length1: cint,
  t: cdouble,
  target: pointer,
  target_length1: cint,
  result_length1: pointer,
): pointer

proc he_math_utils_lerp*(a: cdouble, b: cdouble, t: cdouble): cdouble
proc he_math_utils_sanitize_radians*(angle: cdouble): cdouble
proc he_math_utils_is_bounded_rgb*(x: cdouble): cint
proc he_math_utils_adapt*(color_channel: cdouble): cdouble
proc he_math_utils_elem_mul*(
  row: pointer,
  row_length1: cint,
  matrix: pointer,
  matrix_length1: cint,
  matrix_length2: cint,
  result_length1: pointer,
): pointer

proc he_math_utils_lab_inverse_fovea*(ft: cdouble): cdouble
proc he_math_utils_lab_fovea*(t: cdouble): cdouble
proc he_math_utils_sanitize_degrees*(degrees: cdouble): cdouble
proc he_math_utils_sanitize_degrees_int*(degrees: cint): cint
proc he_math_utils_rotate_direction*(from_v: cdouble, to: cdouble): cdouble
proc he_math_utils_difference_degrees*(a: cdouble, b: cdouble): cdouble
proc he_math_utils_abs*(n: cdouble): cdouble
proc he_math_utils_iabs*(n: cint): cint
proc he_math_utils_pow*(b: cdouble, e: cdouble): cdouble
proc he_math_utils_round*(n: cdouble): cint
proc he_math_utils_round_double*(n: cdouble): cdouble
proc he_math_utils_max*(n: cdouble, m: cdouble): cdouble
proc he_math_utils_min*(n: cdouble, m: cdouble): cdouble
proc he_math_utils_linearized*(rgb_component: cint): cdouble
proc he_math_utils_delinearized*(rgb_component: cdouble): cint
proc he_math_utils_double_delinearized*(rgb_component: cdouble): cdouble
proc he_math_utils_midpoint*(
  a: pointer, a_length1: cint, b: pointer, b_length1: cint, result_length1: pointer
): pointer

proc he_math_utils_intercept*(source: cdouble, mid: cdouble, target: cdouble): cdouble
proc he_math_utils_hue_of*(linrgb: pointer, linrgb_length1: cint): cdouble
proc he_math_utils_nth_vertex*(y: cdouble, n: cint, result_length1: pointer): pointer
proc he_math_utils_are_in_cyclic_order*(a: cdouble, b: cdouble, c: cdouble): cint
proc he_math_utils_set_coordinate*(
  source: pointer,
  source_length1: cint,
  coordinate: cdouble,
  target: pointer,
  target_length1: cint,
  axis: cint,
  result_length1: pointer,
): pointer

proc he_math_utils_convert*(value: cdouble): cdouble
proc he_math_utils_bisect_to_segment*(
  y: cdouble, target_hue: cdouble, result_length1: pointer
): pointer

proc he_math_utils_bisect_to_limit*(
  y: cdouble, target_hue: cdouble, result_length1: pointer
): pointer

proc he_math_utils_y_from_lstar*(lstar: cdouble): cdouble
proc he_math_utils_argb_from_lstar*(lstar: cdouble): cint
proc he_math_utils_lstar_from_argb*(argb: cint): cdouble
proc he_math_utils_lstar_from_y*(y: cdouble): cdouble
proc he_math_utils_clamp*(start: cdouble, end_value: cdouble, value: cdouble): cdouble
proc he_misc_find_ancestor_of_type*(
  t_type_v: GType, t_dup_func: pointer, t_destroy_func: GDestroyNotify, widget: pointer
): pointer

proc he_misc_contrast_ratio*(
  red: cdouble,
  green: cdouble,
  blue: cdouble,
  red2: cdouble,
  green2: cdouble,
  blue2: cdouble,
): cdouble

proc he_misc_fix_fg_contrast*(
  red: cdouble,
  green: cdouble,
  blue: cdouble,
  red2: cdouble,
  green2: cdouble,
  blue2: cdouble,
  result_length1: pointer,
): pointer

proc he_misc_accel_label*(accel: pointer): pointer
proc he_misc_accel_string*(
  accels: pointer, accels_length1: cint, description: pointer
): pointer

proc he_viewing_conditions_get_aw*(self: GtkWidget): cdouble
proc he_viewing_conditions_set_aw*(self: GtkWidget, value: cdouble)
proc he_viewing_conditions_get_nbb*(self: GtkWidget): cdouble
proc he_viewing_conditions_set_nbb*(self: GtkWidget, value: cdouble)
proc he_viewing_conditions_get_ncb*(self: GtkWidget): cdouble
proc he_viewing_conditions_set_ncb*(self: GtkWidget, value: cdouble)
proc he_viewing_conditions_get_c*(self: GtkWidget): cdouble
proc he_viewing_conditions_set_c*(self: GtkWidget, value: cdouble)
proc he_viewing_conditions_get_nc*(self: GtkWidget): cdouble
proc he_viewing_conditions_set_nc*(self: GtkWidget, value: cdouble)
proc he_viewing_conditions_get_n*(self: GtkWidget): cdouble
proc he_viewing_conditions_set_n*(self: GtkWidget, value: cdouble)
proc he_viewing_conditions_get_fl*(self: GtkWidget): cdouble
proc he_viewing_conditions_set_fl*(self: GtkWidget, value: cdouble)
proc he_viewing_conditions_get_fl_root*(self: GtkWidget): cdouble
proc he_viewing_conditions_set_fl_root*(self: GtkWidget, value: cdouble)
proc he_viewing_conditions_get_z*(self: GtkWidget): cdouble
proc he_viewing_conditions_set_z*(self: GtkWidget, value: cdouble)
proc he_viewing_conditions_lerp*(
  start: cdouble, stop: cdouble, amount: cdouble
): cdouble

proc he_viewing_conditions_make*(
  white_point: pointer,
  white_point_length1: cint,
  adapting_luminance: cdouble,
  bg_lstar: cdouble,
  surround: cdouble,
  discount_illuminant: cint,
): pointer

proc he_viewing_conditions_with_lstar*(lstar: cdouble): pointer
proc he_about_window_get_type*(): GType
proc he_about_window_licenses_get_type*(): GType
proc he_about_window_licenses_get_url*(self: HeAboutWindowLicenses): pointer
proc he_about_window_licenses_get_name*(self: HeAboutWindowLicenses): pointer
proc he_about_window_get_visible*(self: GtkWidget): cint
proc he_about_window_set_visible*(self: GtkWidget, value: cint)
proc he_about_window_get_color*(self: GtkWidget): HeColors
proc he_about_window_set_color*(self: GtkWidget, value: HeColors)
proc he_about_window_get_license*(self: GtkWidget): HeAboutWindowLicenses
proc he_about_window_set_license*(self: GtkWidget, value: HeAboutWindowLicenses)
proc he_about_window_get_version*(self: GtkWidget): pointer
proc he_about_window_set_version*(self: GtkWidget, value: pointer)
proc he_about_window_get_app_name*(self: GtkWidget): pointer
proc he_about_window_set_app_name*(self: GtkWidget, value: pointer)
proc he_about_window_get_icon*(self: GtkWidget): pointer
proc he_about_window_set_icon*(self: GtkWidget, value: pointer)
proc he_about_window_get_translator_names*(
  self: GtkWidget, result_length1: pointer
): pointer

proc he_about_window_set_translator_names*(
  self: GtkWidget, value: pointer, value_length1: cint
)

proc he_about_window_get_developer_names*(
  self: GtkWidget, result_length1: pointer
): pointer

proc he_about_window_set_developer_names*(
  self: GtkWidget, value: pointer, value_length1: cint
)

proc he_about_window_get_copyright_year*(self: GtkWidget): cint
proc he_about_window_set_copyright_year*(self: GtkWidget, value: cint)
proc he_about_window_get_app_id*(self: GtkWidget): pointer
proc he_about_window_set_app_id*(self: GtkWidget, value: pointer)
proc he_about_window_get_translate_url*(self: GtkWidget): pointer
proc he_about_window_set_translate_url*(self: GtkWidget, value: pointer)
proc he_about_window_get_issue_url*(self: GtkWidget): pointer
proc he_about_window_set_issue_url*(self: GtkWidget, value: pointer)
proc he_about_window_get_more_info_url*(self: GtkWidget): pointer
proc he_about_window_set_more_info_url*(self: GtkWidget, value: pointer)
proc he_about_window_present*(self: GtkWidget)
proc he_about_window_hide_about*(self: GtkWidget)
proc he_about_window_new*(
  parent: pointer,
  app_name: pointer,
  app_id: pointer,
  version: pointer,
  icon: pointer,
  translate_url: pointer,
  issue_url: pointer,
  more_info_url: pointer,
  translators: pointer,
  translators_length1: cint,
  developers: pointer,
  developers_length1: cint,
  copyright_year: cint,
  license: HeAboutWindowLicenses,
  color: HeColors,
): pointer

proc he_about_window_construct*(
  object_type_v: GType,
  parent: pointer,
  app_name: pointer,
  app_id: pointer,
  version: pointer,
  icon: pointer,
  translate_url: pointer,
  issue_url: pointer,
  more_info_url: pointer,
  translators: pointer,
  translators_length1: cint,
  developers: pointer,
  developers_length1: cint,
  copyright_year: cint,
  license: HeAboutWindowLicenses,
  color: HeColors,
): pointer

proc he_app_bar_get_type*(): GType
proc he_button_get_type*(): GType
proc he_app_bar_get_stack*(self: GtkWidget): pointer
proc he_app_bar_set_stack*(self: GtkWidget, value: pointer)
proc he_app_bar_get_scroller*(self: GtkWidget): pointer
proc he_app_bar_set_scroller*(self: GtkWidget, value: pointer)
proc he_app_bar_get_is_compact*(self: GtkWidget): cint
proc he_app_bar_set_is_compact*(self: GtkWidget, value: cint)
proc he_app_bar_get_viewtitle_widget*(self: GtkWidget): pointer
proc he_app_bar_set_viewtitle_widget*(self: GtkWidget, value: pointer)
proc he_app_bar_get_viewsubtitle_label*(self: GtkWidget): pointer
proc he_app_bar_set_viewsubtitle_label*(self: GtkWidget, value: pointer)
proc he_app_bar_get_show_left_title_buttons*(self: GtkWidget): cint
proc he_app_bar_set_show_left_title_buttons*(self: GtkWidget, value: cint)
proc he_app_bar_get_show_right_title_buttons*(self: GtkWidget): cint
proc he_app_bar_set_show_right_title_buttons*(self: GtkWidget, value: cint)
proc he_app_bar_get_decoration_layout*(self: GtkWidget): pointer
proc he_app_bar_set_decoration_layout*(self: GtkWidget, value: pointer)
proc he_app_bar_get_show_back*(self: GtkWidget): cint
proc he_app_bar_set_show_back*(self: GtkWidget, value: cint)
proc he_app_bar_append*(self: GtkWidget, child: pointer)
proc he_app_bar_append_toggle*(self: GtkWidget, child: pointer)
proc he_app_bar_append_menu*(self: GtkWidget, child: pointer)
proc he_app_bar_remove*(self: GtkWidget, child: pointer)
proc he_app_bar_new*(): GtkWidget
proc he_app_bar_construct*(object_type_v: GType): pointer
proc he_application_window_get_type*(): GType
proc he_application_window_new*(): GtkWidget
proc he_application_window_new*(app: pointer): GtkWidget
proc he_application_window_construct*(object_type_v: GType, app: pointer): GtkWidget
proc he_application_window_get_has_title*(self: GtkWidget): cint
proc he_application_window_set_has_title*(self: GtkWidget, value: cint)
proc he_application_window_get_has_back_button*(self: GtkWidget): cint
proc he_application_window_set_has_back_button*(self: GtkWidget, value: cint)
proc he_avatar_get_type*(): GType
proc he_avatar_status_color_get_type*(): GType
proc he_avatar_get_size*(self: GtkWidget): cint
proc he_avatar_set_size*(self: GtkWidget, value: cint)
proc he_avatar_get_text*(self: GtkWidget): pointer
proc he_avatar_set_text*(self: GtkWidget, value: pointer)
proc he_avatar_get_status*(self: GtkWidget): cint
proc he_avatar_set_status*(self: GtkWidget, value: cint)
proc he_avatar_get_status_color*(self: GtkWidget): HeAvatarStatusColor
proc he_avatar_set_status_color*(self: GtkWidget, value: HeAvatarStatusColor)
proc he_avatar_get_image*(self: GtkWidget): pointer
proc he_avatar_set_image*(self: GtkWidget, value: pointer)
proc he_avatar_new*(
  size: cint, image: pointer, text: pointer, status: cint, status_color: pointer
): pointer

proc he_avatar_construct*(
  object_type_v: GType,
  size: cint,
  image: pointer,
  text: pointer,
  status: cint,
  status_color: pointer,
): pointer

proc he_badge_get_type*(): GType
proc he_badge_get_child*(self: GtkWidget): pointer
proc he_badge_set_child*(self: GtkWidget, value: pointer)
proc he_badge_get_label*(self: GtkWidget): pointer
proc he_badge_set_label*(self: GtkWidget, value: pointer)
proc he_badge_new*(): GtkWidget
proc he_badge_construct*(object_type_v: GType): pointer
proc he_banner_get_type*(): GType
proc he_banner_style_get_type*(): GType
proc he_banner_get_title*(self: GtkWidget): pointer
proc he_banner_set_title*(self: GtkWidget, value: pointer)
proc he_banner_get_description*(self: GtkWidget): pointer
proc he_banner_set_description*(self: GtkWidget, value: pointer)
proc he_banner_get_style*(self: GtkWidget): HeBannerStyle
proc he_banner_set_style*(self: GtkWidget, value: HeBannerStyle)
proc he_banner_add_action_button*(self: GtkWidget, widget: pointer)
proc he_banner_remove_action*(self: GtkWidget, widget: pointer)
proc he_banner_set_banner_style*(self: GtkWidget, style: HeBannerStyle)
proc he_banner_new*(title: pointer, description: pointer): pointer
proc he_banner_construct*(
  object_type_v: GType, title: pointer, description: pointer
): pointer

proc he_bottom_bar_get_type*(): GType
proc he_bottom_bar_mode_get_type*(): GType
proc he_bottom_bar_style_get_type*(): GType
proc he_bottom_bar_floating_position_get_type*(): GType
proc he_bottom_bar_position_get_type*(): GType
proc he_bottom_bar_get_title*(self: GtkWidget): pointer
proc he_bottom_bar_set_title*(self: GtkWidget, value: pointer)
proc he_overlay_button_get_type*(): GType
proc he_bottom_bar_get_overlay_button*(self: GtkWidget): pointer
proc he_bottom_bar_set_overlay_button*(self: GtkWidget, value: pointer)
proc he_bottom_bar_get_description*(self: GtkWidget): pointer
proc he_bottom_bar_set_description*(self: GtkWidget, value: pointer)
proc he_bottom_bar_get_mode*(self: GtkWidget): HeBottomBarMode
proc he_bottom_bar_set_mode*(self: GtkWidget, value: HeBottomBarMode)
proc he_bottom_bar_get_style*(self: GtkWidget): HeBottomBarStyle
proc he_bottom_bar_set_style*(self: GtkWidget, value: HeBottomBarStyle)
proc he_bottom_bar_get_floating_position*(self: GtkWidget): HeBottomBarFloatingPosition
proc he_bottom_bar_set_floating_position*(
  self: GtkWidget, value: HeBottomBarFloatingPosition
)

proc he_bottom_bar_get_overlay_widget*(self: GtkWidget): pointer
proc he_bottom_bar_set_overlay_widget*(self: GtkWidget, value: pointer)
proc he_bottom_bar_new*(): GtkWidget
proc he_bottom_bar_construct*(object_type_v: GType): pointer
proc he_bottom_bar_new_with_details*(title: pointer, description: pointer): pointer
proc he_bottom_bar_construct_with_details*(
  object_type_v: GType, title: pointer, description: pointer
): pointer

proc he_bottom_bar_new_floating*(overlay_widget: pointer): pointer
proc he_bottom_bar_construct_floating*(
  object_type_v: GType, overlay_widget: pointer
): pointer

proc he_bottom_bar_append_button*(
  self: GtkWidget, button: pointer, position: HeBottomBarPosition
)

proc he_bottom_bar_prepend_button*(
  self: GtkWidget, button: pointer, position: HeBottomBarPosition
)

proc he_bottom_bar_remove_button*(self: GtkWidget, button: pointer)
proc he_bottom_bar_insert_button_after*(
  self: GtkWidget, button: pointer, after: pointer, position: HeBottomBarPosition
)

proc he_bottom_bar_clear_buttons*(self: GtkWidget)
proc he_bottom_bar_get_button_count*(
  self: GtkWidget, position: HeBottomBarPosition
): cint

proc he_bottom_sheet_get_type*(): GType
proc he_bottom_sheet_get_sheet*(self: GtkWidget): pointer
proc he_bottom_sheet_set_sheet*(self: GtkWidget, value: pointer)
proc he_bottom_sheet_get_sheet_stack*(self: GtkWidget): pointer
proc he_bottom_sheet_set_sheet_stack*(self: GtkWidget, value: pointer)
proc he_bottom_sheet_get_button*(self: GtkWidget): pointer
proc he_bottom_sheet_set_button*(self: GtkWidget, value: pointer)
proc he_bottom_sheet_get_title*(self: GtkWidget): pointer
proc he_bottom_sheet_set_title*(self: GtkWidget, value: pointer)
proc he_bottom_sheet_get_show_sheet*(self: GtkWidget): cint
proc he_bottom_sheet_set_show_sheet*(self: GtkWidget, value: cint)
proc he_bottom_sheet_get_modal*(self: GtkWidget): cint
proc he_bottom_sheet_set_modal*(self: GtkWidget, value: cint)
proc he_bottom_sheet_get_show_handle*(self: GtkWidget): cint
proc he_bottom_sheet_set_show_handle*(self: GtkWidget, value: cint)
proc he_bottom_sheet_get_preferred_sheet_height*(self: GtkWidget): cint
proc he_bottom_sheet_set_preferred_sheet_height*(self: GtkWidget, value: cint)
proc he_bottom_sheet_new*(): GtkWidget
proc he_bottom_sheet_construct*(object_type_v: GType): pointer
proc he_button_color_get_type*(): GType
proc he_button_size_get_type*(): GType
proc he_button_width_get_type*(): GType
proc he_button_get_custom_color*(self: GtkWidget): HeColors
proc he_button_set_custom_color*(self: GtkWidget, value: HeColors)
proc he_button_get_color*(self: GtkWidget): HeButtonColor
proc he_button_set_color*(self: GtkWidget, value: HeButtonColor)
proc he_button_get_size*(self: GtkWidget): HeButtonSize
proc he_button_set_size*(self: GtkWidget, value: HeButtonSize)
proc he_button_get_width*(self: GtkWidget): HeButtonWidth
proc he_button_set_width*(self: GtkWidget, value: HeButtonWidth)
proc he_button_get_toggle_mode*(self: GtkWidget): cint
proc he_button_set_toggle_mode*(self: GtkWidget, value: cint)
proc he_button_get_active*(self: GtkWidget): cint
proc he_button_set_active*(self: GtkWidget, value: cint)
proc he_button_new*(icon: cstring, text: cstring): GtkWidget
proc he_button_get_text*(button: GtkWidget): cstring
proc he_button_set_text*(button: GtkWidget, value: cstring)
proc he_button_get_icon*(button: GtkWidget): cstring
proc he_button_set_icon*(button: GtkWidget, value: cstring)
proc he_button_get_color*(button: GtkWidget): HeColors
proc he_button_set_color*(button: GtkWidget, value: HeColors)
proc he_button_get_is_pill*(button: GtkWidget): cbool
proc he_button_set_is_pill*(button: GtkWidget, value: cbool)
proc he_button_get_is_fill*(button: GtkWidget): cbool
proc he_button_set_is_fill*(button: GtkWidget, value: cbool)
proc he_button_get_is_tint*(button: GtkWidget): cbool
proc he_button_set_is_tint*(button: GtkWidget, value: cbool)
proc he_button_get_is_iconic*(button: GtkWidget): cbool
proc he_button_set_is_iconic*(button: GtkWidget, value: cbool)
proc he_button_get_is_outline*(button: GtkWidget): cbool
proc he_button_set_is_outline*(button: GtkWidget, value: cbool)
proc he_button_get_is_textual*(button: GtkWidget): cbool
proc he_button_set_is_textual*(button: GtkWidget, value: cbool)
proc he_button_get_is_disclosure*(button: GtkWidget): cbool
proc he_button_set_is_disclosure*(button: GtkWidget, value: cbool)
proc he_button_construct*(object_type_v: GType, icon: pointer, text: pointer): pointer
proc he_card_type_get_type*(): GType
proc he_card_layout_get_type*(): GType
proc he_card_get_type*(): GType
proc he_card_get_card_type*(self: GtkWidget): HeCardType
proc he_card_set_card_type*(self: GtkWidget, value: HeCardType)
proc he_card_get_layout*(self: GtkWidget): HeCardLayout
proc he_card_set_layout*(self: GtkWidget, value: HeCardLayout)
proc he_card_get_title*(self: GtkWidget): pointer
proc he_card_set_title*(self: GtkWidget, value: pointer)
proc he_card_get_subtitle*(self: GtkWidget): pointer
proc he_card_set_subtitle*(self: GtkWidget, value: pointer)
proc he_card_get_icon*(self: GtkWidget): pointer
proc he_card_set_icon*(self: GtkWidget, value: pointer)
proc he_card_set_gicon*(self: GtkWidget, value: pointer)
proc he_card_set_paintable*(self: GtkWidget, value: pointer)
proc he_card_get_widget*(self: GtkWidget): pointer
proc he_card_set_widget*(self: GtkWidget, value: pointer)
proc he_card_get_secondary_button*(self: GtkWidget): pointer
proc he_card_set_secondary_button*(self: GtkWidget, value: pointer)
proc he_card_get_primary_button*(self: GtkWidget): pointer
proc he_card_set_primary_button*(self: GtkWidget, value: pointer)
proc he_card_new*(
  title: pointer,
  subtitle: pointer,
  icon: pointer,
  primary_button: pointer,
  secondary_button: pointer,
): pointer

proc he_card_construct*(
  object_type_v: GType,
  title: pointer,
  subtitle: pointer,
  icon: pointer,
  primary_button: pointer,
  secondary_button: pointer,
): pointer

proc he_card_new_horizontal*(
  title: pointer,
  subtitle: pointer,
  icon: pointer,
  primary_button: pointer,
  widget: pointer,
): pointer

proc he_card_construct_horizontal*(
  object_type_v: GType,
  title: pointer,
  subtitle: pointer,
  icon: pointer,
  primary_button: pointer,
  widget: pointer,
): pointer

proc he_content_block_get_type*(): GType
proc he_content_block_new*(
  title: pointer,
  subtitle: pointer,
  icon: pointer,
  primary_button: pointer,
  secondary_button: pointer,
): pointer

proc he_content_block_construct*(
  object_type_v: GType,
  title: pointer,
  subtitle: pointer,
  icon: pointer,
  primary_button: pointer,
  secondary_button: pointer,
): pointer

proc he_mini_content_block_get_type*(): GType
proc he_mini_content_block_new*(): GtkWidget
proc he_mini_content_block_construct*(object_type_v: GType): pointer
proc he_mini_content_block_new_with_details*(
  title: pointer, subtitle: pointer, primary_button: pointer, widget: pointer
): pointer

proc he_mini_content_block_construct_with_details*(
  object_type_v: GType,
  title: pointer,
  subtitle: pointer,
  primary_button: pointer,
  widget: pointer,
): pointer

proc he_chip_get_type*(): GType
proc he_chip_get_chip_label*(self: GtkWidget): pointer
proc he_chip_set_chip_label*(self: GtkWidget, value: pointer)
proc he_chip_get_show_close_button*(self: GtkWidget): cint
proc he_chip_set_show_close_button*(self: GtkWidget, value: cint)
proc he_chip_new*(label: pointer): pointer
proc he_chip_construct*(object_type_v: GType, label: pointer): pointer
proc he_chip_group_mode_get_type*(): GType
proc he_chip_group_get_type*(): GType
proc he_chip_group_get_selection_model*(self: GtkWidget): pointer
proc he_chip_group_set_selection_model*(self: GtkWidget, value: pointer)
proc he_chip_group_get_single_line*(self: GtkWidget): cint
proc he_chip_group_set_single_line*(self: GtkWidget, value: cint)
proc he_chip_group_get_mode*(self: GtkWidget): HeChipGroupMode
proc he_chip_group_set_mode*(self: GtkWidget, value: HeChipGroupMode)
proc he_chip_group_get_show_close_buttons*(self: GtkWidget): cint
proc he_chip_group_set_show_close_buttons*(self: GtkWidget, value: cint)
proc he_chip_group_new*(): GtkWidget
proc he_chip_group_construct*(object_type_v: GType): pointer
proc he_chip_group_get_active_filters*(
  self: GtkWidget, result_length1: pointer
): pointer

proc he_chip_group_set_active_filters*(
  self: GtkWidget, indices: pointer, indices_length1: cint
)

proc he_chip_group_clear_filters*(self: GtkWidget)
proc he_chip_group_remove_chip_at*(self: GtkWidget, position: cint)
proc he_content_block_image_get_type*(): GType
proc he_content_block_image_get_file*(self: GtkWidget): pointer
proc he_content_block_image_set_file*(self: GtkWidget, value: pointer)
proc he_content_block_image_get_requested_height*(self: GtkWidget): cint
proc he_content_block_image_set_requested_height*(self: GtkWidget, value: cint)
proc he_content_block_image_get_requested_width*(self: GtkWidget): cint
proc he_content_block_image_set_requested_width*(self: GtkWidget, value: cint)
proc he_content_block_image_new*(file: pointer): pointer
proc he_content_block_image_construct*(object_type_v: GType, file: pointer): pointer
proc he_content_block_image_cluster_get_type*(): GType
proc he_content_block_image_cluster_image_position_get_type*(): GType
proc he_content_block_image_cluster_image_position_get_column*(
  self: HeContentBlockImageClusterImagePosition
): cint

proc he_content_block_image_cluster_image_position_get_row*(
  self: HeContentBlockImageClusterImagePosition
): cint

proc he_content_block_image_cluster_get_title*(self: GtkWidget): pointer
proc he_content_block_image_cluster_set_title*(self: GtkWidget, value: pointer)
proc he_content_block_image_cluster_get_subtitle*(self: GtkWidget): pointer
proc he_content_block_image_cluster_set_subtitle*(self: GtkWidget, value: pointer)
proc he_content_block_image_cluster_get_icon*(self: GtkWidget): pointer
proc he_content_block_image_cluster_set_icon*(self: GtkWidget, value: pointer)
proc he_content_block_image_cluster_set_image*(
  self: GtkWidget, image: pointer, position: HeContentBlockImageClusterImagePosition
)

proc he_content_block_image_cluster_remove_image*(self: GtkWidget, image: pointer)
proc he_content_block_image_cluster_new*(
  title: pointer, subtitle: pointer, icon: pointer
): pointer

proc he_content_block_image_cluster_construct*(
  object_type_v: GType, title: pointer, subtitle: pointer, icon: pointer
): pointer

proc he_content_list_get_type*(): GType
proc he_content_list_get_title*(self: GtkWidget): pointer
proc he_content_list_set_title*(self: GtkWidget, value: pointer)
proc he_content_list_get_description*(self: GtkWidget): pointer
proc he_content_list_set_description*(self: GtkWidget, value: pointer)
proc he_content_list_add*(self: GtkWidget, child: pointer)
proc he_content_list_remove*(self: GtkWidget, child: pointer)
proc he_content_list_new*(): GtkWidget
proc he_content_list_construct*(object_type_v: GType): pointer
proc he_date_picker_get_type*(): GType
proc he_date_picker_get_format*(self: GtkWidget): pointer
proc he_date_picker_get_date*(self: GtkWidget): pointer
proc he_date_picker_set_date*(self: GtkWidget, value: pointer)
proc he_date_picker_new_with_format*(format: pointer): pointer
proc he_date_picker_construct_with_format*(
  object_type_v: GType, format: pointer
): pointer

proc he_date_picker_new*(): GtkWidget
proc he_date_picker_construct*(object_type_v: GType): pointer
proc he_dialog_get_type*(): GType
proc he_dialog_get_visible*(self: GtkWidget): cint
proc he_dialog_set_visible*(self: GtkWidget, value: cint)
proc he_dialog_get_title*(self: GtkWidget): pointer
proc he_dialog_set_title*(self: GtkWidget, value: pointer)
proc he_dialog_get_info*(self: GtkWidget): pointer
proc he_dialog_set_info*(self: GtkWidget, value: pointer)
proc he_dialog_get_icon*(self: GtkWidget): pointer
proc he_dialog_set_icon*(self: GtkWidget, value: pointer)
proc he_dialog_get_secondary_button*(self: GtkWidget): pointer
proc he_dialog_set_secondary_button*(self: GtkWidget, value: pointer)
proc he_dialog_get_primary_button*(self: GtkWidget): pointer
proc he_dialog_set_primary_button*(self: GtkWidget, value: pointer)
proc he_dialog_add*(self: GtkWidget, widget: pointer)
proc he_dialog_present*(self: GtkWidget)
proc he_dialog_hide_dialog*(self: GtkWidget)
proc he_dialog_new*(
  parent: pointer,
  title: pointer,
  info: pointer,
  icon: pointer,
  primary_button: pointer,
  secondary_button: pointer,
): pointer

proc he_dialog_construct*(
  object_type_v: GType,
  parent: pointer,
  title: pointer,
  info: pointer,
  icon: pointer,
  primary_button: pointer,
  secondary_button: pointer,
): pointer

proc he_divider_get_type*(): GType
proc he_divider_get_is_inset*(self: GtkWidget): cint
proc he_divider_set_is_inset*(self: GtkWidget, value: cint)
proc he_divider_get_is_side_inset*(self: GtkWidget): cint
proc he_divider_set_is_side_inset*(self: GtkWidget, value: cint)
proc he_divider_get_is_vertical*(self: GtkWidget): cint
proc he_divider_set_is_vertical*(self: GtkWidget, value: cint)
proc he_divider_new*(): GtkWidget
proc he_divider_construct*(object_type_v: GType): pointer
proc he_dropdown_get_type*(): GType
proc he_dropdown_get_active_id*(self: GtkWidget): pointer
proc he_dropdown_set_active_id*(self: GtkWidget, value: pointer)
proc he_dropdown_get_max_width_chars*(self: GtkWidget): cint
proc he_dropdown_set_max_width_chars*(self: GtkWidget, value: cint)
proc he_dropdown_get_ellipsize*(self: GtkWidget): PangoEllipsizeMode
proc he_dropdown_set_ellipsize*(self: GtkWidget, value: PangoEllipsizeMode)
proc he_dropdown_get_dropdown*(self: GtkWidget): pointer
proc he_dropdown_set_dropdown*(self: GtkWidget, value: pointer)
proc he_dropdown_new*(): GtkWidget
proc he_dropdown_construct*(object_type_v: GType): pointer
proc he_dropdown_append*(self: GtkWidget, text: pointer)
proc he_dropdown_get_active*(self: GtkWidget): pointer
proc he_dropdown_insert*(self: GtkWidget, position: cint, text: pointer)
proc he_dropdown_prepend*(self: GtkWidget, text: pointer)
proc he_dropdown_remove*(self: GtkWidget, position: cint)
proc he_dropdown_remove_all*(self: GtkWidget)
proc he_empty_page_get_type*(): GType
proc he_empty_page_get_title*(self: GtkWidget): pointer
proc he_empty_page_set_title*(self: GtkWidget, value: pointer)
proc he_empty_page_get_description*(self: GtkWidget): pointer
proc he_empty_page_set_description*(self: GtkWidget, value: pointer)
proc he_empty_page_get_icon*(self: GtkWidget): pointer
proc he_empty_page_set_icon*(self: GtkWidget, value: pointer)
proc he_empty_page_set_resource*(self: GtkWidget, value: pointer)
proc he_empty_page_get_button*(self: GtkWidget): pointer
proc he_empty_page_set_button*(self: GtkWidget, value: pointer)
proc he_empty_page_new*(): GtkWidget
proc he_empty_page_construct*(object_type_v: GType): pointer
proc he_grouped_button_size_get_type*(): GType
proc he_grouped_button_get_type*(): GType
proc he_grouped_button_get_size*(self: GtkWidget): HeGroupedButtonSize
proc he_grouped_button_set_size*(self: GtkWidget, value: HeGroupedButtonSize)
proc he_grouped_button_get_size_name*(self: GtkWidget): pointer
proc he_grouped_button_set_size_name*(self: GtkWidget, value: pointer)
proc he_grouped_button_get_button_count*(self: GtkWidget): cint
proc he_grouped_button_get_homogeneous*(self: GtkWidget): cint
proc he_grouped_button_set_homogeneous*(self: GtkWidget, value: cint)
proc he_grouped_button_new*(): GtkWidget
proc he_grouped_button_construct*(object_type_v: GType): pointer
proc he_grouped_button_new_with_size*(size: HeGroupedButtonSize): pointer
proc he_grouped_button_construct_with_size*(
  object_type_v: GType, size: HeGroupedButtonSize
): pointer

proc he_grouped_button_new_with_names*(size_name: pointer): pointer
proc he_grouped_button_construct_with_names*(
  object_type_v: GType, size_name: pointer
): pointer

proc he_grouped_button_add_widget*(self: GtkWidget, widget: pointer)
proc he_grouped_button_remove_widget*(self: GtkWidget, widget: pointer)
proc he_grouped_button_clear_widgets*(self: GtkWidget)
proc he_grouped_button_get_widget_at_index*(self: GtkWidget, index: cint): pointer
proc he_modifier_badge_get_type*(): GType
proc he_modifier_badge_alignment_get_type*(): GType
proc he_modifier_badge_alignment_to_gtk_align*(self: HeModifierBadgeAlignment): GtkAlign
proc he_modifier_badge_alignment_from_gtk_align*(
  align: GtkAlign
): HeModifierBadgeAlignment

proc he_modifier_badge_get_color*(self: GtkWidget): HeColors
proc he_modifier_badge_set_color*(self: GtkWidget, value: HeColors)
proc he_modifier_badge_get_tinted*(self: GtkWidget): cint
proc he_modifier_badge_set_tinted*(self: GtkWidget, value: cint)
proc he_modifier_badge_get_label*(self: GtkWidget): pointer
proc he_modifier_badge_set_label*(self: GtkWidget, value: pointer)
proc he_modifier_badge_new*(label: pointer): pointer
proc he_modifier_badge_construct*(object_type_v: GType, label: pointer): pointer
proc he_modifier_badge_get_alignment*(self: GtkWidget): HeModifierBadgeAlignment
proc he_modifier_badge_set_alignment*(self: GtkWidget, value: HeModifierBadgeAlignment)
proc he_navigation_rail_get_type*(): GType
proc he_navigation_rail_get_stack*(self: GtkWidget): pointer
proc he_navigation_rail_set_stack*(self: GtkWidget, value: pointer)
proc he_navigation_rail_get_orientation*(self: GtkWidget): GtkOrientation
proc he_navigation_rail_set_orientation*(self: GtkWidget, value: GtkOrientation)
proc he_navigation_rail_get_hide_labels*(self: GtkWidget): cint
proc he_navigation_rail_set_hide_labels*(self: GtkWidget, value: cint)
proc he_navigation_rail_get_is_expanded*(self: GtkWidget): cint
proc he_navigation_rail_set_is_expanded*(self: GtkWidget, value: cint)
proc he_navigation_rail_get_custom_button*(self: GtkWidget): pointer
proc he_navigation_rail_set_custom_button*(self: GtkWidget, value: pointer)
proc he_navigation_rail_get_custom_widget*(self: GtkWidget): pointer
proc he_navigation_rail_set_custom_widget*(self: GtkWidget, value: pointer)
proc he_navigation_rail_new*(): GtkWidget
proc he_navigation_rail_construct*(object_type_v: GType): pointer
proc he_navigation_section_get_type*(): GType
proc he_navigation_section_get_stack*(self: GtkWidget): pointer
proc he_navigation_section_set_stack*(self: GtkWidget, value: pointer)
proc he_navigation_section_get_orientation*(self: GtkWidget): GtkOrientation
proc he_navigation_section_set_orientation*(self: GtkWidget, value: GtkOrientation)
proc he_navigation_section_new*(): GtkWidget
proc he_navigation_section_construct*(object_type_v: GType): pointer
proc he_overlay_button_size_get_type*(): GType
proc he_overlay_button_size_to_css_class*(self: HeOverlayButtonSize): pointer
proc he_overlay_button_type_button_get_type*(): GType
proc he_overlay_button_type_button_to_css_class*(
  self: HeOverlayButtonTypeButton
): pointer

proc he_overlay_button_alignment_get_type*(): GType
proc he_overlay_button_alignment_to_gtk_align*(self: HeOverlayButtonAlignment): GtkAlign
proc he_overlay_button_alignment_from_gtk_align*(
  align: GtkAlign
): HeOverlayButtonAlignment

proc he_overlay_button_get_size*(self: GtkWidget): HeOverlayButtonSize
proc he_overlay_button_set_size*(self: GtkWidget, value: HeOverlayButtonSize)
proc he_overlay_button_get_typeb*(self: GtkWidget): HeOverlayButtonTypeButton
proc he_overlay_button_set_typeb*(self: GtkWidget, value: HeOverlayButtonTypeButton)
proc he_overlay_button_get_typeb2*(self: GtkWidget): HeOverlayButtonTypeButton
proc he_overlay_button_set_typeb2*(self: GtkWidget, value: HeOverlayButtonTypeButton)
proc he_overlay_button_get_color*(self: GtkWidget): HeColors
proc he_overlay_button_set_color*(self: GtkWidget, value: HeColors)
proc he_overlay_button_get_secondary_color*(self: GtkWidget): HeColors
proc he_overlay_button_set_secondary_color*(self: GtkWidget, value: HeColors)
proc he_overlay_button_get_secondary_icon*(self: GtkWidget): pointer
proc he_overlay_button_set_secondary_icon*(self: GtkWidget, value: pointer)
proc he_overlay_button_get_icon*(self: GtkWidget): pointer
proc he_overlay_button_set_icon*(self: GtkWidget, value: pointer)
proc he_overlay_button_get_label*(self: GtkWidget): pointer
proc he_overlay_button_set_label*(self: GtkWidget, value: pointer)
proc he_overlay_button_get_primary_tooltip*(self: GtkWidget): pointer
proc he_overlay_button_set_primary_tooltip*(self: GtkWidget, value: pointer)
proc he_overlay_button_get_secondary_tooltip*(self: GtkWidget): pointer
proc he_overlay_button_set_secondary_tooltip*(self: GtkWidget, value: pointer)
proc he_overlay_button_get_child*(self: GtkWidget): pointer
proc he_overlay_button_set_child*(self: GtkWidget, value: pointer)
proc he_overlay_button_get_alignment*(self: GtkWidget): HeOverlayButtonAlignment
proc he_overlay_button_set_alignment*(self: GtkWidget, value: HeOverlayButtonAlignment)
proc he_overlay_button_new*(
  icon: pointer, label: pointer, secondary_icon: pointer
): pointer

proc he_overlay_button_construct*(
  object_type_v: GType, icon: pointer, label: pointer, secondary_icon: pointer
): pointer

proc he_progress_bar_get_type*(): GType
proc he_progress_bar_get_wave_amplitude*(self: GtkWidget): cint
proc he_progress_bar_set_wave_amplitude*(self: GtkWidget, value: cint)
proc he_progress_bar_get_wave_wavelength*(self: GtkWidget): cint
proc he_progress_bar_set_wave_wavelength*(self: GtkWidget, value: cint)
proc he_progress_bar_get_wave_thickness*(self: GtkWidget): cint
proc he_progress_bar_set_wave_thickness*(self: GtkWidget, value: cint)
proc he_progress_bar_get_animate*(self: GtkWidget): cint
proc he_progress_bar_set_animate*(self: GtkWidget, value: cint)
proc he_progress_bar_get_progress*(self: GtkWidget): cdouble
proc he_progress_bar_set_progress*(self: GtkWidget, value: cdouble)
proc he_progress_bar_get_stop_indicator_visibility*(self: GtkWidget): cint
proc he_progress_bar_set_stop_indicator_visibility*(self: GtkWidget, value: cint)
proc he_progress_bar_get_is_osd*(self: GtkWidget): cint
proc he_progress_bar_set_is_osd*(self: GtkWidget, value: cint)
proc he_progress_bar_get_is_wavy*(self: GtkWidget): cint
proc he_progress_bar_set_is_wavy*(self: GtkWidget, value: cint)
proc he_progress_bar_new*(): GtkWidget
proc he_progress_bar_construct*(object_type_v: GType): pointer
proc he_segmented_button_get_type*(): GType
proc he_segmented_button_add_child*(
  self: GtkWidget, builder: pointer, child: pointer, type_v: pointer
)

proc he_segmented_button_new*(): GtkWidget
proc he_segmented_button_construct*(object_type_v: GType): pointer
proc he_settings_list_get_type*(): GType
proc he_settings_list_get_title*(self: GtkWidget): pointer
proc he_settings_list_set_title*(self: GtkWidget, value: pointer)
proc he_settings_list_get_description*(self: GtkWidget): pointer
proc he_settings_list_set_description*(self: GtkWidget, value: pointer)
proc he_settings_list_add*(self: GtkWidget, child: pointer)
proc he_settings_list_remove*(self: GtkWidget, child: pointer)
proc he_settings_list_new*(): GtkWidget
proc he_settings_list_construct*(object_type_v: GType): pointer
proc he_settings_page_get_type*(): GType
proc he_settings_page_get_title*(self: GtkWidget): pointer
proc he_settings_page_set_title*(self: GtkWidget, value: pointer)
proc he_settings_page_add_list*(self: GtkWidget, list: pointer)
proc he_settings_page_new*(title: pointer): pointer
proc he_settings_page_construct*(object_type_v: GType, title: pointer): pointer
proc he_settings_row_get_type*(): GType
proc he_settings_row_get_title*(self: GtkWidget): pointer
proc he_settings_row_set_title*(self: GtkWidget, value: pointer)
proc he_settings_row_get_subtitle*(self: GtkWidget): pointer
proc he_settings_row_set_subtitle*(self: GtkWidget, value: pointer)
proc he_settings_row_get_icon*(self: GtkWidget): pointer
proc he_settings_row_set_icon*(self: GtkWidget, value: pointer)
proc he_settings_row_set_gicon*(self: GtkWidget, value: pointer)
proc he_settings_row_set_paintable*(self: GtkWidget, value: pointer)
proc he_settings_row_get_primary_button*(self: GtkWidget): pointer
proc he_settings_row_set_primary_button*(self: GtkWidget, value: pointer)
proc he_settings_row_get_activatable_widget*(self: GtkWidget): pointer
proc he_settings_row_set_activatable_widget*(self: GtkWidget, value: pointer)
proc he_settings_row_add*(self: GtkWidget, child: pointer)
proc he_settings_row_new_with_details*(
  title: pointer, subtitle: pointer, primary_button: pointer
): pointer

proc he_settings_row_construct_with_details*(
  object_type_v: GType, title: pointer, subtitle: pointer, primary_button: pointer
): pointer

proc he_settings_row_new*(): GtkWidget
proc he_settings_row_construct*(object_type_v: GType): pointer
proc he_settings_window_get_type*(): GType
proc he_settings_window_add_page*(self: GtkWidget, page: pointer)
proc he_settings_window_add_list*(self: GtkWidget, list: pointer)
proc he_settings_window_new*(parent: pointer): pointer
proc he_settings_window_construct*(object_type_v: GType, parent: pointer): pointer
proc he_side_bar_get_type*(): GType
proc he_side_bar_get_title*(self: GtkWidget): pointer
proc he_side_bar_set_title*(self: GtkWidget, value: pointer)
proc he_side_bar_get_titlewidget*(self: GtkWidget): pointer
proc he_side_bar_set_titlewidget*(self: GtkWidget, value: pointer)
proc he_side_bar_get_subtitle*(self: GtkWidget): pointer
proc he_side_bar_set_subtitle*(self: GtkWidget, value: pointer)
proc he_side_bar_get_show_right_title_buttons*(self: GtkWidget): cint
proc he_side_bar_set_show_right_title_buttons*(self: GtkWidget, value: cint)
proc he_side_bar_get_show_left_title_buttons*(self: GtkWidget): cint
proc he_side_bar_set_show_left_title_buttons*(self: GtkWidget, value: cint)
proc he_side_bar_get_show_back*(self: GtkWidget): cint
proc he_side_bar_set_show_back*(self: GtkWidget, value: cint)
proc he_side_bar_get_stack*(self: GtkWidget): pointer
proc he_side_bar_set_stack*(self: GtkWidget, value: pointer)
proc he_side_bar_get_scroller*(self: GtkWidget): pointer
proc he_side_bar_set_scroller*(self: GtkWidget, value: pointer)
proc he_side_bar_get_has_margins*(self: GtkWidget): cint
proc he_side_bar_set_has_margins*(self: GtkWidget, value: cint)
proc he_side_bar_new*(title: pointer, subtitle: pointer): pointer
proc he_side_bar_construct*(
  object_type_v: GType, title: pointer, subtitle: pointer
): pointer

proc he_slider_get_type*(): GType
proc he_slider_get_wave_amplitude*(self: GtkWidget): cint
proc he_slider_set_wave_amplitude*(self: GtkWidget, value: cint)
proc he_slider_get_wave_wavelength*(self: GtkWidget): cint
proc he_slider_set_wave_wavelength*(self: GtkWidget, value: cint)
proc he_slider_get_wave_thickness*(self: GtkWidget): cint
proc he_slider_set_wave_thickness*(self: GtkWidget, value: cint)
proc he_slider_get_animate*(self: GtkWidget): cint
proc he_slider_set_animate*(self: GtkWidget, value: cint)
proc he_slider_get_value*(self: GtkWidget): cdouble
proc he_slider_set_value*(self: GtkWidget, value: cdouble)
proc he_slider_get_left_icon*(self: GtkWidget): pointer
proc he_slider_set_left_icon*(self: GtkWidget, value: pointer)
proc he_slider_get_right_icon*(self: GtkWidget): pointer
proc he_slider_set_right_icon*(self: GtkWidget, value: pointer)
proc he_slider_get_stop_indicator_visibility*(self: GtkWidget): cint
proc he_slider_set_stop_indicator_visibility*(self: GtkWidget, value: cint)
proc he_slider_get_is_wavy*(self: GtkWidget): cint
proc he_slider_set_is_wavy*(self: GtkWidget, value: cint)
proc he_slider_new*(): GtkWidget
proc he_slider_construct*(object_type_v: GType): pointer
proc he_slider_add_mark*(self: GtkWidget, value: cdouble, text: pointer)
proc he_slider_set_range*(self: GtkWidget, min: cdouble, max: cdouble)
proc he_slider_set_adjustment*(self: GtkWidget, adjustment: pointer)
proc he_switch_get_type*(): GType
proc he_switch_get_left_icon*(self: GtkWidget): pointer
proc he_switch_set_left_icon*(self: GtkWidget, value: pointer)
proc he_switch_get_right_icon*(self: GtkWidget): pointer
proc he_switch_set_right_icon*(self: GtkWidget, value: pointer)
proc he_switch_new*(): GtkWidget
proc he_switch_construct*(object_type_v: GType): pointer
proc he_switch_bar_get_type*(): GType
proc he_switch_bar_get_title*(self: GtkWidget): pointer
proc he_switch_bar_set_title*(self: GtkWidget, value: pointer)
proc he_switch_bar_get_subtitle*(self: GtkWidget): pointer
proc he_switch_bar_set_subtitle*(self: GtkWidget, value: pointer)
proc he_switch_bar_get_sensitive_widget*(self: GtkWidget): pointer
proc he_switch_bar_set_sensitive_widget*(self: GtkWidget, value: pointer)
proc he_switch_bar_new*(): GtkWidget
proc he_switch_bar_construct*(object_type_v: GType): pointer
proc he_tab_get_type*(): GType
proc he_tab_page_get_type*(): GType
proc he_tab_get_label*(self: GtkWidget): pointer
proc he_tab_set_label*(self: GtkWidget, value: pointer)
proc he_tab_set_tooltip*(self: GtkWidget, value: pointer)
proc he_tab_get_pinned*(self: GtkWidget): cint
proc he_tab_set_pinned*(self: GtkWidget, value: cint)
proc he_tab_get_can_pin*(self: GtkWidget): cint
proc he_tab_set_can_pin*(self: GtkWidget, value: cint)
proc he_tab_get_can_close*(self: GtkWidget): cint
proc he_tab_set_can_close*(self: GtkWidget, value: cint)
proc he_tab_get_page*(self: GtkWidget): pointer
proc he_tab_set_page*(self: GtkWidget, value: pointer)
proc he_tab_get_menu*(self: GtkWidget): pointer
proc he_tab_get_actions*(self: GtkWidget): pointer
proc he_tab_new*(label: pointer, page: pointer): pointer
proc he_tab_construct*(object_type_v: GType, label: pointer, page: pointer): pointer
proc he_tab_page_get_tab*(self: GtkWidget): pointer
proc he_tab_page_set_tab*(self: GtkWidget, value: pointer)
proc he_tab_page_new*(tab: pointer): pointer
proc he_tab_page_construct*(object_type_v: GType, tab: pointer): pointer
proc he_tab_switcher_get_type*(): GType
proc he_tab_switcher_tab_bar_behavior_get_type*(): GType
proc he_tab_switcher_get_n_tabs*(self: GtkWidget): cint
proc he_tab_switcher_get_tabs*(self: GtkWidget): pointer
proc he_tab_switcher_get_tab_bar_behavior*(self: GtkWidget): HeTabSwitcherTabBarBehavior
proc he_tab_switcher_set_tab_bar_behavior*(
  self: GtkWidget, value: HeTabSwitcherTabBarBehavior
)

proc he_tab_switcher_get_tab_position*(self: GtkWidget, tab: pointer): cint
proc he_tab_switcher_get_allow_duplicate_tabs*(self: GtkWidget): cint
proc he_tab_switcher_set_allow_duplicate_tabs*(self: GtkWidget, value: cint)
proc he_tab_switcher_get_allow_drag*(self: GtkWidget): cint
proc he_tab_switcher_set_allow_drag*(self: GtkWidget, value: cint)
proc he_tab_switcher_get_allow_pinning*(self: GtkWidget): cint
proc he_tab_switcher_set_allow_pinning*(self: GtkWidget, value: cint)
proc he_tab_switcher_get_allow_closing*(self: GtkWidget): cint
proc he_tab_switcher_set_allow_closing*(self: GtkWidget, value: cint)
proc he_tab_switcher_get_allow_new_window*(self: GtkWidget): cint
proc he_tab_switcher_set_allow_new_window*(self: GtkWidget, value: cint)
proc he_tab_switcher_get_current*(self: GtkWidget): pointer
proc he_tab_switcher_set_current*(self: GtkWidget, value: pointer)
proc he_tab_switcher_insert_tab*(self: GtkWidget, tab: pointer, index: cint): cint
proc he_tab_switcher_remove_tab*(self: GtkWidget, tab: pointer)
proc he_tab_switcher_get_menu*(self: GtkWidget): pointer
proc he_tab_switcher_get_actions*(self: GtkWidget): pointer
proc he_tab_switcher_new*(): GtkWidget
proc he_tab_switcher_construct*(object_type_v: GType): pointer
proc he_text_field_get_type*(): GType
proc he_text_field_get_is_valid*(self: GtkWidget): cint
proc he_text_field_set_is_valid*(self: GtkWidget, value: cint)
proc he_text_field_get_needs_validation*(self: GtkWidget): cint
proc he_text_field_set_needs_validation*(self: GtkWidget, value: cint)
proc he_text_field_get_min_length*(self: GtkWidget): cint
proc he_text_field_set_min_length*(self: GtkWidget, value: cint)
proc he_text_field_get_regex*(self: GtkWidget): pointer
proc he_text_field_set_regex*(self: GtkWidget, value: pointer)
proc he_text_field_get_is_search*(self: GtkWidget): cint
proc he_text_field_set_is_search*(self: GtkWidget, value: cint)
proc he_text_field_get_is_outline*(self: GtkWidget): cint
proc he_text_field_set_is_outline*(self: GtkWidget, value: cint)
proc he_text_field_get_entry*(self: GtkWidget): pointer
proc he_text_field_get_internal_entry*(self: GtkWidget): pointer
proc he_text_field_get_text*(self: GtkWidget): pointer
proc he_text_field_set_text*(self: GtkWidget, value: pointer)
proc he_text_field_get_suffix_icon*(self: GtkWidget): pointer
proc he_text_field_set_suffix_icon*(self: GtkWidget, value: pointer)
proc he_text_field_get_prefix_icon*(self: GtkWidget): pointer
proc he_text_field_set_prefix_icon*(self: GtkWidget, value: pointer)
proc he_text_field_get_support_text*(self: GtkWidget): pointer
proc he_text_field_set_support_text*(self: GtkWidget, value: pointer)
proc he_text_field_get_placeholder_text*(self: GtkWidget): pointer
proc he_text_field_set_placeholder_text*(self: GtkWidget, value: pointer)
proc he_text_field_get_max_length*(self: GtkWidget): cint
proc he_text_field_set_max_length*(self: GtkWidget, value: cint)
proc he_text_field_get_visibility*(self: GtkWidget): cint
proc he_text_field_set_visibility*(self: GtkWidget, value: cint)
proc he_text_field_new_from_regex*(regex_arg: pointer): pointer
proc he_text_field_construct_from_regex*(
  object_type_v: GType, regex_arg: pointer
): pointer

proc he_text_field_new*(): GtkWidget
proc he_text_field_construct*(object_type_v: GType): pointer
proc he_time_picker_get_type*(): GType
proc he_time_picker_get_format_12*(self: GtkWidget): pointer
proc he_time_picker_get_format_24*(self: GtkWidget): pointer
proc he_time_picker_get_time*(self: GtkWidget): pointer
proc he_time_picker_set_time*(self: GtkWidget, value: pointer)
proc he_time_picker_new_with_format*(format_12: pointer, format_24: pointer): pointer
proc he_time_picker_construct_with_format*(
  object_type_v: GType, format_12: pointer, format_24: pointer
): pointer

proc he_time_picker_new*(): GtkWidget
proc he_time_picker_construct*(object_type_v: GType): pointer
proc he_tip_view_get_type*(): GType
proc he_tip_view_get_tip_style*(self: GtkWidget): HeTipViewStyle
proc he_tip_view_set_tip_style*(self: GtkWidget, value: HeTipViewStyle)
proc he_tip_view_get_tip*(self: GtkWidget): pointer
proc he_tip_view_set_tip*(self: GtkWidget, value: pointer)
proc he_tip_view_new*(tip: pointer, tip_style: pointer): pointer
proc he_tip_view_construct*(
  object_type_v: GType, tip: pointer, tip_style: pointer
): pointer

proc he_toast_get_type*(): GType
proc he_toast_get_label*(self: GtkWidget): pointer
proc he_toast_set_label*(self: GtkWidget, value: pointer)
proc he_toast_get_default_action*(self: GtkWidget): pointer
proc he_toast_set_default_action*(self: GtkWidget, value: pointer)
proc he_toast_new*(label: pointer): pointer
proc he_toast_construct*(object_type_v: GType, label: pointer): pointer
proc he_toast_send_notification*(self: GtkWidget)
proc he_view_aux_get_type*(): GType
proc he_view_aux_get_show_aux*(self: GtkWidget): cint
proc he_view_aux_set_show_aux*(self: GtkWidget, value: cint)
proc he_view_aux_new*(): GtkWidget
proc he_view_aux_construct*(object_type_v: GType): pointer
proc he_view_chooser_get_type*(): GType
proc he_view_chooser_get_stack*(self: GtkWidget): pointer
proc he_view_chooser_set_stack*(self: GtkWidget, value: pointer)
proc he_view_chooser_new*(): GtkWidget
proc he_view_chooser_construct*(object_type_v: GType): pointer
proc he_view_chooser_stack_clear*(self: GtkWidget)
proc he_view_dual_get_type*(): GType
proc he_view_dual_get_orientation*(self: GtkWidget): GtkOrientation
proc he_view_dual_set_orientation*(self: GtkWidget, value: GtkOrientation)
proc he_view_dual_get_show_handle*(self: GtkWidget): cint
proc he_view_dual_set_show_handle*(self: GtkWidget, value: cint)
proc he_view_dual_get_child_start*(self: GtkWidget): pointer
proc he_view_dual_set_child_start*(self: GtkWidget, value: pointer)
proc he_view_dual_get_child_end*(self: GtkWidget): pointer
proc he_view_dual_set_child_end*(self: GtkWidget, value: pointer)
proc he_view_dual_new*(orientation: GtkOrientation, show_handle: cint): pointer
proc he_view_dual_construct*(
  object_type_v: GType, orientation: GtkOrientation, show_handle: cint
): pointer

proc he_view_mono_new*(title: GtkWidget, subtitle: string): GtkWidget
proc he_view_mono_add_titlebar_button*(viewmono: GtkWidget, child: GtkWidget)
proc he_view_mono_add_titlebar_menu*(viewmono: GtkWidget, child: GtkWidget)
proc he_view_mono_add_titlebar_toggle*(viewmono: GtkWidget, child: GtkWidget)
proc he_view_mono_append*(viewmono: GtkWidget, child: GtkWidget)
proc he_view_mono_get_title*(viewmono: GtkWidget): GtkWidget
proc he_view_mono_set_title*(viewmono: GtkWidget, value: GtkWidget)
proc he_view_mono_get_titlewidget*(viewmono: GtkWidget): GtkWidget
proc he_view_mono_set_titlewidget*(viewmono: GtkWidget, value: GtkWidget)
proc he_view_mono_get_subtitle*(viewmono: GtkWidget): cstring
proc he_view_mono_set_subtitle*(viewmono: GtkWidget, value: cstring)
proc he_view_mono_get_show_right_title_buttons*(viewmono: GtkWidget): cbool
proc he_view_mono_set_show_right_title_buttons*(viewmono: GtkWidget, value: cbool)
proc he_view_mono_get_show_left_title_buttons*(viewmono: GtkWidget): cbool
proc he_view_mono_set_show_left_title_buttons*(viewmono: GtkWidget, value: cbool)
proc he_view_mono_get_show_back*(viewmono: GtkWidget): cbool
proc he_view_mono_set_show_back*(viewmono: GtkWidget, value: cbool)
proc he_view_mono_get_stack*(viewmono: GtkWidget): GtkWidget
proc he_view_mono_set_stack*(viewmono: GtkWidget, value: GtkWidget)
proc he_view_mono_get_scroller*(viewmono: GtkWidget): GtkWidget
proc he_view_mono_set_scroller*(viewmono: GtkWidget, value: GtkWidget)
proc he_view_mono_get_has_margins*(viewmono: GtkWidget): cbool
proc he_view_mono_set_has_margins*(viewmono: GtkWidget, value: cbool)

proc he_view_sub_title_get_type*(): GType
proc he_view_sub_title_get_label*(self: GtkWidget): pointer
proc he_view_sub_title_set_label*(self: GtkWidget, value: pointer)
proc he_view_sub_title_new*(): GtkWidget
proc he_view_sub_title_construct*(object_type_v: GType): pointer
proc he_view_switcher_get_type*(): GType
proc he_view_switcher_get_stack*(self: GtkWidget): pointer
proc he_view_switcher_set_stack*(self: GtkWidget, value: pointer)
proc he_view_switcher_new*(): GtkWidget
proc he_view_switcher_construct*(object_type_v: GType): pointer
proc he_view_title_get_type*(): GType
proc he_view_title_get_label*(self: GtkWidget): pointer
proc he_view_title_set_label*(self: GtkWidget, value: cstring)
proc he_view_title_new*(): GtkWidget
proc he_view_title_construct*(object_type_v: GType): pointer
proc he_welcome_screen_get_type*(): GType
proc he_welcome_screen_get_appname*(self: GtkWidget): pointer
proc he_welcome_screen_set_appname*(self: GtkWidget, value: pointer)
proc he_welcome_screen_get_description*(self: GtkWidget): pointer
proc he_welcome_screen_set_description*(self: GtkWidget, value: pointer)
proc he_welcome_screen_add_child*(
  self: GtkWidget, builder: pointer, child: pointer, type_v: pointer
)

proc he_welcome_screen_new*(appname: pointer, description: pointer): pointer
proc he_welcome_screen_construct*(
  object_type_v: GType, appname: pointer, description: pointer
): pointer

proc he_init*()
