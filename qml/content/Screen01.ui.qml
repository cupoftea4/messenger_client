import QtQuick 2.0
import QtQuick.Controls
import Messanger
import QtQuick.Timeline 1.0



Rectangle {
    id: rectangle
    width: Constants.width
    height: Constants.height
    color: "#1b1b1b"





    Timeline {
        id: timeline
        animations: [
            TimelineAnimation {
                id: timelineAnimation
                running: false
                loops: 1
                duration: 1000
                to: 1000
                from: 0
            }
        ]
        endFrame: 1000
        enabled: false
        startFrame: 0
    }

    Column {
        id: form
        width: 219
        height: 170
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter

        Button {
            id: sockets_btn
            height: 48
            text: qsTr("SOCKETS")
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.leftMargin: 0
            anchors.rightMargin: 0
            highlighted: true
            flat: false

            Connections {
                target: sockets_btn
                function onClicked() {
                    rectangle.state = "login"
                }
            }
        }

        Button {
            id: pipes_btn
            height: 48
            text: qsTr("PIPES")
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.leftMargin: 0
            anchors.rightMargin: 0
            flat: true
            highlighted: true
        }

        Button {
            id: mailslots_btn
            height: 48
            text: qsTr("MAILSLOTS")
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.leftMargin: 0
            anchors.rightMargin: 0
            flat: true
            highlighted: true
        }

        TextField {
            id: name
            visible: false
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.rightMargin: 0
            anchors.leftMargin: 0
            placeholderText: qsTr("Text Field")
            color: "white"
        }

        Text {
            id: name_error
            visible: false
            color: "#ff2222"
            text: qsTr("Error")
            anchors.left: parent.left
            anchors.right: parent.right
            font.pixelSize: 12
            anchors.leftMargin: 0
            anchors.rightMargin: 0
        }

        TextField {
            id: password
            echoMode: TextInput.Password
            visible: false
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.leftMargin: 0
            anchors.rightMargin: 0
            placeholderText: qsTr("Text Field")
            color: "white"
        }

        TextField {
            id: password_rep
            echoMode: TextInput.Password
            visible: false
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.rightMargin: 0
            anchors.leftMargin: 0
            placeholderText: qsTr("repeat password")
            color: "white"
        }

        Button {
            id: login_btn
            objectName: "login_btn"
            visible: false
            text: qsTr("LOG IN")
            anchors.left: parent.left
            anchors.right: parent.right
            highlighted: true
            anchors.rightMargin: 0
            anchors.leftMargin: 0

            Connections {
                   target: SignalsConnector
                   function onServerResponse(res: string) {
                            console.log(res);
        //                    qmltocpp_id.controlEvent(0);    //0 = EVENT_APP_EXIT
                        }
                }


            signal qmlSignal(name: string, password: string)


            Connections {
                target: login_btn

                function onClicked() {
                    if (name.length > 3) {
                        rectangle.state = "chat"

                    } else {
                        name_error.visible = true
                        name_error.text = "Name is too short"
                    }
                    login_btn.qmlSignal(name.text, password.text)
                    console.log(name.length)
                }
            }
        }
        Button {
            id: signin_btn
            visible: false
            text: qsTr("Register")
            anchors.left: parent.left
            anchors.right: parent.right
            flat: true
            highlighted: true
            anchors.rightMargin: 0
            anchors.leftMargin: 0

            Connections {
                target: signin_btn
                function onClicked() {
                    rectangle.state = "register"
                }
            }
        }
    }

    Button {
        id: back_btn
        x: 8
        y: 8
        visible: false
        text: qsTr("Back")
        flat: true

        Connections {
            target: back_btn
            function onClicked() {
                rectangle.state = "login"
            }
        }
    }

    Row {
        id: message_row
        y: 572
        height: 42
        visible: false
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.rightMargin: 25
        anchors.leftMargin: 25
        anchors.bottomMargin: 25

        TextField {
            id: textField
            anchors.left: parent.left
            anchors.right: send_btn.left
            anchors.rightMargin: 15
            anchors.leftMargin: 0
            placeholderText: qsTr("Text Field")
            color: "white"
        }

        Button {
            id: send_btn
            text: qsTr("Send")
            anchors.right: parent.right
            font.capitalization: Font.Capitalize
            highlighted: true
            anchors.rightMargin: 0
        }
    }

    Flow {
        id: messages
        x: 39
        width: 400
        anchors.top: back_btn.bottom
        anchors.bottom: message_row.top
        anchors.topMargin: 10
        anchors.bottomMargin: 10
    }

    states: [
        State {
            name: "login"

            PropertyChanges {
                target: timeline
                enabled: true
            }

            PropertyChanges {
                target: timelineAnimation
                running: true
            }

            PropertyChanges {
                target: sockets_btn
                opacity: 1
                visible: false
                text: qsTr("SOCKETS")
                clip: false
            }

            PropertyChanges {
                target: pipes_btn
                visible: false
            }

            PropertyChanges {
                target: mailslots_btn
                visible: false
            }

            PropertyChanges {
                target: name
                visible: true
                placeholderTextColor: "#73ffffff"
                placeholderText: qsTr("name")
            }

            PropertyChanges {
                target: password
                visible: true
                placeholderTextColor: "#7affffff"
                placeholderText: qsTr("password")
                font.italic: true
                renderType: Text.NativeRendering
                hoverEnabled: true
            }

            PropertyChanges {
                target: login_btn
                visible: true
            }

            PropertyChanges {
                target: signin_btn
                visible: true
                highlighted: true
                flat: true
            }

            PropertyChanges {
                target: rectangle
                clip: false
                antialiasing: false
            }

            PropertyChanges {
                target: name_error
                x: 130
                y: 274
                width: 219
                height: 16
                visible: false
                color: "#ff1a1a"
                text: qsTr("")
            }

            PropertyChanges {
                target: back_btn
                visible: false
                text: qsTr("Back")
                highlighted: false
                flat: true
            }

            PropertyChanges {
                target: message_row
                visible: false
            }
        },
        State {
            name: "register"
            PropertyChanges {
                target: timeline
                enabled: true
            }

            PropertyChanges {
                target: timelineAnimation
                running: true
            }

            PropertyChanges {
                target: sockets_btn
                opacity: 1
                visible: false
                text: qsTr("SOCKETS")
                clip: false
            }

            PropertyChanges {
                target: pipes_btn
                visible: false
            }

            PropertyChanges {
                target: mailslots_btn
                visible: false
            }

            PropertyChanges {
                target: name
                visible: true
                placeholderTextColor: "#73ffffff"
                placeholderText: qsTr("name")
            }

            PropertyChanges {
                target: password
                visible: true
                hoverEnabled: true
                font.italic: true
                renderType: Text.NativeRendering
                placeholderTextColor: "#7affffff"
                placeholderText: qsTr("password")
            }

            PropertyChanges {
                target: login_btn
                visible: false
            }

            PropertyChanges {
                target: signin_btn
                visible: true
                flat: false
                highlighted: true
            }

            PropertyChanges {
                target: rectangle
                antialiasing: false
            }

            PropertyChanges {
                target: form
                visible: true
            }

            PropertyChanges {
                target: back_btn
                visible: true
                flat: false
            }

            PropertyChanges {
                target: password_rep
                visible: true
                placeholderTextColor: "#87ffffff"
                font.italic: true
            }

            PropertyChanges {
                target: message_row
                visible: false
            }
        },
        State {
            name: "chat"
            PropertyChanges {
                target: timeline
                enabled: true
            }

            PropertyChanges {
                target: timelineAnimation
                running: true
            }

            PropertyChanges {
                target: sockets_btn
                opacity: 1
                visible: false
                text: qsTr("SOCKETS")
                clip: false
            }

            PropertyChanges {
                target: pipes_btn
                visible: false
            }

            PropertyChanges {
                target: mailslots_btn
                visible: false
            }

            PropertyChanges {
                target: name
                visible: true
                placeholderTextColor: "#73ffffff"
                placeholderText: qsTr("name")
            }

            PropertyChanges {
                target: password
                visible: true
                placeholderTextColor: "#7affffff"
                hoverEnabled: true
                font.italic: true
                placeholderText: qsTr("password")
                renderType: Text.NativeRendering
            }

            PropertyChanges {
                target: login_btn
                visible: false
            }

            PropertyChanges {
                target: signin_btn
                visible: true
                flat: false
                highlighted: true
            }

            PropertyChanges {
                target: rectangle
                antialiasing: false
            }

            PropertyChanges {
                target: form
                visible: false
            }

            PropertyChanges {
                target: back_btn
                visible: false
            }

            PropertyChanges {
                target: password_rep
                visible: true
                font.italic: true
            }

            PropertyChanges {
                target: message_row
                visible: true
            }
        }
    ]
}

/*##^##
Designer {
    D{i:0;formeditorZoom:1.1}D{i:1}D{i:5}D{i:4}D{i:6}D{i:7}D{i:8}D{i:9}D{i:10}D{i:11}
D{i:13}D{i:12}D{i:15}D{i:14}D{i:3}D{i:17}D{i:18}D{i:16}D{i:20}D{i:21}D{i:19}D{i:22}
}
##^##*/

