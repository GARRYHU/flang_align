#
# Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
# See https://llvm.org/LICENSE.txt for license information.
# SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
#

########## Make rule for test qsel02  ########


qsel02: run
	

build:  $(SRC)/qsel02.f08
	-$(RM) qsel02.$(EXESUFFIX) core *.d *.mod FOR*.DAT FTN* ftn* fort.*
	@echo ------------------------------------ building test $@
	-$(CC) -c $(CFLAGS) $(SRC)/check.c -o check.$(OBJX)
	-$(FC) -c $(FFLAGS) $(LDFLAGS) $(SRC)/qsel02.f08 -o qsel02.$(OBJX)
	-$(FC) $(FFLAGS) $(LDFLAGS) qsel02.$(OBJX) check.$(OBJX) $(LIBS) -o qsel02.$(EXESUFFIX)


run:
	@echo ------------------------------------ executing test qsel02
	qsel02.$(EXESUFFIX)

verify: ;

qsel02.run: run

