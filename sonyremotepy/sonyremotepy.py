#!/usr/bin/python
#caio2k

from urllib import urlencode
import urllib2
import json


class SonyRemoteAPI:
  host='192.168.122.1'
  port=8080

  def sendJson(self,uri,data):
    url  = 'http://'+self.host+':'+str(self.port)+uri
    req  = urllib2.Request(url, data)
    resp = urllib2.urlopen(req)
    data = json.load(resp)
    resp.close()
    return data

  def cameraStartup(self):
    uri  = '/sony/camera'
    data = '{"method":"startRecMode","params":[],"id":5}'
    print self.sendJson(uri,data)

  def cameraStop(self):
    uri  = '/sony/camera'
    data = '{"method":"stopRecMode","params":[],"id":5}'
    print self.sendJson(uri,data)

  def takePicture(self):
    uri  = '/sony/camera'
    data = '{"method":"actTakePicture","params":[],"id":18}'
    print self.sendJson(uri,data)

if __name__ == "__main__":
  srapi=SonyRemoteAPI()
  srapi.cameraStartup()
  srapi.takePicture()
  srapi.cameraStop()
