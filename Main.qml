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
    id: mainPage
    tools: mainTool
  }
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
    id: mainTool
    visible: true

    ToolItem {
      id: backIcon
      iconId: "icon-m-toolbar-back";
    }
    ButtonRow {
      TabButton {
        id: cameraIcon;
        iconSource: "image://theme/icon-m-toolbar-camera";
      }
      TabButton {
        id: sendIcon;
        iconSource: "image://theme/icon-m-toolbar-all-content-white";
      }
    }
    ToolItem {
      id: shareIcon;
      iconId: "icon-m-toolbar-share-white";
    }
    ToolItem {
      id: menuIcon
      iconId: "icon-m-toolbar-view-menu-white";
      onClicked: mainMenu.open()
    }
  }
  
  QueryDialog {
    id: messageDialog;
    acceptButtonText: "Okay";
  }
}

