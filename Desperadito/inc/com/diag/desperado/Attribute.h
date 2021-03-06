#ifndef _COM_DIAG_DESPERADO_ATTRIBUTE_H_
#define _COM_DIAG_DESPERADO_ATTRIBUTE_H_

/* vim: set ts=4 expandtab shiftwidth=4: */

/******************************************************************************

    Copyright 2006-2011 Digital Aggregates Corporation, Colorado, USA.
    This file is part of the Digital Aggregates Desperadito library.
    
    This library is free software; you can redistribute it and/or
    modify it under the terms of the GNU Lesser General Public
    License as published by the Free Software Foundation; either
    version 2.1 of the License, or (at your option) any later version.

    As a special exception, if other files instantiate templates or
    use macros or inline functions from this file, or you compile
    this file and link it with other works to produce a work based on
    this file, this file does not by itself cause the resulting work
    to be covered by the GNU Lesser General Public License. However
    the source code for this file must still be made available in
    accordance with the GNU Lesser General Public License.

    This exception does not invalidate any other reasons why a work
    based on this file might be covered by the GNU Lesser General
    Public License.

    Alternative commercial licensing terms are available from the copyright
    holder. Contact Digital Aggregates Corporation for more information.

    This library is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU Lesser General Public License for more details.

    You should have received a copy of the GNU Lesser General
    Public License along with this library; if not, write to the
    Free Software Foundation, Inc., 59 Temple Place, Suite 330,
    Boston, MA 02111-1307 USA, or http://www.gnu.org/copyleft/lesser.txt.



******************************************************************************/


/**
 *  @file
 *
 *  Declares the Attribute class.
 *
 *  @see    Attribute
 *
 *  @author Chip Overclock (coverclock@diag.com)
 *
 *
 */


#include "com/diag/desperado/TransliteratorType.h"
#include "com/diag/desperado/Output.h"


#include "com/diag/desperado/Begin.h"

/**
 *  Uses a Transliterator to parse components of a keyword=value pair from
 *  a buffer or a file. The keyword string followed by an equal sign followed
 *  by a value string is called an attribute. The keyword string,
 *  equal sign, and value string are each returned separately by successive
 *  invocations of the transliterator method. The strings are sequences of
 *  ASCII characters that may be optionally surrounded by whitespace: tab,
 *  newline, return or space. String seperation may be defeated by escaping
 *  whitespace characters and the equal sign, or enclosing the character
 *  sequence in matching single or double quotes. Unless escaped, the
 *  poundsign character begins an ignored comment which is terminated by
 *  a newline. Similar to the often used C++ and Java Parameter classes,
 *  although the original implementation of this class predates either
 *  of those, and this class supports a more complex syntax.
 *
 *  @see    TransliteratorType
 *
 *  @author coverclock@diag.com (Chip Overclock)
 */
class Attribute : public TransliteratorType<16> {

public:

    /**
     *  Constructor.
     */
    explicit Attribute();

    /**
     *  Destructor.
     */
    virtual ~Attribute();

    /**
     *  Returns a pointer to a NUL-terminated character string containing
     *  those characters that are used as delimiters by the transliterator
     *  of this class. This string should be used to break apart, using
     *  the Argument class, strings whose substrings are destined
     *  for parsing by this class.
     *
     *  @return         a pointer to a NUL-terminated character string of
     *                  characters used as delimiters by this class.
     */
    virtual const char* delimiter();

    /**
     *  Returns a pointer to a NUL-terminated character string containing
     *  those characters that have special meaning to the transliterator
     *  of this class. This string should be used to expand, using
     *  the Escape class, characters destined for parsing
     *  by this class.
     *
     *  @return         a pointer to a NUL-terminated character string of
     *                  characters special to this class.
     */
    virtual const char* special();

    /**
     *  Displays internal information about this object to the specified
     *  output object. Useful for debugging and troubleshooting.
     *
     *  @param  level   sets the verbosity of the output. What this means
     *                  is object dependent. However, the level is passed
     *                  from outer to inner objects this object calls the
     *                  show methods of its inherited or composited objects.
     *
     *  @param display  points to the output object to which output is
     *                  sent. If null (zero), the default platform output
     *                  object is used as the effective output object. The
     *                  effective output object is passed from outer to
     *                  inner objects as this object calls the show methods
     *                  of its inherited and composited objects.
     *
     *  @param  indent  specifies the level of indentation. One more than
     *                  this value is passed from outer to inner objects
     *                  as this object calls the show methods of its
     *                  inherited and composited objects.
     */
    virtual void show(int level = 0, Output* display = 0, int indent = 0) const;

};


//
//  Return a pointer to the delimiter string.
//
inline const char* Attribute::delimiter() {
    return "\t\n\r ";
}


//
//  Return a pointer to the special string.
//
inline const char* Attribute::special() {
    return "\"#'=\\";
}

#include "com/diag/desperado/End.h"


#if defined(DESPERADO_HAS_UNITTESTS)
#include "com/diag/desperado/cxxcapi.h"
/**
 *  Run the Attribute unit test.
 *
 *  @param  pVM             points to the Ficl VM in whose context this
 *                          function is being executed if being run from a Ficl
 *                          shell, null otherwise.
 *
 *  @param  interactive     if non-zero causes the test to run interactively,
 *                          taking input from the platform input functor.
 *  
 *  @return the number of errors detected by the unit test.
 */
CXXCAPI int unittestAttribute(void* pVM, int interactive);
#endif


#endif
