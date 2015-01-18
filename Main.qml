import QtQuick 1.1
import Qt 4.7
import com.nokia.meego 1.0
    
PageStackWindow {
  id: rootWin;
  initialPage: mainPage;
  showStatusBar: True;
  showToolBar: True;

  function showMessage(title, message) {
    messageDialog.titleText = title;
    messageDialog.message = message;
    messageDialog.open();
  }

  Page{
    id: mainPage;
    tools: mainTools;
    Menu {
      id: mainMenu;
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
      id: mainTool;
      visible: true;
      ToolIcon {
        id: menuIcon
        iconSource: "image://theme/icon-m-toolbar-view-menu-white";
        onClicked: mainMenu.open()
      }
		
      ToolIcon {
        id: backIcon
        iconSource: "image://theme/icon-m-toolbar-back-white";
      }

      ToolIcon {
        id: sendIcon;
        iconSource: "image://theme/icon-m-toolbar-all-content-white";
      }

      ToolIcon {
        id: cameraIcon;
        iconSource: "image://theme/icon-m-toolbar-camera";
      }

      ToolIcon {
        id: shareIcon;
        iconSource: "image://theme/icon-m-toolbar-share-white";
      }
    }
  }
  QueryDialog {
    id: messageDialog;
    acceptButtonText: "Okay";
  }
}

