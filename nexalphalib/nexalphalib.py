#!/usr/bin/python
#caio2k

from urllib import urlencode
import urllib2
import json
from xml.etree.ElementTree import XML

from discoverSSDP import discoverSSDP

API_RETRIES=3

class NexAlphaAPI:
  host='192.168.122.1'
  port=8080

  def sendJson(self,uri,data,expected_answer=None):
    url  = 'http://'+self.host+':'+str(self.port)+uri
    req = urllib2.Request(url, data)
    for x in xrange(API_RETRIES):
      print "try #"+str(x)
      try:
        resp = urllib2.urlopen(req,timeout=30)
      except urllib2.URLError:
        sleep(5)
        continue
      if resp:
        data = json.load(resp)
        resp.close()
        if expected_answer is not None:
          if data['result'] == expected_answer:
            sleep(5)
            return data
        else:
            return data
    return None

  def cameraStartup(self):
    uri  = '/sony/camera'
    data = '{"method":"startRecMode","params":[],"id":5}'
    print "starting camera"
    resp = self.sendJson(uri,data,0)
    if not resp:
      print "error starting camera"
    print resp

  def cameraStop(self):
    uri  = '/sony/camera'
    data = '{"method":"stopRecMode","params":[],"id":5}'
    print "stopping camera"
    resp = self.sendJson(uri,data,0)
    if not resp:
      print "error stoping camera"
    print resp

  def takePicture(self):
    uri  = '/sony/camera'
    data = '{"method":"actTakePicture","params":[],"id":18}'
    print "taking picture"
    resp = self.sendJson(uri,data)
    if not resp:
      print "error taking picture"
    print resp
    result = resp['result']
    print "took photo! download it at " + result[0]

  def discover(self):
    upnp_disc_resp=discoverSSDP("urn:schemas-sony-com:service:ScalarWebAPI:1",2,5)[0]
    if not upnp_disc_resp:
      print "error: upnp returned nothing... is camera connected?"
      return False
    upnp_desc_url=upnp_disc_resp.location
    print "url='"+upnp_desc_url+"'"
    upnp_desc_resp=urllib2.urlopen(upnp_desc_url,None,30)  #TODO implement retry
    upnp_desc_file=upnp_desc_resp.read()
    upnp_desc_resp.close()
    #print upnp_desc_file
    #upnp_endpoint=XML(upnp_desc_file).find("X_ScalarWebAPI_ServiceType").text
    #self.upnp_endpoint=upnp_endpoint
    

if __name__ == "__main__":
  srapi=NexAlphaAPI()
  bla=srapi.discover()
  srapi.cameraStartup()
  srapi.takePicture()
  srapi.cameraStop()
