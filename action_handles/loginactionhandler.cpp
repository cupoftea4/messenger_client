#include "loginactionhandler.h"

LoginActionHandler::LoginActionHandler()
{

}

bool LoginActionHandler::handle(QJsonObject json)
{
    auto status = json.take(FIELD_STATUS).toString();

    if (status == STATUS_SUCCESS) {
        auto username = json.take(FIELD_USERNAME);
        emit successfulLogin(username.toString());
        return true;
    }

    emit failedLogin();
    return false;
}