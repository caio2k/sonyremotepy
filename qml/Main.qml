import QtQuick 1.1
//import Qt 4.7
import com.nokia.meego 1.0


PageStackWindow {
  id: rootWin
  initialPage: mainPage
  showStatusBar: true
  showToolBar: true

  Component.onCompleted: { 
    theme.inverted = !theme.inverted
  }

  function showMessage(title, message) {
    messageDialog.titleText = title;
    messageDialog.message = message;
    messageDialog.open();
  }

  Page{
    id: mainPage
    tools: mainTool

  TabGroup{
    id: mainTab
    currentTab: galeryTab
    Page {
      id: galeryTab
      tools: mainTool
      ListModel {
        id: galeryModel
        ListElement {
          icon: "image://theme/icon-l-sharing-image"
          filename: "test1.png"
        }
        ListElement {
          icon: "icon-l-sharing-image"
          filename: "test2.png"
        }
        ListElement {
          icon: "icon-l-sharing-image"
          filename: "test3.png"
        }
        ListElement {
          icon: "icon-l-sharing-image"
          filename: "test4.png"
        }
        ListElement {
          icon: "icon-l-sharing-image"
          filename: "test5.png"
        }
        ListElement {
          icon: "icon-l-sharing-image"
          filename: "test6.png"
        }
        ListElement {
          icon: "icon-l-sharing-image"
          filename: "test7.png"
        }
        ListElement {
          icon: "icon-l-sharing-image"
          filename: "test8.png"
        }
        ListElement {
          icon: "icon-l-sharing-image"
          filename: "test9.png"
        }
      }
      Component{
        id: galeryDelegate
        Rectangle{
          width: galeryGrid.cellWidth 
          height: galeryGrid.cellHeight
          //color: GridView.isCurrentItem ? "white" : "blue"
          Image  {
            id: galeryIcon
            width: parent.width 
            height: parent.width 
            anchors.horizontalCenter: parent.horizontalCenter
            source: "image://theme/icon-l-sharing-image"
          }
          Text {
            anchors.top: galeryIcon.bottom
            anchors.horizontalCenter: parent.horizontalCenter 
            text: filename
          }
          MouseArea{
            anchors.fill: parent
            //onClicked: 
          }
        }
      }
      Component {
        id: galeryHighlight
        Rectangle { 
          width: galeryGrid.cellWidth 
          height: galeryGrid.cellHeight
          color: "lightsteelblue" 
        }
      }
      GridView{
        id: galeryGrid
        anchors.fill: parent
        cellWidth: parent.width / 4
        cellHeight: parent.width / 4 + 20
        //focus: true
        model: galeryModel
        delegate: galeryDelegate
        highlight: galeryHighlight
      }
    }
    Page {  
      id: liveTab
      Label {
        id: lbltab1  
        text: qsTr("This should be implemented later. Please help the developer!")  
        anchors.centerIn: parent  
        platformStyle: LabelStyle {  
          textColor: "white"
          fontFamily: "Arial"  
          fontPixelSize: 30  
        }  
      }  
    }
  }
  }


  Menu {
    id: mainMenu
    //visualParent: pageStack
    content: MenuLayout {
      MenuItem {
        text: "Refresh"
        //onClicked: rootWin.refresh();
      }
      MenuItem {
        text: "About"
        onClicked: rootWin.showMessage("NexAlpha for MeeGo", "Author: Caio Tsumura (caio2k@gmail.com)\n\nLicense: GPL 3.0 or later\n\nFeel free to follow me, @caio2k")
      }
      MenuItem {
        text: "Privacy Policy"
        onClicked: rootWin.showMessage("Privacy Policy", "This application stores no information.");
      }
    }
  }
   
  ToolBarLayout {
    id: mainTool
    visible: true

    ToolItem {
      id: backIcon
      iconId: "icon-m-toolbar-back-white";
    }
    ButtonRow {
      TabButton {
        id: galeryIcon;
        //iconSource: "icon-m-toolbar-all-content-white";
        iconSource: "image://theme/icon-m-camera-roll";
        tab: galeryTab
      }
      TabButton {
        id: cameraIcon;
        iconSource: "image://theme/icon-m-camera-shutter";
        tab: liveTab
      }
    }
    ToolItem {
      id: menuIcon
      iconId: "icon-m-toolbar-view-menu-white";
      onClicked: mainMenu.open()
    }
  }
  
  QueryDialog {
    id: messageDialog;
    acceptButtonText: "Ok";
  }
}

