# DockbarX applet for the MATE panel
### Version 1.0

## Runtime dependencies
 * [DockbarX](https://github.com/xuzhen/dockbarx)
 * MATE panel applet GObject introspection data (gir1.2-matepanelapplet-4.0 on Debian/Ubuntu)
 * Python3

## Installation

```
git clone https://github.com/xuzhen/dockbarx-mate-applet.git
cd dockbarx-mate-applet
make
sudo make install
```
The applet will be installed under /usr/local by default. You can change this behavior by setting the PREFIX variable to the `make` command.
```
make PREFIX=/usr
sudo make PREFIX=/usr install
```
