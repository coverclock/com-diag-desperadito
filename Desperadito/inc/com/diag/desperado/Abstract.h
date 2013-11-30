#ifndef _COM_DIAG_DESPERADO_ABSTRACT_H_
#define _COM_DIAG_DESPERADO_ABSTRACT_H_

/* vim: set ts=4 expandtab shiftwidth=4: */

/******************************************************************************

    Copyright 2006-2011 Digital Aggregates Corporation, Colorado, USA.
    This file is part of the Digital Aggregates Desperado library.
    
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
 *  Declares the Abstract class.
 *
 *  @see    Abstract
 *
 *  @author Chip Overclock (coverclock@diag.com)
 *
 *
 */


#include "com/diag/desperado/stdio.h"
#include "com/diag/desperado/Object.h"
#include "com/diag/desperado/Output.h"

#include "com/diag/desperado/Begin.h"

/**
 *  This is a pilot framework for a header file declaring a purely abstract
 *  base class. It is used to test new designs.
 *
 *  @author coverclock@diag.com (Chip Overclock)
 */
class Abstract : public Object {

public:

    /**
     *  Destructor.
     */
    virtual ~Abstract();

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
    virtual void show(int level = 0, Output* display = 0, int indent = 0) const = 0;

protected:

    /**
     *  Constructor.
     */
    explicit Abstract();

    /**
     *  Copy constructor.
     *
     *  @param  that    refers to an R-value object of this type.
     */
    Abstract(const Abstract& that);

    /**
     *  Assignment operator.
     *
     *  @param  that    refers to an R-value object of this type.
     */
    Abstract& operator=(const Abstract& that);

private:

};


//
//  Constructor
//
inline Abstract::Abstract() :
    Object()
{
#if defined(DESPERADO_HAS_DEBUGGING)
    fprintf(stderr, "Abstract(%p)::Abstract()\n", this);
#endif
}


//
//  Destructor
//
inline Abstract::~Abstract() {
#if defined(DESPERADO_HAS_DEBUGGING)
    fprintf(stderr, "Abstract(%p)::~Abstract()\n", this);
#endif
}


//
//  Assignment operator.
//
inline Abstract& Abstract::operator=(const Abstract& that) {
#if defined(DESPERADO_HAS_DEBUGGING)
    fprintf(stderr, "Abstract(%p)::operator=(%p)\n", this, &that);
#endif
    if (&that != this) {
        ;
    }
    return *this;
}


//
//  Copy constructor.
//
inline Abstract::Abstract(const Abstract& that) :
    Object()
{
#if defined(DESPERADO_HAS_DEBUGGING)
    fprintf(stderr, "Abstract(%p)::Abstract(%p)\n", this, &that);
#endif
    if (&that != this) {
        ;
    }
}

#include "com/diag/desperado/End.h"


#endif