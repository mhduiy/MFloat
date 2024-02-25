#ifndef MFLOATPUGIN
#define MFLOATPUGIN

#include <QQmlEngine>
#include <QQmlExtensionPlugin>

class MFloatPlugin : public QQmlExtensionPlugin
{
    Q_PLUGIN_METADATA(IID QQmlExtensionInterface_iid)
public:
    MFloatPlugin();
    void registerTypes(const char *uri) Q_DECL_OVERRIDE;
    void initializeEngine(QQmlEngine *engine, const char *uri) Q_DECL_OVERRIDE;
};

#endif // MFLOATPUGIN
