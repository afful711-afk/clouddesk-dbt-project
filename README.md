
# CloudDesk Data Warehousing Project

## Project Overview

This project demonstrates the development of a data transformation pipeline using dbt Core, Google BigQuery, and SQL.

The CloudDesk dataset contains customer accounts, users, subscriptions, and support tickets. The goal is to transform raw operational data into structured analytical models that support customer and service performance reporting.

## Tools and Technologies

- Google BigQuery
- dbt Core
- SQL
- Visual Studio Code
- Git and GitHub

## Data Sources

Four raw data sources are used:

1. Accounts
2. Users
3. Subscriptions
4. Tickets

## Data Transformation Pipeline

The project follows three modeling layers.

### Staging Layer
Staging models clean, rename, and standardize raw data fields.

- stg_accounts
- stg_users
- stg_subscriptions
- stg_tickets

### Intermediate Layer
Intermediate models perform transformations and prepare data for analysis.

- int_account_user_counts
- int_tickets

### Mart Layer
Final analytical tables support business reporting.

- dim_account: Customer account information and user counts.
- fct_tickets: Support ticket activity, status, and resolution times.

## Data Quality Testing

The project includes eight data-quality tests covering:

- Unique identifiers
- Non-null identifiers
- Accepted ticket status values
- Relationships between tickets and customer accounts
- A custom business rule preventing negative ticket resolution times

Tests include documentation explaining their consequences for business reporting if they fail.

## SCD Type 2 Snapshot

The subscriptions_snapshot tracks historical subscription records using the timestamp strategy.

- Unique key: subscription_id
- Update timestamp: updated_at

The snapshot maintains validity timestamps that help distinguish current and historical versions.

## Execution and Validation

The eight CloudDesk models and eight data-quality tests completed successfully.

Commands:

```bash
dbt run
dbt test
dbt docs generate
```

A successful combined build was also completed using:

```bash
dbt build --exclude subscriptions_snapshot
```

### BigQuery Sandbox Limitation

The initial subscription snapshot was created successfully.

However, subsequent snapshot execution encountered a BigQuery sandbox billing restriction because DML operations are not supported without billing enabled.

The models and tests were therefore validated separately from the repeat snapshot operation.

## Project Structure

- models/staging: Source cleaning
- models/intermediate: Intermediate transformations
- models/marts: Analytical fact and dimension tables
- snapshots: Subscription history tracking
- tests: Custom SQL business-rule tests

## Conclusion

This project demonstrates how dbt can transform raw operational data into tested and documented analytical models. It highlights data quality, model dependencies, historical data tracking, and reproducible SQL transformations.
