# Initial analysis of the data

After the review, the following things were observed:

- The dataset has no natural key that could be used to check if there are any duplicates or users for references.

- ID values not described in the metadata :
  - VendorID column has `8` rows with value `5`
  - RateCode column has `521` rows with value `99`

- Missing values:
  - Columns `passenger_count`, `RatecodeID`, `store_and_fwd_flag`,  `congestion_surcharge` have `51018` (less than 1%) row with a missing value. Looks like some data recording issue.
  - For some reason  `airport_fee` has only `null` values. Why not `0` as it is in other columns? 

- Questionable numbers:
  - passenger_count: has ~1% of rows with `0`. What does that mean? Delivery of some items?
  - trip_distance: How it can have negative values? Can't it be that a single trip was 19K miles?
  - fare_amount: How can it have negative values? Can't it be that single trip cost 398.47K?
  - In general, all columns that show the cost of a trip has some negative values. Does it make sense?

- Not logical dates
  - `4` rows were tpep_pickup_datetime > tpep_dropoff_datetime 


# Qality of data monitoring
For the quality of data, I need to add various tests that could inform you about unexpected data. Most popular tests that are used by me can be seen on `int_yellow_trip_data` model tests list.

# Data injection to DWH 
Because the data is already provided in a parquet file, then it can be easily added to S3 and queried with Redshift Spectrum with the help of Glue Data Catalog and AWS Glue Crawler (all infrastructure was running on AWS).
In that case, there is no need to move all the data to DB. The source data can stay on S3 for long-term storage. Also, there is no need to maintain and create scripts for data load. 
The steps:
  1. Upload file to S3
  2. Create AWS Glue data catalog table by using AWS Glue Crawler
  3. Register external schema on Redshift
  4. Build DBT model for data transformation and testing. More about dbt models: [here](dbt)

   
# Sheduling

For the scheduling, usually I use AWS MAWAA service, which can give a lot of flexibility when you need to orchestrate processes executed in different tools. 

Monitoring of automated data pipelines:
- The status of every task (failed, successful)
- Duration of every task stage
- Number of errors or warnings
- Number of records inserted
  


# ERD of the data model


![image](https://github.com/DarMato/tcl-data-model/assets/45017292/c12092dc-54e1-4578-ad07-9e87095393ed)


