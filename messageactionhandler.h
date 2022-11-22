#ifndef MESSAGEACTIONHANDLER_H
#define MESSAGEACTIONHANDLER_H

#include <QObject>
#include <QJsonObject>
#include "actionhandler.h"
#include "jsonconstants.h"

class MessageActionHandler : public ActionHandler
{
    Q_OBJECT
public:
    MessageActionHandler();
    bool handler(QJsonObject json) override;
signals:
    void messageReceived(QString sender, QString msg);
};

#endif // MESSAGEACTIONHANDLER_H
