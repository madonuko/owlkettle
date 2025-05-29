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
  HeRGBColor* = object
    r*: cdouble
    g*: cdouble
    b*: cdouble
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
    HeColorsDark

{.push importc, cdecl.}
# He
proc he_init*()

# He.Application
proc he_application_new*(application_id: cstring, flags: GApplicationFlags): GApplication
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

# He.StyleManager
proc he_style_manager_new*(): StyleManager
proc he_style_manager_update*(manager: StyleManager)
proc he_style_manager_register*(manager: StyleManager)
proc he_style_manager_unregister*(manager: StyleManager)
proc he_style_manager_get_user_base*(manager: StyleManager): GtkCssProvider
proc he_style_manager_get_user_dark*(manager: StyleManager): GtkCssProvider
proc he_style_manager_style_refresh*(manager: StyleManager, scheme_factory: DynamicScheme): cstring
proc he_style_manager_weight_refresh*(manager: StyleManager, font_weight: cdouble): cstring
proc he_style_manager_get_is_registered*(manager: StyleManager): cbool

# He.Window
proc he_window_new*(): GtkWidget
proc he_window_get_parent*(window: GtkWidget): GtkWidget
proc he_window_set_parent*(window: GtkWidget, value: GtkWidget)
proc he_window_get_has_title*(window: GtkWidget): cbool
proc he_window_set_has_title*(window: GtkWidget, value: cbool)
proc he_window_get_has_back_button*(window: GtkWidget): cbool
proc he_window_set_has_back_button*(window: GtkWidget, value: cbool)

# He.ApplicationWindow
proc he_application_window_new*(): GtkWidget
proc he_application_window_get_has_title*(appwindow: GtkWidget): cbool
proc he_application_window_set_has_title*(appwindow: GtkWidget, value: cbool)
proc he_application_window_get_has_back_button*(): cbool
proc he_application_window_set_has_back_button*(appwindow: GtkWidget, value: cbool)

# He.Button
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

# He.ViewMono
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
