QT += quick
QT += quickcontrols2

# You can make your code fail to compile if it uses deprecated APIs.
# In order to do so, uncomment the following line.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

SOURCES += \
        communication.cpp \
        main.cpp \
        signalsconnector.cpp \
        socketclient.cpp

RESOURCES += \
        $$files(qml/*)

LIBS += -lws2_32

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH = qml/imports

# Additional import path used to resolve QML modules just for Qt Quick Designer
QML_DESIGNER_IMPORT_PATH = qml/content

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

DISTFILES += \
    qtquickcontrols2.conf

HEADERS += \
    communication.h \
    signalsconnector.h \
    socketclient.h
