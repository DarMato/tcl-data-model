# Initial analysis of the data

After the review the following things whas been observed:

- The dataset have no natural key that could be used to check if tehre is any dublicates or user for references.

- ID values not described in the matadata :
  - VendorID column has `8` rows with value `5`
  - RateCode column has `521` rows with value `99`

- Missing values:
  - Columns `passenger_count`, `RatecodeID`, `store_and_fwd_flag`,  `congestion_surcharge` have `51018` (less than 1%) row with missing value. Looks like some data recording issue.
  - For some reason  `airport_fee` has only `null` values. Why not `0` as it is in other columns? 

- Quastionable nubers:
  - passenger_count: has ~1% of rows with `0`. What that means? Delivery of some item?
  - trip_distance: How it can have negative values? Can't it be that single trip was 19K miles?
  - fare_amount: How it can have negative values? Can't it be that single trip cost 398.47K?
  - In general all colums that shows the cost of trip has some negativa values. Does it makes scence?

- Not logical dates
  - `4` rows were tpep_pickup_datetime > tpep_dropoff_datetime 


# Qality of data monitoring
For the quality of data I need to add variuos tests that culd inform you about uexpected data. Most populat test that are used by me can be seen on `int_yellow_trip_data` model tests list.

# Data injestion to DWH 


# ERD of data model

![image](https://github.com/DarMato/tcl-data-model/assets/45017292/c12092dc-54e1-4578-ad07-9e87095393ed)


