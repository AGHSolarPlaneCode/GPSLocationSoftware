import QtQuick 2.0
import "NotifyMenu.js" as NotifyMenu
import "interfaceFunction.js" as Interface
import QtQuick.Controls 2.2
Item {
    id: root
    property string standardcolor
    property string switchedcolor
    property string mousecontainscolor
    property string fontFamily: standardFont.name
    antialiasing: true

    signal buttonClicked(var buttonState)
    signal connectionChanged(var connectionState)  //send this to backend
    signal notifyChange(var notifyState)
    signal buttonStop()




    FontLoader { //load Agency FB from assets
        id: standardFont
        source: "qrc:/assetsMenu/agency_fb.ttf"
    }
    Connections {
        target: root
        onButtonStop:{
            connectionSlider.source="qrc:/assetsMenu/START BUTTON.png";
        }
    }

    Connections{
        target: adapter
        onActiveDataFlowButton:{

            if(state){
                console.log("STATE TRUE");
                connectionSlider.source = "qrc:/assetsMenu/STOP BUTTON.png"
                startButtonState = true;
                connectionChanged(true);
            }else{
                console.log("STATE FALSE");
                connectionSlider.source = "qrc:/assetsMenu/START BUTTON.png";
                startButtonState = false;
                connectionChanged(false);
            }

            // Signal end
        }

        // Connections end
    }

    Rectangle {
        id: topBar
        width: parent.width*0.92
        height: parent.height*0.139
        color: "#2F3243"
        anchors {
        top: parent.top
        right:parent.right
        }

        Text{
            id: timeObj
            font.family: fontFamily
            color: "#B7B8BD"
            font {
                pointSize: (parent.height*0.2).toFixed(0)*1.2
                bold: true
            }

            anchors {
                verticalCenter: parent.verticalCenter
               // verticalCenterOffset: -parent.height*0.025
                left: notifyBell.left
                leftMargin: -parent.width*0.093
            }
            Timer{
                id: timeTimer
                interval: 100
                repeat: true
                running: true
                triggeredOnStart: true
                onTriggered: timeObj.text = new Date().toLocaleString(Qt.locale(),"hh:mm:ss")
            }
        }
        Image {
            id: clockIMG
            width: timeObj.height*0.7
            height: timeObj.height*0.7
            anchors{
                verticalCenter: parent.verticalCenter
                right: timeObj.left
                rightMargin: width*0.2
            }
            source: "qrc:/assetsMenu/clock.png"
        }

        Image { //connectButton
             id: connectionSlider
             source: "qrc:/assetsMenu/START BUTTON.png"
             width: parent.width*0.1
             height: parent.height*0.33*1.1
             anchors {
                 right: clockIMG.left
                 rightMargin: clockIMG.width*0.7
                 verticalCenter: parent.verticalCenter
             }

           // TOOLS TIP - START

             ToolTip {
                 id: startTip
                 text: "START/STOP DATA FLOW"
                 visible: startButtonArea.containsMouse

                 contentItem: Text {
                     text: startTip.text
                     font.bold: true
                     font.family: standardFont.name
                     color: "#F2B81E"
                 }

                 background: Rectangle {
                     border.color: "#F2B81E"
                     color: "#424D5C"
                     radius: 5
                 }
             }

           // TOOLS TIP - END

             MouseArea {
                 id: startButtonArea
                 anchors.fill: parent
                 hoverEnabled: true
                 cursorShape: Qt.PointingHandCursor
                 onClicked: {
                     adapter.getDataAction()

//                    if(parent.source=="qrc:/assetsMenu/START BUTTON.png"){
//                        connectionChanged(true);
//                        startButtonState = true;
//                        parent.source="qrc:/assetsMenu/STOP BUTTON.png"
//                    }
//                    else {
//                       parent.source="qrc:/assetsMenu/START BUTTON.png";
//                        startButtonState = false;
//                      connectionChanged(false);
//                    }
                 }
             }

        }
        Image {
            id: notifyBell
            source: "qrc:/assetsMenu/NOTIFY BELL ON.png"
            property bool menu
            property bool notify: true

            property var menuObj: undefined

            onNotifyChanged: {
                errorManager.notifyBellState = notify
                NotifyMenu.deleteMenu();
            }

            anchors {
                right: parent.right
                rightMargin: parent.width*0.078
                verticalCenter: parent.verticalCenter
            }
            height: parent.height*0.3*1.2
            width: parent.width*0.020*1.2

            // TOOLS TIP - START

            ToolTip {
                id: bellTip
                text: "TURN ON/OFF NOTIFICATION"
                visible: bellMouseArea.containsMouse

                contentItem: Text {
                    text: bellTip.text
                    font.bold: true
                    font.family: standardFont.name
                    color: "#F2B81E"
                }

                background: Rectangle {
                    border.color: "#F2B81E"
                    color: "#424D5C"
                    radius: 5
                }
            }

            // TOOLS TIP - END

            MouseArea {
                id: bellMouseArea
                anchors.fill: notifyBell
                hoverEnabled: true
                onClicked: {
                    if(parent.menuObj==undefined){
                        parent.menu==true;
                        NotifyMenu.createMenu();

                    }
                    else {
                        NotifyMenu.deleteMenu();
                        parent.menu=false;
                        parent.menuObj=undefined;
                    }
                }

            }
        }


        Image {
            source: "qrc:/assetsMenu/AGHSOLARLOGO.png"
            height: 0.78*parent.height
            width: 0.096*parent.width
            anchors {
                left: parent.left
                leftMargin: 0.096*parent.width*0.25
                verticalCenter: parent.verticalCenter
            }
        }

    }

    Rectangle {
        id: sideBar
        width: parent.width*0.08
        height: parent.height
        color: "#2F3243"
            anchors {
                top: parent.top
                left: parent.left
                    }
            Rectangle {
                id: planeGroupRect
                width: parent.width*0.944
                height: parent.height*0.135
                color: standardcolor
                radius: 5
                    border {
                        width: parent.height*0.0034
                        color: "#2F3243"
                    }

                    anchors {
                        horizontalCenter: parent.horizontalCenter
                        top: parent.top
                        topMargin: parent.height*0.0034
                    }
                Image {
                    source: "qrc:/assetsMenu/planeLogo.png"
                    height: 0.71*parent.height
                    width: 0.66*parent.width
                    anchors {
                        centerIn: parent
                    }
                }
                MouseArea {
                    anchors.fill: parent
                    hoverEnabled: true
                    onEntered: {
                        parent.color = mousecontainscolor
                    }
                    onExited: {
                        parent.color = standardcolor
                    }
                    onClicked: {
                        buttonClicked("home");
                    }

                }
            }
            Rectangle {
                id: homeGroupRect
                width: parent.width*0.944
                height: parent.height*0.12
                color: standardcolor
                radius: 5
                     border {
                        width: parent.height*0.0034
                        color: "#2F3243"
                            }
                    anchors {
                        horizontalCenter: parent.horizontalCenter
                        top: planeGroupRect.bottom
                        topMargin: parent.height*0.0034
                    }
                    Image {
                        source: "qrc:/assetsMenu/homePageIcon.png"
                        height: 0.342*parent.height
                        width: 0.32*parent.width
                        anchors {
                            centerIn: parent
                        }
            }
                    MouseArea {
                        anchors.fill: parent
                        hoverEnabled: true
                        onEntered: {
                            parent.color = mousecontainscolor
                        }
                        onExited: {
                            parent.color = standardcolor
                        }
                        onClicked: {
                            buttonClicked("home");
                        }

                    }
            }
            Rectangle {
                id: parametersGroupRect
                width: parent.width*0.944
                height: parent.height*0.12
                color: standardcolor
                radius: 5
                     border {
                        width: parent.height*0.0034
                        color: "#2F3243"
                            }
                    anchors {
                        horizontalCenter: parent.horizontalCenter
                        top: homeGroupRect.bottom
                        topMargin: parent.height*0.0034
                    }
                    Image {
                        source: "qrc:/assetsMenu/parametersIcon.png"
                        height: 0.342*parent.height
                        width: 0.32*parent.width
                        anchors {
                            centerIn: parent
                        }
            }
                    MouseArea {
                        anchors.fill: parent
                        hoverEnabled: true
                        onEntered: {
                            parent.color = mousecontainscolor
                        }
                        onExited: {
                            parent.color = standardcolor
                        }
                        onClicked: {
                            buttonClicked("parameters");
                        }

                    }
            }
            Rectangle {
                id: historicalDataRect
                width: parent.width*0.944
                height: parent.height*0.12
                color: standardcolor
                radius: 5
                     border {
                        width: parent.height*0.0034
                        color: "#2F3243"
                            }
                    anchors {
                        horizontalCenter: parent.horizontalCenter
                        top: parametersGroupRect.bottom
                        topMargin: parent.height*0.0034
                    }
                    Image {
                        source: "qrc:/assetsMenu/historyIcon.png"
                        height: 0.342*parent.height
                        width: 0.32*parent.width
                        anchors {
                            centerIn: parent
                        }
            }
                    MouseArea {
                        anchors.fill: parent
                        hoverEnabled: true
                        onEntered: {
                            parent.color = mousecontainscolor
                        }
                        onExited: {
                            parent.color = standardcolor
                        }
                        onClicked: {
                            buttonClicked("historical");
                        }

                    }
            }
            Rectangle {
                id: settingsRect
                width: parent.width*0.944
                height: parent.height*0.12
                color: standardcolor
                radius: 5

                     border {
                        width: parent.height*0.0034
                        color: "#2F3243"
                            }
                    anchors {
                        horizontalCenter: parent.horizontalCenter
                        top: historicalDataRect.bottom
                        topMargin: parent.height*0.0034
                    }
                    Image {
                        source: "qrc:/assetsMenu/settingsIcon.png"
                        height: 0.342*parent.height
                        width: 0.32*parent.width
                        anchors {
                            centerIn: parent
                        }
            }
                    MouseArea {
                        anchors.fill: parent
                        hoverEnabled: true
                        onEntered: {
                            parent.color = mousecontainscolor
                        }
                        onExited: {
                            parent.color = standardcolor
                        }
                        onClicked: {
                            buttonClicked("settings");
                        }

                    }
            }

    }


}
