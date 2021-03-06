
TEMPLATE = lib

CONFIG += qt plugin c++11
QT     += qml quick

TARGET = $$qtLibraryTarget(qml-sockets)
uri = org.jemc.qml.Sockets

TARGETDIR = $$[QT_INSTALL_QML]/$$replace(uri, \\., /)
SRCDIR    = $$PWD/src
DESTDIR   = $$PWD/build/native

android {
  VENDORDIR = $$PWD/vendor/prefix/$$ANDROID_TARGET_ARCH
  DESTDIR   = $$PWD/build/$$ANDROID_TARGET_ARCH
  QMAKE_LIBDIR += $$VENDORDIR/lib
  QMAKE_INCDIR += $$VENDORDIR/include
}

HEADERS += $$SRCDIR/qml-sockets.h   \
           $$SRCDIR/tcp.h           \
           $$SRCDIR/tcp_server.h    \
           $$SRCDIR/udp_multicast.h

OBJECTS_DIR = $$DESTDIR/.obj
MOC_DIR     = $$DESTDIR/.moc
RCC_DIR     = $$DESTDIR/.rcc
UI_DIR      = $$DESTDIR/.ui

target.path  = $$TARGETDIR
qmldir.files = $$SRCDIR/qmldir
qmldir.path  = $$TARGETDIR
qml.files    = $$SRCDIR/qml/*
qml.path     = $$TARGETDIR/qml

INSTALLS += target qmldir qml
