create or replace PROCEDURE pr_per_year_reset_grade_info

IS

BEGIN

    update passenger_evl set
    pe_ride_count = 0,
    g_code = '1010';
    
    update driver_evl set
    de_drive_count = 0,
    g_code = '1005';
    
    
END;