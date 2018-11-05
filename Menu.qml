import QtQuick 2.0

Item {
    antialiasing: true
    Rectangle {
        id: mainPage
        color: "#292B38"
        width: parent.width*0.92
        height: parent.height*0.861
        anchors {
            bottom: parent.bottom
            right: parent.right
        }

        border {
            width: 1
            color: "#333644"
        }
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
            text: qsTr("Connect:")
            color: "#F1F1F1"
            font {
                pointSize: parent.height*0.2
                bold: true
            }


            anchors{
                verticalCenter: parent.verticalCenter
                right: connectionSlider.left
                rightMargin: parent.width*0.01
            }
        }
        SliderSwitch {
            id: connectionSlider
            size: parent.height*0.4
            anchors {
                right: parent.right
                rightMargin: parent.width*0.005
                verticalCenter: parent.verticalCenter
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
                height: parent.height*0.12
                color: "#F2B81E"
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
            }
            Rectangle {
                id: homeGroupRect
                width: parent.width*0.944
                height: parent.height*0.12
                color: "#F2B81E"
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
            }
            Rectangle {
                id: parametersGroupRect
                width: parent.width*0.944
                height: parent.height*0.12
                color: "#F2B81E"
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
            }
            Rectangle {
                id: historicalDataRect
                width: parent.width*0.944
                height: parent.height*0.12
                color: "#F2B81E"
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
            }
            Rectangle {
                id: settingsRect
                width: parent.width*0.944
                height: parent.height*0.12
                color: "#F2B81E"
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
            }

    }


}
