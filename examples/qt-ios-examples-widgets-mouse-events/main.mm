/* main.mm ---
 *
 * Author: Julien Wintz
 * Created: Thu Mar  7 21:59:40 2013 (+0100)
 * Version:
 * Last-Updated:
 *           By:
 *     Update #: 69
 */

/* Change Log:
 *
 */

#include <QtCore>
#include <QtGui>
#include <QtWidgets>

// ///////////////////////////////////////////////////////////////////
// qtiosWidget
// ///////////////////////////////////////////////////////////////////

class qtiosWidget : public QWidget
{
public:
     qtiosWidget(QWidget *parent = 0);
    ~qtiosWidget(void);

protected:
    void mouseMoveEvent(QMouseEvent *event);
    void mousePressEvent(QMouseEvent *event);
    void mouseReleaseEvent(QMouseEvent *event);

private:
    QPlainTextEdit *log;
};

qtiosWidget::qtiosWidget(QWidget *parent) : QWidget(parent)
{
    QLabel *label = new QLabel("Click Me!", this);
    label->setAlignment(Qt::AlignCenter);
    label->setFont(QFont("Menlo", 24));
    label->setMinimumHeight(50);

    this->log = new QPlainTextEdit(this);
    this->log->setAttribute(Qt::WA_MacShowFocusRect, false);
    this->log->setFont(QFont("Monaco", 11));
    this->log->setFrameShape(QFrame::NoFrame);
    this->log->setReadOnly(true);

    QVBoxLayout *layout = new QVBoxLayout(this);
    layout->setContentsMargins(0, 0, 0, 0);
    layout->addWidget(label);
    layout->addWidget(this->log);

    this->setWindowTitle("Qt iOS widgets mouse events");
}

qtiosWidget::~qtiosWidget(void)
{

}

void qtiosWidget::mouseMoveEvent(QMouseEvent *event)
{
    int x = event->pos().x();
    int y = event->pos().y();

    this->log->appendPlainText(QString("mouse    move: (%1,%2)").arg(x).arg(y));
}

void qtiosWidget::mousePressEvent(QMouseEvent *event)
{
    int x = event->pos().x();
    int y = event->pos().y();

    this->log->appendPlainText(QString("mouse   press: (%1,%2)").arg(x).arg(y));
}

void qtiosWidget::mouseReleaseEvent(QMouseEvent *event)
{
    int x = event->pos().x();
    int y = event->pos().y();

    this->log->appendPlainText(QString("mouse release: (%1,%2)").arg(x).arg(y));
}

// ///////////////////////////////////////////////////////////////////

int main(int argc, char **argv)
{
    QApplication application(argc, argv);

    qtiosWidget widget;
    widget.winId();
    widget.show();
    widget.raise();

    return application.exec();
}
