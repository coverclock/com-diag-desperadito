################################################################################
# Copyright 2011 by the Digital Aggregates Corporation, Colorado, USA
# Licensed under the terms in README.h
# Chip Overclock <coverclock@diag.com>
# http://www.diag.com/navigation/downloads/Desperadito
# This project is a subset of the much larger core project.
# http://www.diag.com/navigation/downloads/Desperado
# The source files are derived directly and unaltered from the core project.
# The core project contains the unit tests.
################################################################################

PROJECT=desperadito
MAJOR=6
MINOR=4
BUILD=0

SVN_URL=svn://graphite/$(PROJECT)/trunk/Desperadito
HTTP_URL=http://www.diag.com/navigation/downloads/Desperadito.html

TMP=/tmp

################################################################################
# LISTS
################################################################################

PHONY=# Make these targets every time regardless of dependencies.

TARGETS=# Make these targets for make all.

ARTIFACTS=# Remove these targets for make clean.

DELIVERABLES=# Remove these targets for make clobber.

ARCHIVABLE=# Include these targets in the archive or shared library.

################################################################################
# PROJECT
################################################################################

PROJECT_DIR=.
PROJECT_LIBS=.
PROJECT_LIB=lib$(PROJECT).so
PROJECT_INC=include

PROJECT_CPPFLAGS=-I$(PROJECT_INC)
PROJECT_LDFLAGS=-L$(PROJECT_LIBS) -ldesperadito

CC=gcc
CXX=g++
AR=ar
RANLIB=ranlib
STRIP=strip

CPPFLAGS=$(PROJECT_CPPFLAGS)
CFLAGS=-g
CXXFLAGS=-g
ARFLAGS=rcv
SOFLAGS=xv
LDFLAGS=-g $(PROJECT_LDFLAGS) -lpthread -lrt -lm

################################################################################
# DEFAULT
################################################################################

PHONY+=default

default:	all

################################################################################
# MANIFEST
################################################################################

MANIFEST_H=\
 Begin.h \
 BufferInput.h \
 BufferOutput.h \
 CommonEra.h \
 Constant.h \
 DataInput.h \
 Date.h \
 DateTime.h \
 DaylightSavingTime.h \
 DescriptorInput.h \
 DescriptorOutput.h \
 Dump.h \
 End.h \
 Epoch.h \
 FileInput.h \
 FileOutput.h \
 Heap.h \
 Input.h \
 InputOutput.h \
 LeapSeconds.h \
 Linux.h \
 LogOutput.h \
 Logger.h \
 Number.h \
 Object.h \
 Output.h \
 PathInput.h \
 PathOutput.h \
 Platform.h \
 Print.h \
 SyslogOutput.h \
 Time.h \
 TimeZone.h \
 Vintage.h \
 cxxcapi.h \
 errno.h \
 generics.h \
 ready.h \
 release.h \
 stdarg.h \
 stdio.h \
 stdlib.h \
 string.h \
 target.h \
 types.h \
 int8_Number.h \
 int16_Number.h \
 int32_Number.h \
 int64_Number.h \
 uint8_Number.h \
 uint16_Number.h \
 uint32_Number.h \
 uint64_Number.h

MANIFEST_CPP=\
 BufferInput.cpp \
 BufferOutput.cpp \
 CommonEra.cpp \
 DataInput.cpp \
 Date.cpp \
 DateTime.cpp \
 DaylightSavingTime.cpp \
 DescriptorInput.cpp \
 DescriptorOutput.cpp \
 Dump.cpp \
 Epoch.cpp \
 FileInput.cpp \
 FileOutput.cpp \
 Heap.cpp \
 Input.cpp \
 InputOutput.cpp \
 LeapSeconds.cpp \
 Linux.cpp \
 LogOutput.cpp \
 Logger.cpp \
 Object.cpp \
 Output.cpp \
 PathInput.cpp \
 PathOutput.cpp \
 Platform.cpp \
 Print.cpp \
 SyslogOutput.cpp \
 Time.cpp \
 TimeZone.cpp \
 Vintage.cpp \
 ready.cpp \
 string.cpp \
 int8_Number.cpp \
 int16_Number.cpp \
 int32_Number.cpp \
 int64_Number.cpp \
 uint8_Number.cpp \
 uint16_Number.cpp \
 uint32_Number.cpp \
 uint64_Number.cpp

################################################################################
# EXTRACTION
################################################################################

CORE=Desperado
CORELC=desperado

CORE_DIR=$(shell cd ../$(CORE); pwd)

extract:
	( cd ${CORE_DIR}/include/com/diag/$(CORELC); ls -l $(MANIFEST_H) )
	( cd ${CORE_DIR}; ls -l $(MANIFEST_CPP) )

################################################################################
# BUILD
################################################################################

TARGETS+=
ARTIFACTS+=
ARCHIVABLE+=

################################################################################
# LIBRARIES AND SHARED OBJECTS
################################################################################

DELIVERABLES+=lib$(PROJECT).a

lib$(PROJECT).a:	$(ARCHIVABLE)
	$(AR) $(ARFLAGS) lib$(PROJECT).a $(ARCHIVABLE)
	$(RANLIB) lib$(PROJECT).a

DELIVERABLES+=lib$(PROJECT).so.$(MAJOR).$(MINOR).$(BUILD)

lib$(PROJECT).so.$(MAJOR).$(MINOR).$(BUILD):	lib$(PROJECT).a
	HERE="`pwd`"; \
	THERE="`mktemp -d $(TMP)/$(PROJECT).XXXXXXXXXX`"; \
	( cd $$THERE; $(AR) $(SOFLAGS) $$HERE/lib$(PROJECT).a ); \
	$(CC) $(CARCH) -shared -Wl,-soname,lib$(PROJECT).so.$(MAJOR).$(MINOR).$(BUILD) -o lib$(PROJECT).so.$(MAJOR).$(MINOR).$(BUILD) $$THERE/*.o; \
	rm -rf $$THERE

DELIVERABLES+=lib$(PROJECT).so.$(MAJOR).$(MINOR)

lib$(PROJECT).so.$(MAJOR).$(MINOR):	lib$(PROJECT).so.$(MAJOR).$(MINOR).$(BUILD)
	ln -s -f lib$(PROJECT).so.$(MAJOR).$(MINOR).$(BUILD) lib$(PROJECT).so.$(MAJOR).$(MINOR)

DELIVERABLES+=lib$(PROJECT).so.$(MAJOR)

lib$(PROJECT).so.$(MAJOR):	lib$(PROJECT).so.$(MAJOR).$(MINOR)
	ln -s -f lib$(PROJECT).so.$(MAJOR).$(MINOR).$(BUILD) lib$(PROJECT).so.$(MAJOR)

DELIVERABLES+=lib$(PROJECT).so

lib$(PROJECT).so:	lib$(PROJECT).so.$(MAJOR)
	ln -s -f lib$(PROJECT).so.$(MAJOR).$(MINOR).$(BUILD) lib$(PROJECT).so

################################################################################
# UNIT TESTS
################################################################################

PHONY+=test

test:	unittest
	./unittest
	echo "PASSED all"

################################################################################
# PATTERNS
################################################################################

%.txt:	%.cpp
	$(CXX) -E $(CPPFLAGS) -c $< > $*.txt

%.o:	%.cpp
	$(CXX) $(CPPFLAGS) $(CXXFLAGS) -o $@ -c $<

%.txt:	%.c
	$(CC) -E $(CPPFLAGS) -c $< > $*.txt

%.o:	%.c
	$(CC) $(CPPFLAGS) $(CFLAGS) -o $@ -c $<

%:	%_unstripped
	$(STRIP) -o $@ $<

################################################################################
# DEPENCENDIES
################################################################################

PHONY+=depend

ARTIFACTS+=dependencies.mk

depend:
	DEPENDS="`find . -type f \( -name '*.c' -o -name '*.cpp' \) -print`"; \
	echo "DEPENDS=\"$$DEPENDS\""; \
	$(CXX) $(CPPFLAGS) -M -MG $$DEPENDS > dependencies.mk

-include dependencies.mk

################################################################################
# ENTRY POINTS
################################################################################

PHONY+=all clean clobber pristine

all:	$(TARGETS)

clean:
	rm -f $(ARTIFACTS)
	
clobber:	clean
	rm -f $(DELIVERABLES)

################################################################################
# DISTRIBUTION
################################################################################

PHONY+=dist

ARTIFACTS+=$(PROJECT)-$(MAJOR).$(MINOR).$(BUILD).tgz

dist $(PROJECT)-$(MAJOR).$(MINOR).$(BUILD).tgz:
	TARDIR=$(shell mktemp -d /tmp/$(PROJECT).XXXXXXXXXX); \
	svn export $(SVN_URL) $$TARDIR/$(PROJECT)-$(MAJOR).$(MINOR).$(BUILD); \
	tar -C $$TARDIR -cvzf - $(PROJECT)-$(MAJOR).$(MINOR).$(BUILD) > $(PROJECT)-$(MAJOR).$(MINOR).$(BUILD).tgz; \
	rm -rf $$TARDIR

################################################################################
# END
################################################################################

.PHONY:	$(PHONY)
