# Boulderingtracker-api

Simple API that allows users with `admin` role assigned to create list of **bouldering regions** assigned to specific **countries**. Each **bouldering region** has associated **boulders**. Users with default role `user` can log their **ascents** regarding specific **boulders**.

## Documentation of api/v1 
Documentation for api/v1 is available on wiki [api/v1 documentation wiki](../../wiki)

## Data model diagram - PostgreSQL RDBMS
![Image](https://github.com/user-attachments/assets/0c32266f-94ee-48da-8b39-57f38af18a7d)

## Testing
There are spec files prepared for testing requests with authorization & authentication process. RSpec command is also included in CI pipeline for this repository.
