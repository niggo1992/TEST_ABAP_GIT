*&---------------------------------------------------------------------*
*& Report ZNG_TEST
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZNG_TEST.

PARAMETERS: price TYPE p.

PERFORM minus_ten_percent CHANGING price.

WRITE price.



FORM minus_ten_percent CHANGING fprice TYPE p.

  fprice = fprice * '0.9'.

ENDFORM.                    "Minus_ten_percent

CLASS test DEFINITION FOR TESTING.  "#AU Risk_Level Harmless
"#AU Duration Short

  PRIVATE SECTION.

    METHODS test_minus_ten_percent FOR TESTING.

ENDCLASS.

CLASS test IMPLEMENTATION.

  METHOD test_minus_ten_percent.

    DATA: testprice type p value 200.

    PERFORM minus_ten_percent CHANGING testprice.

    cl_aunit_assert=>assert_equals( act = testprice exp = 170

                     msg = 'ninty percent not calculated correctly').

  ENDMETHOD.

ENDCLASS.
