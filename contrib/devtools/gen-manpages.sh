#!/usr/bin/env bash

export LC_ALL=C
TOPDIR=${TOPDIR:-$(git rev-parse --show-toplevel)}
BUILDDIR=${BUILDDIR:-$TOPDIR}

BINDIR=${BINDIR:-$BUILDDIR/src}
MANDIR=${MANDIR:-$TOPDIR/doc/man}

GRAILUMD=${GRAILUMD:-$BINDIR/grailumd}
GRAILUMCLI=${GRAILUMCLI:-$BINDIR/grailum-cli}
GRAILUMTX=${GRAILUMTX:-$BINDIR/grailum-tx}
GRAILUMQT=${GRAILUMQT:-$BINDIR/qt/grailum-qt}

[ ! -x $GRAILUMD ] && echo "$GRAILUMD not found or not executable." && exit 1

# The autodetected version git tag can screw up manpage output a little bit
GXMVER=($($GRAILUMCLI --version | head -n1 | awk -F'[ -]' '{ print $6, $7 }'))

# Create a footer file with copyright content.
# This gets autodetected fine for grailumd if --version-string is not set,
# but has different outcomes for grailum-qt and grailum-cli.
echo "[COPYRIGHT]" > footer.h2m
$GRAILUMD --version | sed -n '1!p' >> footer.h2m

for cmd in $GRAILUMD $GRAILUMCLI $GRAILUMTX $GRAILUMQT; do
  cmdname="${cmd##*/}"
  help2man -N --version-string=${GXMVER[0]} --include=footer.h2m -o ${MANDIR}/${cmdname}.1 ${cmd}
  sed -i "s/\\\-${GXMVER[1]}//g" ${MANDIR}/${cmdname}.1
done

rm -f footer.h2m
