CLASS zcenkay_cl001 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
    CONSTANTS mc_url TYPE string VALUE 'https://baconipsum.com/api/?type=all-meat&paras=20&start-with-lorem'.
ENDCLASS.



CLASS zcenkay_cl001 IMPLEMENTATION.



  METHOD if_oo_adt_classrun~main.
    DATA: lo_dest TYPE REF TO if_http_destination.
    "lo_dest

    TRY.
        DATA(lo_http) =  cl_web_http_client_manager=>create_by_http_destination( i_destination = cl_http_destination_provider=>create_by_url( i_url = mc_url ) ).

        DATA(lo_response) = lo_http->execute(
          EXPORTING
            i_method   =  if_web_http_client=>get ).
        out->write( data   = lo_response->get_text( ) ).
      CATCH cx_web_http_client_error
            cx_http_dest_provider_error
            cx_web_message_error
             INTO DATA(lo_cx).
        out->write(
          EXPORTING
            data   = lo_cx->get_longtext(
*                  preserve_newlines =
        )
*                  name   =
*                RECEIVING
*                  output =
        )->write(
          EXPORTING
            data   = lo_cx->get_text( )
        ).

        .
    ENDTRY.
*          CATCH .
    data : asd TYPE REF TO cl_abap_typedescr.
  ENDMETHOD.

ENDCLASS.
