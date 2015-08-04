"""Python wrappers for MOAB Types."""

from . cimport moab

# Error codes
MB_SUCCESS = moab.MB_SUCCESS
MB_INDEX_OUT_OF_RANGE = moab.MB_INDEX_OUT_OF_RANGE   
MB_TYPE_OUT_OF_RANGE = moab.MB_TYPE_OUT_OF_RANGE    
MB_MEMORY_ALLOCATION_FAILED = moab.MB_MEMORY_ALLOCATION_FAILED     
MB_ENTITY_NOT_FOUND = moab.MB_ENTITY_NOT_FOUND     
MB_MULTIPLE_ENTITIES_FOUND = moab.MB_MULTIPLE_ENTITIES_FOUND  
MB_TAG_NOT_FOUND = moab.MB_TAG_NOT_FOUND    
MB_FILE_DOES_NOT_EXIST = moab.MB_FILE_DOES_NOT_EXIST  
MB_FILE_WRITE_ERROR = moab.MB_FILE_WRITE_ERROR     
MB_NOT_IMPLEMENTED = moab.MB_NOT_IMPLEMENTED  
MB_ALREADY_ALLOCATED = moab.MB_ALREADY_ALLOCATED    
MB_VARIABLE_DATA_LENGTH = moab.MB_VARIABLE_DATA_LENGTH     
MB_INVALID_SIZE = moab.MB_INVALID_SIZE     
MB_UNSUPPORTED_OPERATION = moab.MB_UNSUPPORTED_OPERATION    
MB_UNHANDLED_OPTION = moab.MB_UNHANDLED_OPTION     
MB_STRUCTURED_MESH = moab.MB_STRUCTURED_MESH  
MB_FAILURE = moab.MB_FAILURE 


cdef dict _ERROR_MSGS = {
    MB_INDEX_OUT_OF_RANGE: (IndexError, 'MOAB index out of range'),
    MB_TYPE_OUT_OF_RANGE: (TypeError, 'Incorrect MOAB type, out of range'),
    MB_MEMORY_ALLOCATION_FAILED: (MemoryError, 'MOAB memory allocation'),
    MB_ENTITY_NOT_FOUND: (RuntimeError, 'Entity not found'),
    MB_MULTIPLE_ENTITIES_FOUND: (RuntimeError, 'Multiple entities found'),
    MB_TAG_NOT_FOUND: (RuntimeError, 'Tag not found'),
    MB_FILE_DOES_NOT_EXIST: (IOError, 'File not found'),
    MB_FILE_WRITE_ERROR: (IOError, 'File write error'), 
    MB_NOT_IMPLEMENTED: (NotImplementedError, '[MOAB]'),
    MB_ALREADY_ALLOCATED: (MemoryError, 'already allocated'),
    MB_VARIABLE_DATA_LENGTH: (TypeError, 'variable length data'),
    MB_INVALID_SIZE: (ValueError, 'invalid size'),
    MB_UNSUPPORTED_OPERATION: (RuntimeError, 'unsupported operation'),
    MB_UNHANDLED_OPTION: (RuntimeError, 'unhandled option'),
    MB_STRUCTURED_MESH: (RuntimeError, 'structured mesh'),
    MB_FAILURE: (RuntimeError, '[MOAB] failure'),
    }

def check_error(int err, **kwargs):
    """Checks error status code and raises error if needed."""
    if err == 0:
        return
    errtype, msg = _ERROR_MSGS[err]
    if len(kwargs) > 0:
        msg += ': '
        msg += ', '.join(sorted(['{0}={1!r}'.format(k, v) for k, v in kwargs.items()]))
    raise errtype(msg)


# Entity types
MBVERTEX = moab.MBVERTEX
MBEDGE = moab.MBEDGE
MBTRI = moab.MBTRI
MBQUAD = moab.MBQUAD
MBPOLYGON = moab.MBPOLYGON
MBTET = moab.MBTET
MBPYRAMID = moab.MBPYRAMID
MBPRISM = moab.MBPRISM
MBKNIFE = moab.MBKNIFE
MBHEX = moab.MBHEX
MBPOLYHEDRON = moab.MBPOLYHEDRON
MBENTITYSET = moab.MBENTITYSET
MBMAXTYPE = moab.MBMAXTYPE