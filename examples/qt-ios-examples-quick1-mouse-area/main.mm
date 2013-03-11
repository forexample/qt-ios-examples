/* main.mm ---
 *
 * Author: Julien Wintz
 * Created: Thu Mar  7 21:59:40 2013 (+0100)
 * Version:
 * Last-Updated:
 *           By:
 *     Update #: 87
 */

/* Change Log:
 *
 */

#include <QtCore>
#include <QtGui>
#include <QtDeclarative>
#include <QtWidgets>

int main(int argc, char **argv)
{
    QApplication application(argc, argv);

    QDeclarativeView view;
    view.setResizeMode(QDeclarativeView::SizeRootObjectToView);
    view.setSource(QUrl("qrc:qtios/main.qml"));
    view.show();
    view.raise();

    return application.exec();
}
