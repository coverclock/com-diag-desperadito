# Copyright 2014 Digital Aggregates Corporation, Colorado, USA
# Licensed under the terms in README.h
# Chip Overclock
# mailto:coverclock@diag.com
# http://www.diag.com/navigation/downloads/Desperadito.html
#
# Desperadito is a mashup of code from the Digital Aggregates projects
# Desperado and Hayloft with the build system from Diminuto. Why? Because
# it's darn useful. Unfortunately, Desperado, Hayloft, and Diminuto each have
# very different unit test frameworks; I have not made any attempt to reconcile
# them in Desperadito.

PROJECT				=	desperadito
TITLE				=	Desperadito
SYMBOL				=	DESPERADITO

########## Customizations

TARGET				=	host
#TARGET				=	cobbler
#TARGET				=	stampede

MAJOR				=	8# API changes requiring that applications be modified.
MINOR				=	3# Only functionality or features added with no legacy API changes.
BUILD				=	0# Only bugs fixed with no API changes or new functionality.

# Some certification, defense, or intelligence agencies (e.g. the U.S. Federal
# Aviation Administration or FAA) require that software builds for safety
# critical or national security applications generate exactly the same binary
# images bit for bit if the source code has not changed. (This is theoretically
# a more stringent requirement than requiring that checksums or cryptographic
# hashes are the same, although in practice it is the same thing.) This allows
# agency inspectors to verify the integrity of the binary software images. This
# makes embedding timestamps inside compiled translation units problematic.
# If your application has this requirement, you can pass in any fixed string
# for the value of the VINTAGE make variable and you should be able to generate
# identical images with subsequent builds of Diminuto. This string is embedded
# inside the Diminuto vintage application.
VINTAGE				:=	$(shell date -u +%Y-%m-%dT%H:%M:%S.%N%z)

# This stuff all gets embedded in the vintage application.
COPYRIGHT			=	2005-2016 Digital Aggregates Corporation, Colorado, USA.
LICENSE				=	GNU Lesser General Public License 2.1
CONTACT				=	coverclock@diag.com
HOMEPAGE			=	http://www.diag.com/navigation/downloads/$(TITLE).html

# This is where I store collateral associated with projects that I have
# downloaded off the web and use without alteration. Examples: Linux kernel
# sources, toolchains, etc.
HOME_DIR			=	$(HOME)/projects

########## Directory Tree

ARC_DIR				=	arc# Archive files
BIN_DIR				=	bin# Stripped executable binaries
DOC_DIR				=	doc# Documentation
ETC_DIR				=	etc# Miscellaneous files
GEN_DIR				=	gen# Generated files
GOT_DIR				=	got# Google Test files
INC_DIR				=	inc# Header files
LIB_DIR				=	lib# Shared objects
OUT_DIR				=	out# Build artifacts
SRC_DIR				=	src# Library source files
SYM_DIR				=	sym# Unstripped executable binaries
SYS_DIR				=	sys# Kernel module build directory
TMP_DIR				=	tmp# Temporary files
TST_DIR				=	tst# Unit tests
UTF_DIR				=	utf# Unit test functions

########## Configurations

ifeq ($(TARGET),cobbler)# Build for the Raspberry Pi version B with the Raspbian system.
ARCH				=	arm
PLATFORM			=	linux
PLATFORM_CLASS		=	Linux
CPPARCH				=
CARCH				=	
#LDARCH				=	-static -L$(OUT)/$(ARC_DIR)
LDARCH				=	-Bdynamic -L$(OUT)/$(LIB_DIR)
TOOLCHAIN			=	$(ARCH)-$(PLATFORM)-gnueabihf
CROSS_COMPILE		=	$(TOOLCHAIN)-
KERNEL_REV			=	rpi-3.6.y
KERNEL_DIR			=	$(HOME_DIR)/cobbler/linux-$(KERNEL_REV)
INCLUDE_DIR			=	$(HOME_DIR)/cobbler/include-$(KERNEL_REV)/include
endif

ifeq ($(TARGET),uclibc)# Build for the Raspberry Pi with uClibc.
ARCH				=	arm
PLATFORM			=	linux
PLATFORM_CLASS		=	Linux
CPPARCH				=
CARCH				=	
#LDARCH				=	-static -L$(OUT)/$(ARC_DIR)
LDARCH				=	-Bdynamic -L$(OUT)/$(LIB_DIR)
TOOLCHAIN			=	$(ARCH)-buildroot-$(PLATFORM)-uclibcgnueabihf
CROSS_COMPILE		=	$(TOOLCHAIN)-
KERNEL_REV			=	rpi-3.6.y
KERNEL_DIR			=	$(HOME_DIR)/cobbler/linux-$(KERNEL_REV)
INCLUDE_DIR			=	$(HOME_DIR)/cobbler/include-$(KERNEL_REV)/include
endif

ifeq ($(TARGET),stampede)# Build for the Nvidia Jetson TK1 with Ubuntu 14.04.
ARCH				=	arm
PLATFORM			=	linux
PLATFORM_CLASS		=	Linux
CPPARCH				=
#CARCH				=
CARCH				=	-rdynamic -fno-omit-frame-pointer -funwind-tables
#LDARCH				=	-static -L$(OUT)/$(ARC_DIR)
LDARCH				=	-Bdynamic -L$(OUT)/$(LIB_DIR)
TOOLCHAIN			=	$(ARCH)-$(PLATFORM)-gnueabihf
CROSS_COMPILE		=	$(TOOLCHAIN)-
KERNEL_REV			=	3.10.24-jetson
KERNEL_DIR			=	$(HOME_DIR)/stampede/linux-$(KERNEL_REV)-jetson
INCLUDE_DIR			=	$(HOME_DIR)/stampede/linux-headers-$(KERNEL_REV)-jetson/include
endif

ifeq ($(TARGET),host0)# Build for an Intel build server with Ubuntu 12.04.
ARCH				=	i386
PLATFORM			=	linux
PLATFORM_CLASS		=	Linux
CPPARCH				=
CARCH				=
LDARCH				=	-L$(OUT)/$(LIB_DIR)
TOOLCHAIN			=
CROSS_COMPILE		=
KERNEL_REV			=	3.2.0-51
KERNEL_DIR			=	/usr/src/linux-headers-$(KERNEL_REV)-generic-pae
INCLUDE_DIR			=	/usr/include
endif

ifeq ($(TARGET),host)# Build for an Intel build server with Ubuntu 14.04.
ARCH				=	i386
PLATFORM			=	linux
PLATFORM_CLASS		=	Linux
CPPARCH				=
CARCH				=	-rdynamic
LDARCH				=	-L$(OUT)/$(LIB_DIR)
TOOLCHAIN			=
CROSS_COMPILE		=
KERNEL_REV			=	3.13.0-24
KERNEL_DIR			=	/usr/src/linux-headers-$(KERNEL_REV)
INCLUDE_DIR			=	/usr/include
endif

########## Variables

HERE				:=	$(shell pwd)

OUT					=	$(OUT_DIR)/$(TARGET)

TEMP_DIR			=	/var/tmp
ROOT_DIR			=	$(HOME_DIR)/$(PROJECT)

TIMESTAMP			=	$(shell date -u +%Y%m%d%H%M%S%N%Z)
DATESTAMP			=	$(shell date +%Y%m%d)
SVNREPO				=	svn://graphite/$(PROJECT)
SVNURL				=	$(SVNREPO)/trunk/$(TITLE)
GITURL				=	https://github.com/coverclock/com-diag-$(PROJECT).git

PROJECT_A			=	lib$(PROJECT).a
PROJECTXX_A			=	lib$(PROJECT)xx.a
PROJECTUT_A			=	lib$(PROJECT)ut.a
PROJECT_SO			=	lib$(PROJECT).so
PROJECTXX_SO		=	lib$(PROJECT)xx.so
PROJECTUT_SO		=	lib$(PROJECT)ut.so

PROJECT_LIB			=	$(PROJECT_SO).$(MAJOR).$(MINOR).$(BUILD)
PROJECTXX_LIB		=	$(PROJECTXX_SO).$(MAJOR).$(MINOR).$(BUILD)

UTILITIES			=	
GENERATED			=	vintage setup
ALIASES				=	

TARGETOBJECTS		=	$(addprefix $(OUT)/,$(addsuffix .o,$(basename $(wildcard $(SRC_DIR)/*.c))))
TARGETOBJECTSXX		=	$(addprefix $(OUT)/,$(addsuffix .o,$(basename $(wildcard $(SRC_DIR)/*.cpp))))
TARGETOBJECTSUT		=	$(addprefix $(OUT)/,$(addsuffix .o,$(basename $(wildcard $(UTF_DIR)/*.c))))
TARGETOBJECTSUTXX	+=	$(addprefix $(OUT)/,$(addsuffix .o,$(basename $(wildcard $(UTF_DIR)/*.cpp))))
TARGETSCRIPTS		=	$(addprefix $(OUT)/,$(basename $(wildcard $(BIN_DIR)/*.sh)))
TARGETBINARIES		=	$(addprefix $(OUT)/,$(basename $(wildcard $(BIN_DIR)/*.c)))
TARGETBINARIES		+=	$(addprefix $(OUT)/,$(basename $(wildcard $(BIN_DIR)/*.cpp)))
TARGETGENERATED		=	$(addprefix $(OUT)/$(BIN_DIR)/,$(GENERATED))
TARGETALIASES		=	$(addprefix $(OUT)/$(BIN_DIR)/,$(ALIASES))
TARGETUNITTESTS		=	$(addprefix $(OUT)/,$(basename $(wildcard $(TST_DIR)/*.c)))
TARGETUNITTESTS		+=	$(addprefix $(OUT)/,$(basename $(wildcard $(TST_DIR)/*.cpp)))
TARGETUNITTESTS		+=	$(addprefix $(OUT)/,$(basename $(wildcard $(TST_DIR)/*.sh)))
TARGETUTFUNCTIONS	=	$(addprefix $(OUT)/,$(basename $(wildcard $(UTF_DIR)/*.c)))
TARGETUTFUNCTIONS	+=	$(addprefix $(OUT)/,$(basename $(wildcard $(UTF_DIR)/*.cpp)))

TARGETARCHIVE		=	$(OUT)/$(ARC_DIR)/$(PROJECT_A)
TARGETARCHIVEXX		=	$(OUT)/$(ARC_DIR)/$(PROJECTXX_A)
TARGETARCHIVEUT		=	$(OUT)/$(ARC_DIR)/$(PROJECTUT_A)
TARGETSHARED		=	$(OUT)/$(LIB_DIR)/$(PROJECT_SO).$(MAJOR).$(MINOR).$(BUILD)
TARGETSHARED		+=	$(OUT)/$(LIB_DIR)/$(PROJECT_SO).$(MAJOR).$(MINOR)
TARGETSHARED		+=	$(OUT)/$(LIB_DIR)/$(PROJECT_SO).$(MAJOR)
TARGETSHARED		+=	$(OUT)/$(LIB_DIR)/$(PROJECT_SO)
TARGETSHAREDXX		=	$(OUT)/$(LIB_DIR)/$(PROJECTXX_SO).$(MAJOR).$(MINOR).$(BUILD)
TARGETSHAREDXX		+=	$(OUT)/$(LIB_DIR)/$(PROJECTXX_SO).$(MAJOR).$(MINOR)
TARGETSHAREDXX		+=	$(OUT)/$(LIB_DIR)/$(PROJECTXX_SO).$(MAJOR)
TARGETSHAREDXX		+=	$(OUT)/$(LIB_DIR)/$(PROJECTXX_SO)
TARGETSHAREDUT		=	$(OUT)/$(LIB_DIR)/$(PROJECTUT_SO).$(MAJOR).$(MINOR).$(BUILD)
TARGETSHAREDUT		+=	$(OUT)/$(LIB_DIR)/$(PROJECTUT_SO).$(MAJOR).$(MINOR)
TARGETSHAREDUT		+=	$(OUT)/$(LIB_DIR)/$(PROJECTUT_SO).$(MAJOR)
TARGETSHAREDUT		+=	$(OUT)/$(LIB_DIR)/$(PROJECTUT_SO)

TARGETLIBRARIES		=	$(TARGETARCHIVE) $(TARGETSHARED)
TARGETLIBRARIESXX	=	$(TARGETARCHIVEXX) $(TARGETSHAREDXX) $(TARGETSHAREDUT)
TARGETPROGRAMS		=	$(TARGETBINARIES) $(TARGETALIASES) $(TARGETUNITTESTS) $(TARGETGENERATED) $(TARGETSCRIPTS)
TARGETDEFAULT		=	$(TARGETLIBRARIES) $(TARGETLIBRARIESXX) $(TARGETMODULES) $(TARGETPROGRAMS)
TARGETPACKAGE		=	$(TARGETDEFAULT) $(TARGETDRIVERS)

PACKAGEMANIFEST		=	./$(TITLE)/$(OUT)/$(BIN_DIR) ./$(TITLE)/$(OUT)/$(LIB_DIR) ./$(TITLE)/$(OUT)/$(TST_DIR)

BUILDARTIFACTS		=	doxygen-local.cf dependencies.mk

COMMAND				=	dummy
SCRIPT				=	dummy

CC					=	$(CROSS_COMPILE)gcc
CXX					=	$(CROSS_COMPILE)g++
AR					=	$(CROSS_COMPILE)ar
RANLIB				=	$(CROSS_COMPILE)ranlib
STRIP				=	$(CROSS_COMPILE)strip

CDEFINES			=	-DCOM_DIAG_$(SYMBOL)_VINTAGE=\"$(VINTAGE)\" \
						-DDESPERADO_TARGET_IS_$(TARGET) \
						-DDESPERADO_TARGET_NAME="\"$(TARGET)\"" \
						-DDESPERADO_PLATFORM_IS_$(PLATFORM_CLASS) \
						-DDESPERADO_PLATFORM_NAME="\"$(PLATFORM_CLASS)\""  \
						-DDESPERADO_PLATFORM_CLASS=$(PLATFORM_CLASS) \
						-DDESPERADO_HAS_SYSLOG \
						-D_REENTRANT \
						-D_GNU_SOURCE

ARFLAGS				=	rcv
CPPFLAGS			=	$(CPPARCH) -iquote $(SRC_DIR) -iquote $(INC_DIR) -isystem $(INCLUDE_DIR) $(CDEFINES)
CXXFLAGS			=	$(CARCH) -fPIC -g
CFLAGS				=	$(CARCH) -fPIC -g
#CXXFLAGS			=	$(CARCH) -fPIC -O3
#CFLAGS				=	$(CARCH) -fPIC -O3
CPFLAGS				=	-i
MVFLAGS				=	-i
LDFLAGS				=	$(LDARCH) -l$(PROJECT)ut -l$(PROJECT) -lpthread -lrt -ldl
LDXXFLAGS			=	$(LDARCH) -l$(PROJECT)ut -l$(PROJECT)xx -l$(PROJECT) -lpthread -lrt -ldl

BROWSER				=	firefox

########## Main Entry Points

.PHONY:	default all dist clean pristine

default:	$(TARGETDEFAULT)

all:	$(UTILITIES) $(TARGETPACKAGE)

dist:	distribution

clean:
	rm -rf $(OUT) $(UTILITIES) $(BUILDARTIFACTS)
	rm -rf $(DOC_DIR)

pristine:	clean
	rm -rf $(OUT_DIR)

########## Distribution

.PHONY:	distribution

distribution:
	rm -rf $(TEMP_DIR)/$(PROJECT)-$(MAJOR).$(MINOR).$(BUILD)
	svn export $(SVNURL) $(TEMP_DIR)/$(PROJECT)-$(MAJOR).$(MINOR).$(BUILD)
	( cd $(TEMP_DIR); tar cvzf - $(PROJECT)-$(MAJOR).$(MINOR).$(BUILD) ) > $(TEMP_DIR)/$(PROJECT)-$(MAJOR).$(MINOR).$(BUILD).tgz
	( cd $(TEMP_DIR)/$(PROJECT)-$(MAJOR).$(MINOR).$(BUILD); make TARGET=host; ./out/host/bin/vintage )

.PHONY:	package

package $(PROJECT)-$(TARGET).tgz:
	tar -C .. -cvzf - $(PACKAGEMANIFEST) > $(PROJECT)-$(TARGET).tgz

.PHONY: commit dcommit push init

commit:
	git commit .

dcommit:
	git svn dcommit

push:
	git push origin master

init:
	git svn show-ignore > .gitignore
	git add .gitignore
	git remote add origin $(GITURL)

########## Target C Libraries

$(OUT)/$(ARC_DIR)/lib$(PROJECT).a:	$(TARGETOBJECTS)
	D=`dirname $@`; test -d $$D || mkdir -p $$D
	$(AR) $(ARFLAGS) $@ $^
	$(RANLIB) $@

$(OUT)/$(LIB_DIR)/lib$(PROJECT).so.$(MAJOR).$(MINOR).$(BUILD):	$(OUT)/$(ARC_DIR)/lib$(PROJECT).a
	D=`dirname $@`; test -d $$D || mkdir -p $$D
	$(CC) $(CARCH) -shared -Wl,-soname,lib$(PROJECT).so.$(MAJOR).$(MINOR).$(BUILD) -o $@ -Wl,--whole-archive $< -Wl,--no-whole-archive

$(OUT)/$(LIB_DIR)/lib$(PROJECT).so:	$(OUT)/$(LIB_DIR)/lib$(PROJECT).so.$(MAJOR).$(MINOR).$(BUILD)
	D=`dirname $<`; F=`basename $<`; T=`basename $@`; ( cd $$D; ln -s -f $$F $$T ) 

$(OUT)/$(LIB_DIR)/lib$(PROJECT).so.$(MAJOR):	$(OUT)/$(LIB_DIR)/lib$(PROJECT).so.$(MAJOR).$(MINOR).$(BUILD)
	D=`dirname $<`; F=`basename $<`; T=`basename $@`; ( cd $$D; ln -s -f $$F $$T ) 

$(OUT)/$(LIB_DIR)/lib$(PROJECT).so.$(MAJOR).$(MINOR):	$(OUT)/$(LIB_DIR)/lib$(PROJECT).so.$(MAJOR).$(MINOR).$(BUILD)
	D=`dirname $<`; F=`basename $<`; T=`basename $@`; ( cd $$D; ln -s -f $$F $$T ) 
	
########## Target C++ Libraries

$(OUT)/$(ARC_DIR)/lib$(PROJECT)xx.a:	$(TARGETOBJECTSXX)
	D=`dirname $@`; test -d $$D || mkdir -p $$D
	$(AR) $(ARFLAGS) $@ $^
	$(RANLIB) $@

$(OUT)/$(LIB_DIR)/lib$(PROJECT)xx.so.$(MAJOR).$(MINOR).$(BUILD):	$(OUT)/$(ARC_DIR)/lib$(PROJECT)xx.a
	D=`dirname $@`; test -d $$D || mkdir -p $$D
	$(CC) $(CARCH) -shared -Wl,-soname,lib$(PROJECT)xx.so.$(MAJOR).$(MINOR).$(BUILD) -o $@ -Wl,--whole-archive $< -Wl,--no-whole-archive

$(OUT)/$(LIB_DIR)/lib$(PROJECT)xx.so:	$(OUT)/$(LIB_DIR)/lib$(PROJECT)xx.so.$(MAJOR).$(MINOR).$(BUILD)
	D=`dirname $<`; F=`basename $<`; T=`basename $@`; ( cd $$D; ln -s -f $$F $$T ) 

$(OUT)/$(LIB_DIR)/lib$(PROJECT)xx.so.$(MAJOR):	$(OUT)/$(LIB_DIR)/lib$(PROJECT)xx.so.$(MAJOR).$(MINOR).$(BUILD)
	D=`dirname $<`; F=`basename $<`; T=`basename $@`; ( cd $$D; ln -s -f $$F $$T ) 

$(OUT)/$(LIB_DIR)/lib$(PROJECT)xx.so.$(MAJOR).$(MINOR):	$(OUT)/$(LIB_DIR)/lib$(PROJECT)xx.so.$(MAJOR).$(MINOR).$(BUILD)
	D=`dirname $<`; F=`basename $<`; T=`basename $@`; ( cd $$D; ln -s -f $$F $$T ) 
	
########## Target Unit Test Libraries

$(OUT)/$(ARC_DIR)/lib$(PROJECT)ut.a:	$(TARGETOBJECTSUT) $(TARGETOBJECTSUTXX)
	D=`dirname $@`; test -d $$D || mkdir -p $$D
	$(AR) $(ARFLAGS) $@ $^
	$(RANLIB) $@

$(OUT)/$(LIB_DIR)/lib$(PROJECT)ut.so.$(MAJOR).$(MINOR).$(BUILD):	$(OUT)/$(ARC_DIR)/lib$(PROJECT)ut.a
	D=`dirname $@`; test -d $$D || mkdir -p $$D
	$(CC) $(CARCH) -shared -Wl,-soname,lib$(PROJECT)ut.so.$(MAJOR).$(MINOR).$(BUILD) -o $@ -Wl,--whole-archive $< -Wl,--no-whole-archive

$(OUT)/$(LIB_DIR)/lib$(PROJECT)ut.so:	$(OUT)/$(LIB_DIR)/lib$(PROJECT)ut.so.$(MAJOR).$(MINOR).$(BUILD)
	D=`dirname $<`; F=`basename $<`; T=`basename $@`; ( cd $$D; ln -s -f $$F $$T ) 

$(OUT)/$(LIB_DIR)/lib$(PROJECT)ut.so.$(MAJOR):	$(OUT)/$(LIB_DIR)/lib$(PROJECT)ut.so.$(MAJOR).$(MINOR).$(BUILD)
	D=`dirname $<`; F=`basename $<`; T=`basename $@`; ( cd $$D; ln -s -f $$F $$T ) 

$(OUT)/$(LIB_DIR)/lib$(PROJECT)ut.so.$(MAJOR).$(MINOR):	$(OUT)/$(LIB_DIR)/lib$(PROJECT)ut.so.$(MAJOR).$(MINOR).$(BUILD)
	D=`dirname $<`; F=`basename $<`; T=`basename $@`; ( cd $$D; ln -s -f $$F $$T ) 

########## Target Unstripped Binaries

$(OUT)/$(SYM_DIR)/%:	$(BIN_DIR)/%.c $(TARGETLIBRARIES)
	D=`dirname $@`; test -d $$D || mkdir -p $$D
	$(CC) $(CPPFLAGS) -I $(KERNEL_DIR)/include $(CFLAGS) -o $@ $< $(LDFLAGS)

$(OUT)/$(SYM_DIR)/%:	$(BIN_DIR)/%.cpp $(TARGETLIBRARIESXX) $(TARGETLIBRARIES)
	D=`dirname $@`; test -d $$D || mkdir -p $$D
	$(CXX) $(CPPFLAGS) -I $(KERNEL_DIR)/include $(CXXFLAGS) -o $@ $< $(LDXXFLAGS)

########## Target Aliases

$(OUT)/$(BIN_DIR)/hex $(OUT)/$(BIN_DIR)/oct $(OUT)/$(BIN_DIR)/ntohs $(OUT)/$(BIN_DIR)/htons $(OUT)/$(BIN_DIR)/ntohl $(OUT)/$(BIN_DIR)/htonl:	$(OUT)/$(BIN_DIR)/dec
	ln -f $< $@
	
########## Unit Tests

$(OUT)/$(TST_DIR)/%:	$(TST_DIR)/%.c $(TARGETLIBRARIES)
	D=`dirname $@`; test -d $$D || mkdir -p $$D	
	$(CC) -rdynamic $(CPPFLAGS) $(CFLAGS) -o $@ $< $(LDFLAGS)
	
$(OUT)/$(TST_DIR)/%:	$(TST_DIR)/%.cpp $(TARGETLIBRARIESXX) $(TARGETLIBRARIES)
	D=`dirname $@`; test -d $$D || mkdir -p $$D	
	$(CXX) -rdynamic $(CPPFLAGS) $(CXXFLAGS) -o $@ $< $(LDXXFLAGS)
	
########## Google Tests

GTEST_DIR=$(HOME)/src/gtest-1.7.0#http://googletest.googlecode.com/files/gtest-1.7.0.zip

GTEST_LIB=$(GTEST_DIR)/libgtest.a
GTEST_INC=$(GTEST_DIR)/include

GTEST_INCS=-I$(GTEST_INC)
GTEST_LIBS=$(GTEST_LIB)

.PHONY:	unittest

unittest:	$(OUT_DIR)/host/$(TST_DIR)/unittest

$(OUT_DIR)/host/$(TST_DIR)/unittest:	$(GOT_DIR)/unittest.cpp
	D=`dirname $@`; test -d $$D || mkdir -p $$D	
	g++ $(CPPFLAGS) $(CXXFLAGS) $(GTEST_INCS) -I$(GOT_DIR) -o $@ $^ $(GTEST_LIBS) $(LDXXFLAGS)

########## Generated

.PHONY:	$(OUT)/$(GEN_DIR)/vintage.c $(INC_DIR)/com/diag/$(PROJECT)/$(PROJECT)_release.h $(INC_DIR)/com/diag/$(PROJECT)/$(PROJECT)_vintage.h

# For embedding in a system where it can be executed from a shell.
# The major.minor.build is emitted to standard output, a bunch more
# metadata to standard error. Hence, they can be redirected to separate
# files. The metadata file is intended to parsable as a standard properties
# file (although I have not tried it).
$(OUT)/$(GEN_DIR)/vintage.c:	$(INC_DIR)/com/diag/$(PROJECT)/$(PROJECT)_release.h $(INC_DIR)/com/diag/$(PROJECT)/$(PROJECT)_vintage.h Makefile
	D=`dirname $@`; test -d $$D || mkdir -p $$D	
	echo '/* GENERATED FILE! DO NOT EDIT! */' > $@
	echo '#include "com/diag/$(PROJECT)/$(PROJECT)_release.h"' >> $@
	echo '#include "com/diag/$(PROJECT)/$(PROJECT)_release.h"' >> $@
	echo '#include "com/diag/$(PROJECT)/$(PROJECT)_vintage.h"' >> $@
	echo '#include "com/diag/$(PROJECT)/$(PROJECT)_vintage.h"' >> $@
	echo '#include <stdio.h>' >> $@
	echo 'static const char METADATA[] =' >> $@
	echo "\"Title = $(TITLE)\\\\n\"" >> $@
	echo "\"Copyright = $(COPYRIGHT)\\\\n\"" >> $@
	echo "\"Contact = $(CONTACT)\\\\n\"" >> $@
	echo "\"License = $(LICENSE)\\\\n\"" >> $@
	echo "\"Homepage = $(HOMEPAGE)\\\\n\"" >> $@
	echo "\"Release = $(MAJOR).$(MINOR).$(BUILD)\\\\n\"" >> $@
	echo "\"Vintage = $(VINTAGE)\\\\n\"" >> $@
	echo "\"Host = $(shell hostname)\\\\n\"" >> $@
	echo "\"Directory = $(shell pwd)\\\\n\"" >> $@
	echo "\"Arch = $(ARCH)\\\\n\"" >> $@
	echo "\"Target = $(TARGET)\\\\n\"" >> $@
	echo "\"Platform = $(PLATFORM)\\\\n\"" >> $@
	echo "\"Toolchain = $(TOOLCHAIN)\\\\n\"" >> $@
	echo ';' >> $@
	echo 'int main(void) { fputs(METADATA, stderr); fputs("$(MAJOR).$(MINOR).$(BUILD)\\n", stdout); return 0; }' >> $@

# For embedding in an application where it can be interrogated or displayed.
$(INC_DIR)/com/diag/$(PROJECT)/$(PROJECT)_release.h:
	D=`dirname $@`; test -d $$D || mkdir -p $$D	
	echo '/* GENERATED FILE! DO NOT EDIT! */' > $@
	echo '#ifndef _H_COM_DIAG_$(SYMBOL)_RELEASE_' >> $@
	echo '#define _H_COM_DIAG_$(SYMBOL)_RELEASE_' >> $@
	echo "static const char RELEASE[] = \"RELEASE=$(MAJOR).$(MINOR).$(BUILD)\";" >> $@
	echo '#endif' >> $@

# For embedding in an application where it can be interrogated or displayed.
$(INC_DIR)/com/diag/$(PROJECT)/$(PROJECT)_vintage.h:
	D=`dirname $@`; test -d $$D || mkdir -p $$D	
	echo '/* GENERATED FILE! DO NOT EDIT! */' > $@
	echo '#ifndef _H_COM_DIAG_$(SYMBOL)_VINTAGE_' >> $@
	echo '#define _H_COM_DIAG_$(SYMBOL)_VINTAGE_' >> $@
	echo "static const char VINTAGE[] = \"VINTAGE=$(VINTAGE)\";" >> $@
	echo '#endif' >> $@

$(OUT)/$(SYM_DIR)/vintage:	$(OUT)/$(GEN_DIR)/vintage.c
	D=`dirname $@`; test -d $$D || mkdir -p $$D	
	$(CC) $(CPPFLAGS) $(CFLAGS) -o $@ $< $(LDFLAGS)

# For sourcing into a bash shell (for example, ". setup").
$(OUT)/$(BIN_DIR)/setup:	Makefile
	D=`dirname $@`; test -d $$D || mkdir -p $$D	
	echo 'COM_DIAG_$(SYMBOL)_PATH=`dirname $${BASH_ARGV[0]}`; COM_DIAG_$(SYMBOL)_ROOT=`cd $$COM_DIAG_$(SYMBOL)_PATH; pwd`' > $@
	echo 'export PATH=$$PATH:$$COM_DIAG_$(SYMBOL)_ROOT/../bin:$$COM_DIAG_$(SYMBOL)_ROOT/../tst' >> $@
	echo 'export LD_DRIVER_PATH=$$COM_DIAG_$(SYMBOL)_ROOT/../drv' >> $@
	echo 'export LD_LIBRARY_PATH=$$LD_LIBRARY_PATH:$$COM_DIAG_$(SYMBOL)_ROOT/../lib' >> $@
	echo 'export LD_MODULE_PATH=$$COM_DIAG_$(SYMBOL)_ROOT/../mod' >> $@

########## Helpers

.PHONY:	backup implicit

backup:	../$(PROJECT).bak.tgz
	mv $(MVFLAGS) ../$(PROJECT).bak.tgz ../$(PROJECT).$(TIMESTAMP).tgz

../$(PROJECT).bak.tgz:
	tar cvzf - . > $@
	
implicit:
	$(CC) $(CPPFLAGS) $(CFLAGS) -dM -E - < /dev/null

########## Documentation

.PHONY:	documentation browse refman manpages

documentation:
	sed -e "s/\\\$$Name.*\\\$$/$(MAJOR).$(MINOR).$(BUILD)/" < doxygen.cf > doxygen-local.cf
	doxygen doxygen-local.cf
	test -d $(DOC_DIR)/pdf || mkdir -p $(DOC_DIR)/pdf
	( cd $(DOC_DIR)/latex; $(MAKE) refman.pdf; cp refman.pdf ../pdf )
	cat $(DOC_DIR)/man/man3/*.3 | groff -man -Tps - > $(DOC_DIR)/pdf/manpages.ps
	ps2pdf $(DOC_DIR)/pdf/manpages.ps $(DOC_DIR)/pdf/manpages.pdf

browse:
	$(BROWSER) file:doc/html/index.html

refman:
	$(BROWSER) file:doc/pdf/refman.pdf

manpages:
	$(BROWSER) file:doc/pdf/manpages.pdf

########## Submakes

.PHONY:	patch

patch:	$(OLD) $(NEW)
	diff -purN $(OLD) $(NEW)

########## Rules

$(OUT)/%.txt:	%.cpp
	D=`dirname $@`; test -d $$D || mkdir -p $$D
	$(CXX) -E $(CPPFLAGS) -c $< > $@

$(OUT)/%.o:	%.cpp
	D=`dirname $@`; test -d $$D || mkdir -p $$D
	$(CXX) $(CPPFLAGS) $(CXXFLAGS) -o $@ -c $<

$(OUT)/%.txt:	%.c
	D=`dirname $@`; test -d $$D || mkdir -p $$D
	$(CC) -E $(CPPFLAGS) -c $< > $@

$(OUT)/%.o:	%.c
	D=`dirname $@`; test -d $$D || mkdir -p $$D
	$(CC) $(CPPFLAGS) $(CFLAGS) -o $@ -c $<

$(OUT)/%:	%.sh
	D=`dirname $@`; test -d $$D || mkdir -p $$D
	cp $< $@
	chmod 755 $@
	
.SECONDARY:

$(OUT)/$(BIN_DIR)/%:	$(OUT)/$(SYM_DIR)/%
	D=`dirname $@`; test -d $$D || mkdir -p $$D
	$(STRIP) -o $@ $<

########## Dependencies

.PHONY:	depend

depend:
	cp /dev/null dependencies.mk
	for S in $(SRC_DIR) $(TST_DIR) $(BIN_DIR); do \
		for F in $$S/*.cpp; do \
			D=`dirname $$F`; \
			echo -n "$(OUT)/$$D/" >> dependencies.mk; \
			$(CXX) $(CPPFLAGS) -MM -MG $$F >> dependencies.mk; \
		done; \
	done
	for S in $(SRC_DIR); do \
		for F in $$S/*.c; do \
			D=`dirname $$F`; \
			echo -n "$(OUT)/$$D/" >> dependencies.mk; \
			$(CC) $(CPPFLAGS) -MM -MG $$F >> dependencies.mk; \
		done; \
	done

-include dependencies.mk
