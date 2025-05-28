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
import std/[strutils, sequtils, strformat, options, sugar]

export he.StyleManager
export he.HeVersion

when defined(owlkettleDocs) and isMainModule:
  echo "# Libhelium Widgets\n\n"
  echo "Some widgets are only available when linking against later libhelium versions."
  echo "Set the target libhelium version by passing `-d:heminor=<Minor Version>`."
  echo "\n\n"

renderable HeWindow of BaseWindow:
  ## A Window that does not have a title bar.
  child: Widget
  
  hooks:
    beforeBuild:
      state.internalWidget = he_window_new()
  
  hooks child:
    (build, update):
      state.updateChild(state.child, widget.valChild, gtk_window_set_child)
  
  adder add:
    ## Adds a child to the window surface. Each window surface may only have one child.
    if widget.hasChild:
      raise newException(ValueError, "Unable to add multiple children to a HeWindow. Use a Box widget to display multiple widgets in a HeWindow.")
    widget.hasChild = true
    widget.valChild = child
  
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
  ## A Window that does not have a title bar.
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

  adder add:
    ## Adds a child to the window surface. Each window surface may only have one child.
    if widget.hasChild:
      raise newException(ValueError, "Unable to add multiple children to a HeWindow. Use a Box widget to display multiple widgets in a HeWindow.")
    widget.hasChild = true
    widget.valChild = child
  
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


renderable HeButton of BaseWidget:
  icon: string
  text: string
  is_pill: bool

  hooks:
    beforeBuild:
      state.internalWidget = he_button_new(state.icon.cstring, state.text.cstring)

  hooks text:
    property:
      state.internalWidget.he_button_set_text state.text.cstring

  hooks icon:
    property:
      state.internalWidget.he_button_set_icon state.icon.cstring
  
  hooks is_pill:
    property:
      state.internalWidget.he_button_set_is_pill state.is_pill.cbool

proc defaultStyleManager*(): StyleManager =
  result = he_style_manager_new()

type HeAppConfig = object of AppConfig
  # colorScheme: ColorScheme

# proc setupApp(config: AdwAppConfig): WidgetState =
#   let styleManager = adw_style_manager_get_default()
#   adw_style_manager_set_color_scheme(styleManager, config.colorScheme)
#   
#   result = setupApp(AppConfig(config))

proc brew*(widget: Widget,
           icons: openArray[string] = [],
           # colorScheme: ColorScheme = ColorSchemeDefault,
           startupEvents: openArray[ApplicationEvent] = [],
           shutdownEvents: openArray[ApplicationEvent] = [],
           stylesheets: openArray[Stylesheet] = []) =
  he_init()
  let config = HeAppConfig(
    widget: widget,
    icons: @icons,
    darkTheme: false,
    # colorScheme: colorScheme,
    stylesheets: @stylesheets
  )
  let state = setupApp(config)
  
  let context = AppContext[HeAppConfig](
    config: config,
    state: state,
    startupEvents: @startupEvents,
    shutdownEvents: @shutdownEvents
  )
  
  context.execStartupEvents()
  runMainloop(state)
  context.execShutdownEvents()

proc brew*(id: string,
           widget: Widget,
           icons: openArray[string] = [],
           # colorScheme: ColorScheme = ColorSchemeDefault,
           startupEvents: openArray[ApplicationEvent] = [],
           shutdownEvents: openArray[ApplicationEvent] = [],
           stylesheets: openArray[Stylesheet] = []) =
  var config = HeAppConfig(
    widget: widget,
    icons: @icons,
    darkTheme: false,
    # colorScheme: colorScheme,
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

  let app = he_application_new(id.cstring, G_APPLICATION_FLAGS_NONE)
  defer: g_object_unref(app.pointer)
  
  proc shutdownCallback(app: GApplication, data: ptr AppContext[HeAppConfig]) {.cdecl.} =
    data[].execShutdownEvents()
  
  discard g_signal_connect(app, "activate", activateCallback, context.addr)
  discard g_signal_connect(app, "shutdown", shutdownCallback, context.addr)
  discard g_application_run(app)
