CLASS zcenkay_text_process DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    CLASS-METHODS create
      RETURNING
        VALUE(ro_text_proc) TYPE REF TO zcenkay_text_process.
    METHODS create_random_text
      IMPORTING iv_paras TYPE i DEFAULT 20
      RAISING
        cx_web_http_client_error
        cx_http_dest_provider_error.
  PROTECTED SECTION.
  PRIVATE SECTION.
    CONSTANTS mc_url_beg TYPE string VALUE 'https://baconipsum.com/api/?type=all-meat&paras='.
    CONSTANTS mc_url_end TYPE string VALUE '&start-with-lorem'.
    METHODS create_url_link
      IMPORTING
        iv_paras       TYPE i
      RETURNING
        VALUE(rv_link) TYPE string.
ENDCLASS.



CLASS zcenkay_text_process IMPLEMENTATION.

  METHOD create.

    ro_text_proc = NEW #( ).

  ENDMETHOD.
  METHOD create_random_text.
    DATA(lo_http) =  cl_web_http_client_manager=>create_by_http_destination( i_destination = cl_http_destination_provider=>create_by_url( i_url = me->create_url_link( iv_paras = iv_paras ) ) ).

    DATA(lo_response) = lo_http->execute(
      EXPORTING
        i_method   =  if_web_http_client=>get ).
  ENDMETHOD.


  METHOD create_url_link.

  ENDMETHOD.

ENDCLASS.
