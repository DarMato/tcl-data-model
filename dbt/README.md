

# Dimensions

For this data model first of all the dimensions has to be populated by:
- run seed files
- test seed files data
- run all dimensions in `dwh` schema. 

Dimensions is not using `stg` or `intermediate` layer because the are generated from seed files.
And there is no addtional transformations made so  `seed` layer tests is enough.

# Fact

For the fact table I do use `intermediate` layer, because there is a need for some data transformation and data quality test.

If data set is NOT able to pass defined test the data can NOT be moved forward to `dwh` schema.

And in this case we do have to many quastions regarding the data.

# Test

Test are defined in schema.yaml files for `seed` and `intermediate` layers.


Results of the test:
```

20:57:08  1 of 38 START test accepted_values_int_yellow_trip_data_is_stored_and_fwd__True__False  [RUN]
20:57:09  1 of 38 PASS accepted_values_int_yellow_trip_data_is_stored_and_fwd__True__False  [PASS in 1.45s]
20:57:09  2 of 38 START test dbt_utils_expression_is_true_int_yellow_trip_data_pick_up_datetime___drop_of_datetime  [RUN]
20:57:10  2 of 38 FAIL 4 dbt_utils_expression_is_true_int_yellow_trip_data_pick_up_datetime___drop_of_datetime  [FAIL 4 in 0.72s]
20:57:10  3 of 38 START test dbt_utils_expression_is_true_int_yellow_trip_data_total_amount___nvl_fare_amount_0_nvl_extra_amount_0_nvl_mta_tax_amount_0_nvl_tip_amount_0_nvl_tolls_amount_0_nvl_improvement_surcharge_amount_0_nvl_congestion_surcharge_amount_0_nvl_airport_fee_amount_0_  [RUN]
20:57:13  3 of 38 WARN 5322856 dbt_utils_expression_is_true_int_yellow_trip_data_total_amount___nvl_fare_amount_0_nvl_extra_amount_0_nvl_mta_tax_amount_0_nvl_tip_amount_0_nvl_tolls_amount_0_nvl_improvement_surcharge_amount_0_nvl_congestion_surcharge_amount_0_nvl_airport_fee_amount_0_  [WARN 5322856 in 3.29s]
20:57:13  4 of 38 START test dbt_utils_expression_is_true_int_yellow_trip_data_trip_distance_mi___0  [RUN]
20:57:14  4 of 38 WARN 3295 dbt_utils_expression_is_true_int_yellow_trip_data_trip_distance_mi___0  [WARN 3295 in 0.69s]
20:57:14  5 of 38 START test not_null_int_yellow_trip_data_congestion_surcharge_amount ... [RUN]
20:57:15  5 of 38 FAIL 51018 not_null_int_yellow_trip_data_congestion_surcharge_amount ... [FAIL 51018 in 0.68s]
20:57:15  6 of 38 START test not_null_int_yellow_trip_data_dim_data_vendor_id ............ [RUN]
20:57:15  6 of 38 PASS not_null_int_yellow_trip_data_dim_data_vendor_id .................. [PASS in 0.72s]
20:57:15  7 of 38 START test not_null_int_yellow_trip_data_dim_rate_code_id .............. [RUN]
20:57:16  7 of 38 FAIL 51018 not_null_int_yellow_trip_data_dim_rate_code_id .............. [FAIL 51018 in 0.69s]
20:57:16  8 of 38 START test not_null_int_yellow_trip_data_extra_amount .................. [RUN]
20:57:17  8 of 38 PASS not_null_int_yellow_trip_data_extra_amount ........................ [PASS in 1.36s]
20:57:17  9 of 38 START test not_null_int_yellow_trip_data_fare_amount ................... [RUN]
20:57:18  9 of 38 PASS not_null_int_yellow_trip_data_fare_amount ......................... [PASS in 0.67s]
20:57:18  10 of 38 START test not_null_int_yellow_trip_data_improvement_surcharge_amount . [RUN]
20:57:19  10 of 38 PASS not_null_int_yellow_trip_data_improvement_surcharge_amount ....... [PASS in 0.68s]
20:57:19  11 of 38 START test not_null_int_yellow_trip_data_int_yellow_trip_data_id ...... [RUN]
20:57:19  11 of 38 PASS not_null_int_yellow_trip_data_int_yellow_trip_data_id ............ [PASS in 0.73s]
20:57:19  12 of 38 START test not_null_int_yellow_trip_data_is_stored_and_fwd ............ [RUN]
20:57:20  12 of 38 FAIL 51018 not_null_int_yellow_trip_data_is_stored_and_fwd ............ [FAIL 51018 in 0.69s]
20:57:20  13 of 38 START test not_null_int_yellow_trip_data_mta_tax_amount ............... [RUN]
20:57:21  13 of 38 PASS not_null_int_yellow_trip_data_mta_tax_amount ..................... [PASS in 0.71s]
20:57:21  14 of 38 START test not_null_int_yellow_trip_data_passenger_count .............. [RUN]
20:57:22  14 of 38 FAIL 51018 not_null_int_yellow_trip_data_passenger_count .............. [FAIL 51018 in 0.70s]
20:57:22  15 of 38 START test not_null_int_yellow_trip_data_pick_up_datetime ............. [RUN]
20:57:22  15 of 38 PASS not_null_int_yellow_trip_data_pick_up_datetime ................... [PASS in 0.69s]
20:57:22  16 of 38 START test not_null_int_yellow_trip_data_tip_amount ................... [RUN]
20:57:23  16 of 38 PASS not_null_int_yellow_trip_data_tip_amount ......................... [PASS in 0.70s]
20:57:23  17 of 38 START test not_null_int_yellow_trip_data_tolls_amount ................. [RUN]
20:57:24  17 of 38 PASS not_null_int_yellow_trip_data_tolls_amount ....................... [PASS in 0.67s]
20:57:24  18 of 38 START test not_null_int_yellow_trip_data_total_amount ................. [RUN]
20:57:24  18 of 38 PASS not_null_int_yellow_trip_data_total_amount ....................... [PASS in 0.72s]
20:57:24  19 of 38 START test not_null_int_yellow_trip_data_trip_distance_mi ............. [RUN]
20:57:25  19 of 38 PASS not_null_int_yellow_trip_data_trip_distance_mi ................... [PASS in 0.69s]
20:57:25  20 of 38 START test not_null_md_data_vendor_data_vendor_key .................... [RUN]
20:57:26  20 of 38 PASS not_null_md_data_vendor_data_vendor_key .......................... [PASS in 0.66s]
20:57:26  21 of 38 START test not_null_md_data_vendor_vendor_name ........................ [RUN]
20:57:26  21 of 38 PASS not_null_md_data_vendor_vendor_name .............................. [PASS in 0.66s]
20:57:26  22 of 38 START test not_null_md_payment_type_payment_type_key .................. [RUN]
20:57:27  22 of 38 PASS not_null_md_payment_type_payment_type_key ........................ [PASS in 0.66s]
20:57:27  23 of 38 START test not_null_md_payment_type_payment_type_name ................. [RUN]
20:57:28  23 of 38 PASS not_null_md_payment_type_payment_type_name ....................... [PASS in 0.66s]
20:57:28  24 of 38 START test not_null_md_rate_code_rate_code_key ........................ [RUN]
20:57:28  24 of 38 PASS not_null_md_rate_code_rate_code_key .............................. [PASS in 0.69s]
20:57:28  25 of 38 START test not_null_md_rate_code_rate_code_name ....................... [RUN]
20:57:29  25 of 38 PASS not_null_md_rate_code_rate_code_name ............................. [PASS in 0.62s]
20:57:29  26 of 38 START test not_null_md_taxi_zone_borough .............................. [RUN]
20:57:30  26 of 38 PASS not_null_md_taxi_zone_borough .................................... [PASS in 0.64s]
20:57:30  27 of 38 START test not_null_md_taxi_zone_service_zone ......................... [RUN]
20:57:30  27 of 38 PASS not_null_md_taxi_zone_service_zone ............................... [PASS in 0.64s]
20:57:30  28 of 38 START test not_null_md_taxi_zone_taxi_zone_key ........................ [RUN]
20:57:31  28 of 38 PASS not_null_md_taxi_zone_taxi_zone_key .............................. [PASS in 0.65s]
20:57:31  29 of 38 START test not_null_md_taxi_zone_zone ................................. [RUN]
20:57:32  29 of 38 PASS not_null_md_taxi_zone_zone ....................................... [PASS in 0.63s]
20:57:32  30 of 38 START test relationships_int_yellow_trip_data_dim_data_vendor_id__dim_data_vendor_id__ref_dim_data_vendor_  [RUN]
20:57:32  30 of 38 FAIL 8 relationships_int_yellow_trip_data_dim_data_vendor_id__dim_data_vendor_id__ref_dim_data_vendor_  [FAIL 8 in 0.77s]
20:57:32  31 of 38 START test relationships_int_yellow_trip_data_dim_rate_code_id__dim_rate_code_id__ref_dim_rate_code_  [RUN]
20:57:33  31 of 38 FAIL 521 relationships_int_yellow_trip_data_dim_rate_code_id__dim_rate_code_id__ref_dim_rate_code_  [FAIL 521 in 0.67s]
20:57:33  32 of 38 START test relationships_int_yellow_trip_data_drop_off_dim_taxi_zone_id__dim_taxi_zone_id__ref_dim_taxi_zone_  [RUN]
20:57:34  32 of 38 ERROR relationships_int_yellow_trip_data_drop_off_dim_taxi_zone_id__dim_taxi_zone_id__ref_dim_taxi_zone_  [ERROR in 0.66s]
20:57:34  33 of 38 START test relationships_int_yellow_trip_data_pick_up_dim_taxi_zone_id__dim_taxi_zone_id__ref_dim_taxi_zone_  [RUN]
20:57:34  33 of 38 ERROR relationships_int_yellow_trip_data_pick_up_dim_taxi_zone_id__dim_taxi_zone_id__ref_dim_taxi_zone_  [ERROR in 0.64s]
20:57:34  34 of 38 START test unique_int_yellow_trip_data_int_yellow_trip_data_id ........ [RUN]
20:57:35  34 of 38 PASS unique_int_yellow_trip_data_int_yellow_trip_data_id .............. [PASS in 1.13s]
20:57:35  35 of 38 START test unique_md_data_vendor_data_vendor_key ...................... [RUN]
20:57:36  35 of 38 PASS unique_md_data_vendor_data_vendor_key ............................ [PASS in 0.67s]
20:57:36  36 of 38 START test unique_md_payment_type_payment_type_key .................... [RUN]
20:57:37  36 of 38 PASS unique_md_payment_type_payment_type_key .......................... [PASS in 0.64s]
20:57:37  37 of 38 START test unique_md_rate_code_rate_code_key .......................... [RUN]
20:57:37  37 of 38 PASS unique_md_rate_code_rate_code_key ................................ [PASS in 0.68s]
20:57:37  38 of 38 START test unique_md_taxi_zone_taxi_zone_key .......................... [RUN]
20:57:38  38 of 38 PASS unique_md_taxi_zone_taxi_zone_key ................................ [PASS in 0.63s]

```


