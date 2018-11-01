// Copyright (c) 2011-2014 The Bitcoin Core developers
// Distributed under the MIT software license, see the accompanying
// file COPYING or http://www.opensource.org/licenses/mit-license.php.

#ifndef GRAILUM_QT_GRAILUMADDRESSVALIDATOR_H
#define GRAILUM_QT_GRAILUMADDRESSVALIDATOR_H

#include <QValidator>

/** Base58 entry widget validator, checks for valid characters and
 * removes some whitespace.
 */
class GrailumAddressEntryValidator : public QValidator
{
    Q_OBJECT

public:
    explicit GrailumAddressEntryValidator(QObject *parent);

    State validate(QString &input, int &pos) const;
};

/** Grailum address widget validator, checks for a valid grailum address.
 */
class GrailumAddressCheckValidator : public QValidator
{
    Q_OBJECT

public:
    explicit GrailumAddressCheckValidator(QObject *parent);

    State validate(QString &input, int &pos) const;
};

#endif // GRAILUM_QT_GRAILUMADDRESSVALIDATOR_H
