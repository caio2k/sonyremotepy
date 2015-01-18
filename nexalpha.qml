import QtQuick 1.1
import com.nokia.meego 1.0
    
SRSplash {
    id: appWindow
    width: 500; height: 200
    color: "lightgray"
    orientationLock: PageOrientation.LockPortrait
     
    Text {
        id: helloText
        text: "Hello world!"
        y: 30
        anchors.horizontalCenter: page.horizontalCenter
        font.pointSize: 24; font.bold: true
    }
     
    Label{
        text: "teste"
        width:parent.width
        horizontalAlignment: Text.AlignHCenter
        color:"white"
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 20
    }
}

