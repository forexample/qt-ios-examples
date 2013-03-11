/* main.qml ---
 * 
 * Author: Julien Wintz
 * Created: Mon Mar 11 12:44:10 2013 (+0100)
 * Version: 
 * Last-Updated: Mon Mar 11 15:51:55 2013 (+0100)
 *           By: Julien Wintz
 *     Update #: 95
 */

/* Change Log:
 * 
 */

import QtQuick 1.0

Rectangle {
    width: 768;
    height: 1024;
    color: "green";

    MouseArea {
        anchors.fill: parent;
        acceptedButtons: Qt.LeftButton | Qt.RightButton;
        onClicked: {
            if (mouse.button == Qt.RightButton)
                parent.color = 'blue';
            else
                parent.color = 'red';
        }
    }
}
