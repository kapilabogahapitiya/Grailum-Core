#ifndef GRAILUM_QT_TEST_WALLETTESTS_H
#define GRAILUM_QT_TEST_WALLETTESTS_H

#include <QObject>
#include <QTest>

class WalletTests : public QObject
{
    Q_OBJECT

private Q_SLOTS:
    void walletTests();
};

#endif // GRAILUM_QT_TEST_WALLETTESTS_H
