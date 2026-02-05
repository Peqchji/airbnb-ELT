CREATE FILE FORMAT IF NOT EXISTS csv_format
  TYPE = 'CSV' 
  FIELD_DELIMITER = ','
  SKIP_HEADER = 1
  ERROR_ON_COLUMN_COUNT_MISMATCH = FALSE;

-- get service account
CREATE STORAGE INTEGRATION gcs_integration
  TYPE = EXTERNAL_STAGE
  STORAGE_PROVIDER = 'GCS' --integrate with google cloud
  ENABLED = TRUE
  STORAGE_ALLOWED_LOCATIONS = ('gcs://my-bucket-name/path/');

-- create stage
CREATE STAGE gcs_stage
FILE_FORMAT = csv_format
STORAGE_INTEGRATION = gcs_integration
URL='gcs://my-bucket-name/path/';

-- 1. Load Bookings
COPY INTO BOOKINGS
FROM @gcs_stage
FILES = ('bookings.csv')
FILE_FORMAT = (FORMAT_NAME = csv_format);

-- 2. Load Hosts
COPY INTO HOSTS
FROM @gcs_stage
FILES = ('hosts.csv')
FILE_FORMAT = (FORMAT_NAME = csv_format);

-- 3. Load Listings
COPY INTO LISTINGS
FROM @gcs_stage
FILES = ('listings.csv')
FILE_FORMAT = (FORMAT_NAME = csv_format);