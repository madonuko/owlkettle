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

# Create libadwaita apps using owlkettle

when defined(nimPreviewSlimSystem):
  import std/assertions
import widgetdef, widgets, mainloop, widgetutils, common
import ./bindings/[he, gtk]
import std/[strutils, sequtils, strformat, options, sugar, tables]

export he.StyleManager
export he.HeVersion

when defined(owlkettleDocs) and isMainModule:
  echo "# Libhelium Widgets\n\n"
  echo "Some widgets are only available when linking against later libhelium versions."
  echo "Set the target libhelium version by passing `-d:heminor=<Minor Version>`."
  echo "\n\n"

renderable HeWindow of Window:
  hasTitle: bool
  hasBackButton: bool
  
  hooks:
    beforeBuild:
      state.internalWidget = he_window_new()

  hooks hasTitle:
    property:
      state.internalWidget.he_window_set_has_title state.hasTitle.cbool

  hooks hasBackButton:
    property:
      state.internalWidget.he_window_set_has_back_button state.hasBackButton.cbool

  example:
    HeWindow:
      Box:
        orient = OrientX
        
        Box {.expand: false.}:
          sizeRequest = (250, -1)
          orient = OrientY
          
          HeaderBar {.expand: false.}:
            showTitleButtons = false
          
          Label(text = "Sidebar")
        
        Separator() {.expand: false.}
        
        Box:
          orient = OrientY
          
          HeaderBar() {.expand: false.}
          Label(text = "Main Content")

renderable HeApplicationWindow of Window:
  hasTitle: bool
  hasBackButton: bool

  hooks:
    beforeBuild:
      state.internalWidget = he_application_window_new()
  
  hooks hasTitle:
    property:
      state.internalWidget.he_application_window_set_has_title state.hasTitle.cbool

  hooks hasBackButton:
    property:
      state.internalWidget.he_application_window_set_has_back_button state.hasBackButton.cbool

  example:
    HeApplicationWindow:
      Box:
        orient = OrientX
        
        Box {.expand: false.}:
          sizeRequest = (250, -1)
          orient = OrientY
          
          HeaderBar {.expand: false.}:
            showTitleButtons = false
          
          Label(text = "Sidebar")
        
        Separator() {.expand: false.}
        
        Box:
          orient = OrientY
          
          HeaderBar() {.expand: false.}
          Label(text = "Main Content")


renderable HeButton of Button:
  text: string
  icon: string
  color: HeButtonColor
  is_pill: bool
  is_fill: bool
  is_tint: bool
  is_iconic: bool
  is_outline: bool
  is_textual: bool
  is_disclosure: bool

  proc toggled(active: bool)

  hooks:
    beforeBuild:
      state.internalWidget = he_button_new(state.icon.cstring, state.text.cstring)
    connectEvents:
      state.connect(state.toggled, "toggled", eventCallback)
    disconnectEvents:
      state.internalWidget.disconnect(state.toggled)

  hooks text:
    property:
      state.internalWidget.he_button_set_text state.text.cstring

  hooks icon:
    property:
      state.internalWidget.he_button_set_icon state.icon.cstring

  hooks color:
    property:
      state.internalWidget.he_button_set_color state.color

  hooks is_pill:
    property:
      state.internalWidget.he_button_set_is_pill state.is_pill.cbool

  hooks is_fill:
    property:
      state.internalWidget.he_button_set_is_fill state.is_fill.cbool

  hooks is_tint:
    property:
      state.internalWidget.he_button_set_is_tint state.is_tint.cbool

  hooks is_iconic:
    property:
      state.internalWidget.he_button_set_is_iconic state.is_iconic.cbool

  hooks is_outline:
    property:
      state.internalWidget.he_button_set_is_outline state.is_outline.cbool

  hooks is_textual:
    property:
      state.internalWidget.he_button_set_is_textual state.is_textual.cbool

  hooks is_disclosure:
    property:
      state.internalWidget.he_button_set_is_disclosure state.is_disclosure.cbool

renderable HeViewTitle of BaseWidget:
  label: string

  hooks:
    beforeBuild:
      state.internalWidget = he_view_title_new()

  hooks label:
    property:
      state.internalWidget.he_view_title_set_label state.label.string

let
  gTypeGtkLabel = g_type_from_name("GtkLabel")
  gTypeHeViewMono = g_type_from_name("HeViewMono")

renderable HeViewMono of BaseWidget:
  title: Widget
  titlewidget: Widget
  subtitle: string
  showRightTitleButtons: bool
  showLeftTitleButtons: bool
  showBack: bool
  stack: Widget
  scroller: Widget
  hasMargins: bool
  child: Widget

  hooks:
    beforeBuild:
      state.internalWidget = he_view_mono_new(nil.GtkWidget, state.subtitle)

  hooks title:
    (build, update):
      state.updateChild(state.title, widget.valTitle, he_view_mono_set_title)

  hooks titlewidget:
    (build, update):
      state.updateChild(state.titlewidget, widget.valTitlewidget, he_view_mono_set_titlewidget)

  adder title:
    if widget.hasTitle or widget.hasTitlewidget:
      raise newException(ValueError, "Unable to add multiple titles to a HeViewMono.")
    let
      c = child.build().unwrapInternalWidget()
      isLabel = bool c.g_type_check_instance_is_a gTypeGtkLabel
      isViewMono = bool c.g_type_check_instance_is_a gTypeHeViewMono
    if isLabel or isViewMono:
      widget.hasTitle = true
      widget.valTitle = child
    else:
      widget.hasTitlewidget = true
      widget.valTitlewidget = child

  hooks subtitle:
    property:
      state.internalWidget.he_view_mono_set_subtitle state.subtitle.cstring

  hooks showRightTitleButtons:
    property:
      state.internalWidget.he_view_mono_set_show_right_title_buttons state.showRightTitleButtons.cbool

  hooks showLeftTitleButtons:
    property:
      state.internalWidget.he_view_mono_set_show_left_title_buttons state.showLeftTitleButtons.cbool

  hooks showBack:
    property:
      state.internalWidget.he_view_mono_set_show_back state.showBack.cbool

  hooks stack:
    (build, update):
      state.updateChild(state.stack, widget.valStack, he_view_mono_set_stack)

  adder stack:
    if widget.hasStack:
      raise newException(ValueError, "Unable to add multiple stack to a HeViewMono.")
    widget.hasStack = true
    widget.valStack = child

  hooks scroller:
    (build, update):
      state.updateChild(state.scroller, widget.valScroller, he_view_mono_set_scroller)

  adder scroller:
    if widget.hasScroller:
      raise newException(ValueError, "Unable to add multiple scroller to a HeViewMono.")
    widget.hasScroller = true
    widget.valScroller = child

  hooks hasMargins:
    property:
      state.internalWidget.he_view_mono_set_has_margins state.hasMargins.cbool

  hooks child:
    (build, update):
      # HACK: need to check there are no other children
      # FIXME: can we allow multiple children anyway?
      if state.internalWidget.gtk_widget_get_last_child.gtk_widget_get_last_child.gtk_widget_get_first_child.isNil:
        he_view_mono_append(state.internalWidget, widget.valChild.build().unwrapInternalWidget())

  adder add:
    if widget.hasChild:
      raise newException(ValueError, "Unable to add multiple children to a HeViewMono. Use a Box widget to display multiple widgets in a HeViewMono.")
    widget.hasChild = true
    widget.valChild = child

renderable HeViewChooser of BaseWidget:
  # FIXME: text does not show
  views: Table[string, Widget]

  hooks:
    beforeBuild:
      state.internalWidget = he_view_chooser_new()
      he_view_chooser_set_stack(state.internalWidget, gtk_stack_new())

  hooks views:
    (build, update):
      if widget.hasViews:
        for name, view in widget.valViews:
          view.assignApp(state.app)

        let stack = he_view_chooser_get_stack(state.internalWidget)

        for name, view in state.views:
          if name notin widget.valViews:
            gtk_stack_remove(stack, view.unwrapInternalWidget())

        for name, viewWidget in widget.valViews:
          if name in state.views:
            let
              view = state.views[name]
              newView = viewWidget.update(view)
            if not newView.isNil:
              gtk_stack_remove(stack, view.unwrapInternalWidget())
              gtk_stack_add_named(stack, newView.unwrapInternalWidget(), name.cstring)
              state.views[name] = newView
          else:
            let view = viewWidget.build()
            gtk_stack_add_named(stack, view.unwrapInternalWidget(), name.cstring)
            state.views[name] = view

  adder add {.name: "main".}:
    if name in widget.valViews:
      raise newException(ValueError, "View \"" & name & "\" already exists")
    widget.hasViews = true
    widget.valViews[name] = child

renderable HeDropdown of BaseWidget:
  entries: seq[string]
  # TODO: how to make this read-only
  active: string

  hooks:
    beforeBuild:
      state.internalWidget = he_dropdown_new()

  hooks entries:
    (build, update):
      he_dropdown_remove_all(state.internalWidget)
      for s in widget.valEntries:
        # FIXME: this line runs forever
        he_dropdown_append(state.internalWidget, s.cstring)

  hooks active:
    read:
      state.active = $he_dropdown_get_active(state.internalWidget)

renderable HeEmptyPage of BaseWidget:
  title: string
  description: string
  icon: string
  buttonText: string

  hooks:
    beforeBuild:
      state.internalWidget = he_empty_page_new()

  hooks title:
    property:
      state.internalWidget.he_empty_page_set_title state.title.cstring

  hooks description:
    property:
      state.internalWidget.he_empty_page_set_description state.description.cstring

  hooks icon:
    property:
      state.internalWidget.he_empty_page_set_icon state.icon.cstring

  hooks buttonText:
    property:
      state.internalWidget.he_empty_page_set_button state.buttonText.cstring

# renderable HeSwitch of BaseWidget:
#   left_icon: string
#   right_icon: string
#
#   # copy stuff from renderable Switch
#   state: bool
#
#   proc changed(state: bool)
#
#   hooks:
#     beforeBuild:
#       state.internalWidget = he_switch_new()
#     connectEvents:
#       proc stateSetCallback(widget: GtkWidget, state: cbool, data: ptr EventObj[proc (state: bool)]): cbool {.cdecl.} =
#         logExceptions:
#           let state = state != 0
#           SwitchState(data[].widget).state = state
#           data[].callback(state)
#           data[].redraw()
#       
#       state.connect(state.changed, "state-set", stateSetCallback)
#     disconnectEvents:
#       state.internalWidget.disconnect(state.changed)
#
#   hooks state:
#     property:
#       gtk_switch_set_active(state.internalWidget.iswitch, cbool(ord(state.state)))

let gTypeHeButton = g_type_from_name("HeButton")

#[
renderable HeDialog of BaseWidget:
  title: string
  info: string
  icon: string
  primaryButton: Widget
  secondaryButton: Widget
  child: Widget

  hooks:
    beforeBuild:
      state.internalWidget = gtk_window_new(GTK_WINDOW_TOPLEVEL) # create dummy for now
    afterBuild:
      let root = state.internalWidget.gtk_widget_get_toplevel
      if not root.gtk_widget_is_toplevel.bool:
        raise newException(ValueError, "cannot get toplevel widget")
      state.internalWidget = he_dialog_new(
        state.internalWidget.gtk_widget_get_toplevel,
        state.title.cstring,
        state.info.cstring,
        state.icon.cstring,
        state.primaryButton.unwrapInternalWidget,
        state.secondaryButton.unwrapInternalWidget
      )

  hooks title:
    property:
      state.internalWidget.he_dialog_set_title(state.title.cstring)

  hooks info:
    property:
      state.internalWidget.he_dialog_set_info(state.info.cstring)

  hooks icon:
    property:
      state.internalWidget.he_dialog_set_icon(state.icon.cstring)

  hooks primaryButton:
    (build, update):
      state.updateChild(state.primaryButton, widget.valPrimaryButton, he_dialog_set_primary_button)

  hooks secondaryButton:
    (build, update):
      state.updateChild(state.secondaryButton, widget.valSecondaryButton, he_dialog_set_secondary_button)

  adder primaryButton:
    if widget.hasPrimaryButton:
      raise newException(ValueError, "Unable to add multiple primary buttons to a HeDialog.")
    # if not bool child.build.unwrapInternalWidget.g_type_check_instance_is_a gTypeHeButton:
    #   raise newException(ValueError, "{.primaryButton.} must be HeButton.")
    widget.hasPrimaryButton = true
    widget.valPrimaryButton = child

  adder secondaryButton:
    if widget.hasSecondaryButton:
      raise newException(ValueError, "Unable to add multiple secondary buttons to a HeDialog.")
    # if not bool child.build.unwrapInternalWidget.g_type_check_instance_is_a gTypeHeButton:
    #   raise newException(ValueError, "{.secondaryButton.} must be HeButton.")
    widget.hasSecondaryButton = true
    widget.valSecondaryButton = child

  hooks child:
    (build, update):
      state.updateChild(state.child, widget.valChild, he_dialog_add)

  adder add:
    widget.hasChild = true
    widget.valChild = child
]#

renderable HeAppBar of BaseWidget:
  is_compact: bool
  showLeftTitleButtons: bool
  showRightTitleButtons: bool

  hooks:
    beforeBuild:
      state.internalWidget = he_app_bar_new()

  hooks is_compact:
    property:
      state.internalWidget.he_app_bar_set_is_compact state.is_compact.cbool

  hooks showRightTitleButtons:
    property:
      state.internalWidget.he_app_bar_set_show_right_title_buttons state.showRightTitleButtons.cbool

  hooks showLeftTitleButtons:
    property:
      state.internalWidget.he_app_bar_set_show_left_title_buttons state.showLeftTitleButtons.cbool


proc defaultStyleManager*(): StyleManager =
  result = he_style_manager_new()

type HeAppConfig = object of AppConfig

proc setupApp(config: HeAppConfig): WidgetState =
  let styleManager = he_style_manager_new()
  he_style_manager_register(styleManager)
  
  result = setupApp(AppConfig(config))

proc heInnerBrew(id: cstring,
           widget: Widget,
           icons: openArray[string] = [],
           defaultAccent: HeRGBColor = HeRGBColor(r: 0.0.cdouble, g: 7.0.cdouble, b: 143.0.cdouble),
           startupEvents: openArray[ApplicationEvent] = [],
           shutdownEvents: openArray[ApplicationEvent] = [],
           stylesheets: openArray[Stylesheet] = []) =
  he_init()
  var config = HeAppConfig(
    widget: widget,
    icons: @icons,
    stylesheets: @stylesheets
  )
  
  var context = AppContext[HeAppConfig](
    config: config,
    startupEvents: @startupEvents,
    shutdownEvents: @shutdownEvents
  )
  
  proc activateCallback(app: GApplication, data: ptr AppContext[HeAppConfig]) {.cdecl.} =
    let
      state = setupApp(data[].config)
      window = state.unwrapRenderable().internalWidget
    gtk_window_present(window)
    gtk_application_add_window(app, window)
    
    data[].state = state
    data[].execStartupEvents()

  let app = he_application_new(id, G_APPLICATION_FLAGS_NONE)
  he_application_set_default_accent_color(app, addr defaultAccent)
  defer: g_object_unref(app.pointer)
  
  proc shutdownCallback(app: GApplication, data: ptr AppContext[HeAppConfig]) {.cdecl.} =
    data[].execShutdownEvents()
  
  discard g_signal_connect(app, "activate", activateCallback, context.addr)
  discard g_signal_connect(app, "shutdown", shutdownCallback, context.addr)
  discard g_application_run(app)


proc brew*(widget: Widget,
           icons: openArray[string] = [],
           defaultAccent: HeRGBColor = HeRGBColor(r: 0.0.cdouble, g: 7.0.cdouble, b: 143.0.cdouble),
           startupEvents: openArray[ApplicationEvent] = [],
           shutdownEvents: openArray[ApplicationEvent] = [],
           stylesheets: openArray[Stylesheet] = []) =
  heInnerBrew(nil.cstring, widget, icons, defaultAccent, startupEvents, shutdownEvents, stylesheets)

proc brew*(id: string,
           widget: Widget,
           icons: openArray[string] = [],
           defaultAccent: HeRGBColor = HeRGBColor(r: 0.0.cdouble, g: 7.0.cdouble, b: 143.0.cdouble),
           startupEvents: openArray[ApplicationEvent] = [],
           shutdownEvents: openArray[ApplicationEvent] = [],
           stylesheets: openArray[Stylesheet] = []) =
  heInnerBrew(id.cstring, widget, icons, defaultAccent, startupEvents, shutdownEvents, stylesheets)
