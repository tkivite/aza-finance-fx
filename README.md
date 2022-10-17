# Introduction

A api microservice to manage fx transactions. These transactions will store how much money we will receive from our customers in the input currency, and how much we will pay them out in the output currency.
All transactions need the following details:
1. An identifier
2. A customer ID showing who created the transaction
3. Input amount and currency
4. Output amount and currency
5. Date of transaction
# pre-requisites:
- ruby (v3.0.0)
- Rails (v7.0.4)
- bundler (v2.2.3)
- postgreSQL


# Setup

Clone the app from github and navigate to the project folder
Run this command to install required libraries
```
bundle install
```
Setup db
Create evironment config file config/initializers/dev_env.rb and add the following variables
```
ENV["DEV_DB_URL"] = "postgres://username:password@localhost/dbname"
ENV["TEST_DB_URL"] = "postgres://username:password@localhost/dbname"
ENV["PROD_DB_URL"] = "postgres://username:password@localhost/dbname"
ENV["DATA_PAGE_SIZE"] = "15"
```

Run the following commands
```
rails db:create
rails db:migrate
rails db:seed
```
# Run the tests
```
rspec
```
All tests should be green
# Start the app

- rails s

# Usage

## Sample Requests

### create transaction
- Endpoint: {base_url}/api/v1/transactions
- Request Method: POST
- Body
```
{
    "in_amount": "100.0",
    "in_currency": "KES",
    "out_amount": "110.0",
    "out_currency": "USD",
    "date_of_transaction": "20221017",
    "customer_id":"4c2727b9-833e-4d50-880e-18d063b04bd7"
}

```
### response:

```
{
    "id": "0262ebac-6539-4e17-8a51-7f15306b464d",
    "in_amount": "100.0",
    "in_currency": "KES",
    "out_amount": "110.0",
    "out_currency": "USD",
    "date_of_transaction": "20221017",
    "customer_id": "4c2727b9-833e-4d50-880e-18d063b04bd7",
    "created_at": "2022-10-16T20:43:54.030Z",
    "updated_at": "2022-10-16T20:43:54.030Z"
}
```
### fetch all transactions

- Endpoint: {base_url}/api/v1/transactions
- Request Method: GET
### response:
```
[
    {
        "id": "b0c8b724-1eeb-4f4e-a616-d11562f41f89",
        "in_amount": "100.0",
        "in_currency": "KES",
        "out_amount": "110.0",
        "out_currency": "USD",
        "date_of_transaction": "20221017",
        "surname": "surname_9",
        "othernames": "othernames_9"
    },
    {
        "id": "ee4e5a2d-d7e9-498c-8550-34de6e774c2f",
        "in_amount": "100.0",
        "in_currency": "KES",
        "out_amount": "110.0",
        "out_currency": "USD",
        "date_of_transaction": "20221017",
        "surname": "surname_9",
        "othernames": "othernames_9"
    },
    {
        "id": "9e244f53-836e-423b-84ac-e90bbec76f5a",
        "in_amount": "100.0",
        "in_currency": "KES",
        "out_amount": "110.0",
        "out_currency": "USD",
        "date_of_transaction": "20221017",
        "surname": "surname_9",
        "othernames": "othernames_9"
    },
    {
        "id": "e27f2a9c-d649-4e60-99ee-a5a3c8c51d7d",
        "in_amount": "100.0",
        "in_currency": "KES",
        "out_amount": "110.0",
        "out_currency": "USD",
        "date_of_transaction": "20221017",
        "surname": "surname_9",
        "othernames": "othernames_9"
    },
    {
        "id": "b1d436bb-3a59-427f-82ad-2854ba4d3631",
        "in_amount": "100.0",
        "in_currency": "KES",
        "out_amount": "110.0",
        "out_currency": "USD",
        "date_of_transaction": "20221017",
        "surname": "surname_9",
        "othernames": "othernames_9"
    },
    {
        "id": "f1953fe4-6415-4142-9b82-1bc6e987fa79",
        "in_amount": "100.0",
        "in_currency": "KES",
        "out_amount": "110.0",
        "out_currency": "USD",
        "date_of_transaction": "20221017",
        "surname": "surname_8",
        "othernames": "othernames_8"
    },
    {
        "id": "ed69b290-0c50-48ec-914f-1ac388bfbd07",
        "in_amount": "100.0",
        "in_currency": "KES",
        "out_amount": "110.0",
        "out_currency": "USD",
        "date_of_transaction": "20221017",
        "surname": "surname_8",
        "othernames": "othernames_8"
    },
  ...
]

```
### fetch one transaction

- Endpoint: {base_url}/api/v1/transactions
- Request Method: GET
### response:
```

{
    "id": "b0c8b724-1eeb-4f4e-a616-d11562f41f89",
    "in_amount": "100.0",
    "in_currency": "KES",
    "out_amount": "110.0",
    "out_currency": "USD",
    "date_of_transaction": "20221017",
    "surname": "surname_9",
    "othernames": "othernames_9"
}

```