CLASS zcenkay_cx_text DEFINITION
    INHERITING FROM cx_static_check
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    CONSTANTS:
      BEGIN OF ty_http_conn_error,
        msgid TYPE symsgid VALUE 'ZCENKAY_DATA_GEN',
        msgno TYPE symsgno VALUE '001',
        attr1 TYPE scx_attrname VALUE '',
        attr2 TYPE scx_attrname VALUE '',
        attr3 TYPE scx_attrname VALUE '',
        attr4 TYPE scx_attrname VALUE '',
      END OF ty_http_conn_error.
    METHODS constructor
      IMPORTING
        textid LIKE textid OPTIONAL
        previous LIKE previous OPTIONAL.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcenkay_cx_text IMPLEMENTATION.

  METHOD constructor ##ADT_SUPPRESS_GENERATION.

    super->constructor( textid = textid previous = previous ).

  ENDMETHOD.
ENDCLASS.
