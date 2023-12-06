DIR := $(dir $(realpath $(lastword $(MAKEFILE_LIST))))
FILES := $(basename $(wildcard $(DIR)*.in))

PREFIX ?= /usr/local

%: %.in
	@echo create $(notdir $@)
	@sed "s:%PREFIX%:$(PREFIX):" "$@.in" > "$@"

all: clean $(FILES)

clean:
	@rm -f $(FILES)

install:
	install -D -m 755 -t "$(PREFIX)/lib/mate-panel/" "$(DIR)dockbarx_mate_applet" 
	install -D -m 644 -t "$(PREFIX)/share/dbus-1/services/" "$(DIR)org.mate.panel.applet.DockbarXAppletFactory.service" 
	install -D -m 644 -t "$(PREFIX)/share/mate-panel/applets/" "$(DIR)org.mate.panel.DockbarX.mate-panel-applet"
	install -D -m 644 -t "$(PREFIX)/share/mate-panel/ui/" "$(DIR)dockbarx-applet-menu.xml"

uninstall:
	rm -f "$(PREFIX)/lib/mate-panel/dockbarx_mate_applet"
	rm -f "$(PREFIX)/share/dbus-1/services/org.mate.panel.applet.DockbarXAppletFactory.service"
	rm -f "$(PREFIX)/share/mate-panel/applets/org.mate.panel.DockbarX.mate-panel-applet"
	rm -f "$(PREFIX)/share/mate-panel/ui/dockbarx-applet-menu.xml"
