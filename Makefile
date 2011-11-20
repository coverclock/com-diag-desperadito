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

PLATFORM=Linux
TARGET=IA32

CORE=Desperado
CORELC=desperado
CORE_DIR=$(shell cd ../$(CORE); pwd)

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

PROJECT_CDEFINES=\
 -DDESPERADO_TARGET_IS_$(TARGET) \
 -DDESPERADO_TARGET_NAME="\"$(TARGET)\"" \
 -DDESPERADO_PLATFORM_IS_$(PLATFORM) \
 -DDESPERADO_PLATFORM_NAME="\"$(PLATFORM)\""  \
 -DDESPERADO_PLATFORM_CLASS=$(PLATFORM) \
 -DDESPERADO_HAS_SYSLOG \
 -D_REENTRANT \
 -D_GNU_SOURCE

PROJECT_CPPFLAGS=-I$(PROJECT_INC) $(PROJECT_CDEFINES)
PROJECT_LDFLAGS=-L$(PROJECT_LIBS) -l$(PROJECT)

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

include/com/diag/$(CORELC):
	mkdir -p $@
	
desperado:
	mkdir -p $@

################################################################################
# MANIFESTS
################################################################################

MANIFEST_H=\
 include/com/diag/desperado/Begin.h \
 include/com/diag/desperado/BufferInput.h \
 include/com/diag/desperado/BufferOutput.h \
 include/com/diag/desperado/CommonEra.h \
 include/com/diag/desperado/Constant.h \
 include/com/diag/desperado/DataInput.h \
 include/com/diag/desperado/Date.h \
 include/com/diag/desperado/DateTime.h \
 include/com/diag/desperado/DaylightSavingTime.h \
 include/com/diag/desperado/DescriptorInput.h \
 include/com/diag/desperado/DescriptorOutput.h \
 include/com/diag/desperado/Desperado.h \
 include/com/diag/desperado/DstAlways.h \
 include/com/diag/desperado/DstEu.h \
 include/com/diag/desperado/DstGeneric.h \
 include/com/diag/desperado/DstNever.h \
 include/com/diag/desperado/DstUs.h \
 include/com/diag/desperado/DstUs1966.h \
 include/com/diag/desperado/DstUs1986.h \
 include/com/diag/desperado/DstUs2007.h \
 include/com/diag/desperado/Dump.h \
 include/com/diag/desperado/DumpInput.h \
 include/com/diag/desperado/DumpOutput.h \
 include/com/diag/desperado/End.h \
 include/com/diag/desperado/Epoch.h \
 include/com/diag/desperado/Exception.h \
 include/com/diag/desperado/FileInput.h \
 include/com/diag/desperado/FileOutput.h \
 include/com/diag/desperado/Heap.h \
 include/com/diag/desperado/Input.h \
 include/com/diag/desperado/InputOutput.h \
 include/com/diag/desperado/LeapSeconds.h \
 include/com/diag/desperado/Linux.h \
 include/com/diag/desperado/LocalTime.h \
 include/com/diag/desperado/LogOutput.h \
 include/com/diag/desperado/Logger.h \
 include/com/diag/desperado/Number.h \
 include/com/diag/desperado/Object.h \
 include/com/diag/desperado/Output.h \
 include/com/diag/desperado/PathInput.h \
 include/com/diag/desperado/PathOutput.h \
 include/com/diag/desperado/Platform.h \
 include/com/diag/desperado/Print.h \
 include/com/diag/desperado/SyslogOutput.h \
 include/com/diag/desperado/Ticks.h \
 include/com/diag/desperado/Time.h \
 include/com/diag/desperado/TimeStamp.h \
 include/com/diag/desperado/TimeZone.h \
 include/com/diag/desperado/Vintage.h \
 include/com/diag/desperado/cxxcapi.h \
 include/com/diag/desperado/assert.h \
 include/com/diag/desperado/debug.h \
 include/com/diag/desperado/errno.h \
 include/com/diag/desperado/exceptions.h \
 include/com/diag/desperado/generics.h \
 include/com/diag/desperado/littleendian.h \
 include/com/diag/desperado/lowtohigh.h \
 include/com/diag/desperado/ready.h \
 include/com/diag/desperado/release.h \
 include/com/diag/desperado/stdarg.h \
 include/com/diag/desperado/stdio.h \
 include/com/diag/desperado/stdlib.h \
 include/com/diag/desperado/string.h \
 include/com/diag/desperado/target.h \
 include/com/diag/desperado/types.h \
 include/com/diag/desperado/int8_Number.h \
 include/com/diag/desperado/int16_Number.h \
 include/com/diag/desperado/int32_Number.h \
 include/com/diag/desperado/int64_Number.h \
 include/com/diag/desperado/uint8_Number.h \
 include/com/diag/desperado/uint16_Number.h \
 include/com/diag/desperado/uint32_Number.h \
 include/com/diag/desperado/uint64_Number.h \
 README.h

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
 DstAlways.cpp \
 DstEu.cpp \
 DstGeneric.cpp \
 DstNever.cpp \
 DstUs.cpp \
 DstUs1966.cpp \
 DstUs1986.cpp \
 DstUs2007.cpp \
 Dump.cpp \
 DumpInput.cpp \
 DumpOutput.cpp \
 Epoch.cpp \
 FileInput.cpp \
 FileOutput.cpp \
 Heap.cpp \
 Input.cpp \
 InputOutput.cpp \
 LeapSeconds.cpp \
 Linux.cpp \
 LocalTime.cpp \
 LogOutput.cpp \
 Logger.cpp \
 Number_int8.cpp \
 Number_int16.cpp \
 Number_int32.cpp \
 Number_int64.cpp \
 Number_uint8.cpp \
 Number_uint16.cpp \
 Number_uint32.cpp \
 Number_uint64.cpp \
 Object.cpp \
 Output.cpp \
 PathInput.cpp \
 PathOutput.cpp \
 Platform.cpp \
 PlatformApi.cpp \
 Print.cpp \
 SyslogOutput.cpp \
 Ticks.cpp \
 Time.cpp \
 TimeStamp.cpp \
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
	
MANIFEST_O=$(addsuffix .o,$(basename $(MANIFEST_CPP)))

################################################################################
# BUILD
################################################################################

TARGETS+=include/com/diag/$(CORELC)

TARGETS+=$(MANIFEST_H)

TARGETS+=$(MANIFEST_CPP)

TARGETS+=$(MANIFEST_O)
ARTIFACTS+=$(MANIFEST_O)
ARCHIVABLE+=$(MANIFEST_O)

################################################################################
# LIBRARIES AND SHARED OBJECTS
################################################################################

TARGETS+=lib$(PROJECT).a
DELIVERABLES+=lib$(PROJECT).a

lib$(PROJECT).a:	$(ARCHIVABLE)
	$(AR) $(ARFLAGS) lib$(PROJECT).a $(ARCHIVABLE)
	$(RANLIB) lib$(PROJECT).a

TARGETS+=lib$(PROJECT).so.$(MAJOR).$(MINOR).$(BUILD)
DELIVERABLES+=lib$(PROJECT).so.$(MAJOR).$(MINOR).$(BUILD)

lib$(PROJECT).so.$(MAJOR).$(MINOR).$(BUILD):	lib$(PROJECT).a
	HERE="`pwd`"; \
	THERE="`mktemp -d $(TMP)/$(PROJECT).XXXXXXXXXX`"; \
	( cd $$THERE; $(AR) $(SOFLAGS) $$HERE/lib$(PROJECT).a ); \
	$(CC) $(CARCH) -shared -Wl,-soname,lib$(PROJECT).so.$(MAJOR).$(MINOR).$(BUILD) -o lib$(PROJECT).so.$(MAJOR).$(MINOR).$(BUILD) $$THERE/*.o; \
	rm -rf $$THERE

TARGETS+=lib$(PROJECT).so.$(MAJOR).$(MINOR)
DELIVERABLES+=lib$(PROJECT).so.$(MAJOR).$(MINOR)

lib$(PROJECT).so.$(MAJOR).$(MINOR):	lib$(PROJECT).so.$(MAJOR).$(MINOR).$(BUILD)
	ln -s -f lib$(PROJECT).so.$(MAJOR).$(MINOR).$(BUILD) lib$(PROJECT).so.$(MAJOR).$(MINOR)

TARGETS+=lib$(PROJECT).so.$(MAJOR)
DELIVERABLES+=lib$(PROJECT).so.$(MAJOR)

lib$(PROJECT).so.$(MAJOR):	lib$(PROJECT).so.$(MAJOR).$(MINOR)
	ln -s -f lib$(PROJECT).so.$(MAJOR).$(MINOR).$(BUILD) lib$(PROJECT).so.$(MAJOR)

TARGETS+=lib$(PROJECT).so
DELIVERABLES+=lib$(PROJECT).so

lib$(PROJECT).so:	lib$(PROJECT).so.$(MAJOR)
	ln -s -f lib$(PROJECT).so.$(MAJOR).$(MINOR).$(BUILD) lib$(PROJECT).so

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
	
include/com/diag/$(CORELC)/%.h:	$(CORE_DIR)/include/com/diag/$(CORELC)/%.h
	cp $< $@
		
%.h:	$(CORE_DIR)/%.h
	cp $< $@
	
%.cpp:	$(CORE_DIR)/%.cpp
	cp $< $@

%.c:	$(CORE_DIR)/%.c
	cp $< $@

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
