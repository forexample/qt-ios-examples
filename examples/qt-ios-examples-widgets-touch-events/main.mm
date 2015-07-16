/* main.mm ---
 *
 * Author: Julien Wintz
 * Created: Thu Mar  7 21:59:40 2013 (+0100)
 * Version:
 * Last-Updated:
 *           By:
 *     Update #: 155
 */

/* Change Log:
 *
 */

#include <QtCore>
#include <QtGui>
#include <QtWidgets>

#if defined(Q_OS_MAC) && !defined(Q_OS_IOS)
#import <Cocoa/Cocoa.h>
#endif

// ///////////////////////////////////////////////////////////////////
// qtiosWidget
// ///////////////////////////////////////////////////////////////////

class qtiosWidget : public QWidget
{
public:
     qtiosWidget(QWidget *parent = 0);
    ~qtiosWidget(void);

protected:
    bool event(QEvent *event);

private:
    QPlainTextEdit *log;
};

qtiosWidget::qtiosWidget(QWidget *parent) : QWidget(parent)
{
    QLabel *label = new QLabel("Touch Me!", this);
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

#if defined(Q_OS_MAC) && !defined(Q_OS_IOS)
    [reinterpret_cast<NSView *>(this->winId()) setAcceptsTouchEvents: YES];
#endif

    this->setAttribute(Qt::WA_AcceptTouchEvents, true);
    this->setWindowTitle("Qt iOS widgets touch events");
}

qtiosWidget::~qtiosWidget(void)
{

}

bool qtiosWidget::event(QEvent *event)
{
    if (event->type() == QEvent::TouchBegin) {
  event->accept();
  this->log->appendPlainText(QString("touch  begin: %1 point(s)").arg(static_cast<QTouchEvent *>(event)->touchPoints().count()));
  return true;
    }

    if (event->type() == QEvent::TouchUpdate) {

  int x = static_cast<QTouchEvent *>(event)->touchPoints().first().pos().x();
  int y = static_cast<QTouchEvent *>(event)->touchPoints().first().pos().y();

  this->log->appendPlainText(QString("touch update: %1 point(s) - (%2,%3)").arg(static_cast<QTouchEvent *>(event)->touchPoints().count()).arg(x).arg(y));
  return true;
    }

    if (event->type() == QEvent::TouchEnd) {
  this->log->appendPlainText(QString("touch    end: %1 point(s)").arg(static_cast<QTouchEvent *>(event)->touchPoints().count()));
  return true;
    }

    return QWidget::event(event);
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
