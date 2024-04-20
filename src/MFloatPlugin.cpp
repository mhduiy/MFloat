#include "MFloatPlugin.h"

MFloatPlugin::MFloatPlugin()
{
}
void MFloatPlugin::registerTypes(const char *uri)
{
    qmlRegisterType(QUrl("qrc:/qt/qml/MFloat/Controls/MButton.qml"), uri, 1, 0, "MButton");
    qmlRegisterType(QUrl("qrc:/qt/qml/MFloat/Controls/ColorConstants.qml"), uri, 1, 0, "ColorConstants");
}

void MFloatPlugin::initializeEngine(QQmlEngine *engine, const char *uri)
{

}
