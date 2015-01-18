#!/usr/bin/python
# -*- coding: utf-8 -*-
 
import sys
from PySide.QtCore import *
from PySide.QtGui import *
from PySide import QtCore, QtGui, QtDeclarative
import dbus, dbus.service, dbus.mainloop, dbus.glib
from PySide.QtDeclarative import QDeclarativeView
import sys, datetime, os, os.path, urllib2, signal, threading


class Signals(QtCore.QObject):                   
  onAddStatus = QtCore.Signal(list, QtCore.QAbstractListModel, bool)
  onDoneWorking = QtCore.Signal()
  onDoneSending = QtCore.Signal()
  onDoneMessage = QtCore.Signal(str, str, bool)
  onDoneFavourite = QtCore.Signal(int, bool)
  onUpdateFollowing = QtCore.Signal(int, bool)
  onError = QtCore.Signal(str, str)
           
  def __init__(self, parent=None):
    super(Signals, self).__init__(parent)
 
class NexAlpha(dbus.service.Object):
  def __init__(self):
    self.app = QtGui.QApplication(sys.argv)
    self.app.setApplicationName("NexAlpha")
    signal.signal(signal.SIGINT, signal.SIG_DFL)

    self.signals = Signals()

    self.statuses = {}
    self.favourites = {}
    self.replyingTo = None

    #self.client = gconf.client_get_default()
    #if not os.path.exists(self.cacheDir):
      #os.mkdir(self.cacheDir)
      #self.signals.onError.connect(self.error)

    self.view = QtDeclarative.QDeclarativeView()
    self.view.setSource("Main.qml")
    self.rootObject = self.view.rootObject()
    self.context = self.view.rootContext()
    #self.context.setContextProperty('timelineModel', self.timelineModel)
    #self.rootObject.openFile("nexalpha.qml")
    #self.rootObject.send.connect(self.send)
    self.view.showFullScreen()
    #self.view.show()
    #dbus_main_loop = dbus.glib.DBusGMainLoop(set_as_default=True)
    #session_bus = dbus.SessionBus(dbus_main_loop)
    #bus_name = dbus.service.BusName("com.mikeasoft.statusnet.eventcallback", bus=session_bus)
    #dbus.service.Object.__init__(self, object_path="/EventFeedService", bus_name=bus_name)

    sys.exit(self.app.exec_())

if __name__ == "__main__":
  NexAlpha()
