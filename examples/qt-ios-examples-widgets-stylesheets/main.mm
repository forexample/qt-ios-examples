/* main.mm ---
 *
 * Author: Julien Wintz
 * Created: Thu Mar  7 21:59:40 2013 (+0100)
 * Version:
 * Last-Updated:
 *           By:
 *     Update #: 195
 */

/* Change Log:
 *
 */

#include <QtCore>
#include <QtGui>
#include <QtWidgets>

// ///////////////////////////////////////////////////////////////////
// Helper functions
// ///////////////////////////////////////////////////////////////////

QString qtios_read_file(const QString& path);

// ///////////////////////////////////////////////////////////////////
// qtiosWidget
// ///////////////////////////////////////////////////////////////////

class qtiosWidget : public QFrame
{
public:
     qtiosWidget(QWidget *parent = 0);
    ~qtiosWidget(void);
};

qtiosWidget::qtiosWidget(QWidget *parent) : QFrame(parent)
{
    QVBoxLayout *layout = new QVBoxLayout(this);
    layout->addWidget(new QPushButton("Click Me!", this));
    layout->addWidget(new QPushButton("Click Me!", this));
    layout->addWidget(new QPushButton("Click Me!", this));
    layout->addWidget(new QLineEdit("Edit Me!", this));
    layout->itemAt(3)->widget()->setAttribute(Qt::WA_MacShowFocusRect, false);
    layout->addStretch();

    this->setStyleSheet(qtios_read_file(":qtios/main.qss"));
    this->setWindowTitle("Qt iOS widgets stylesheets");
}

qtiosWidget::~qtiosWidget(void)
{

}

// ///////////////////////////////////////////////////////////////////

#if defined(Q_OS_IOS)
extern "C" int qtmn(int argc, char** argv) {
#else
int main(int argc, char **argv) {
#endif
    QApplication application(argc, argv);

    qtiosWidget widget;
    widget.winId();
    widget.show();
    widget.raise();

    return application.exec();
}

// ///////////////////////////////////////////////////////////////////
// Helper functions
// ///////////////////////////////////////////////////////////////////

QString qtios_read_file(const QString& path)
{
    QString contents;

    QFile file(path);
    if(file.open(QIODevice::ReadOnly)) {
      contents = file.readAll();
    }

    return contents;
}
