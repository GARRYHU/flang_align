#
# Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
# See https://llvm.org/LICENSE.txt for license information.
# SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
#


########## Make rule for test oop102  ########

fcheck.o check_mod.mod: $(SRC)/check_mod.F90
	-$(FC) -c $(FFLAGS) $(SRC)/check_mod.F90 -o fcheck.o

oop102.o:  $(SRC)/oop102.f90 check_mod.mod
	@echo ------------------------------------ building test $@
	-$(FC) -Hx,68,0x80 -c $(FFLAGS) $(LDFLAGS) $(SRC)/oop102.f90 -o oop102.o

oop102: oop102.o fcheck.o
	-$(FC) $(FFLAGS) $(LDFLAGS) oop102.o fcheck.o $(LIBS) -o oop102

oop102.run: oop102
	@echo ------------------------------------ executing test oop102
	oop102
	-$(RM) my_mod.mod

### TA Expected Targets ###

build: $(TEST)

.PHONY: run
run: $(TEST).run

verify: ; 

### End of Expected Targets ###
