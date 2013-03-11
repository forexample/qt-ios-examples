/* main.qml ---
 * 
 * Author: Julien Wintz
 * Created: Mon Mar 11 12:44:10 2013 (+0100)
 * Version: 
 * Last-Updated: Mon Mar 11 16:01:41 2013 (+0100)
 *           By: Julien Wintz
 *     Update #: 99
 */

/* Change Log:
 * 
 */

import QtQuick 1.0

Rectangle {
    width: 768;
    height: 1024;

    color: "#cccccc";

    MultiPointTouchArea {
        anchors.fill: parent
        touchPoints: [
            TouchPoint { id: point1 },
            TouchPoint { id: point2 }
        ]
    }

    Rectangle {
        width: 30;
        height: 30;
        color: "green"
        x: point1.x
        y: point1.y
    }

    Rectangle {
        width: 30;
        height: 30;
        color: "yellow"
        x: point2.x
        y: point2.y
    }
}
