# My Avatar Team API

[![Build Status](https://travis-ci.com/kevxo/my_team_avatar.svg?branch=main)](https://travis-ci.com/kevxo/my_team_avatar)

## Project Description:

  Using [Avatar The Last Airbender API](https://last-airbender-api.herokuapp.com/), I went ahead and created my own API where a user with Authorization can create their own Team Avatar. A user is able to see all the Avatars available and 3 random team mates to have. Once the user signs up and receives their API key, the user is granted the ability to make their Team Avatar.

## Heroku App
  - https://my-team-avatar-api.herokuapp.com/
  - Use of Postman is Recommended

## Local
  - ruby >= 2.5
  - rails >= 5
  - git clone repo
  - rails db:migrate
  - rails s
  - Use Postman
  - http://127.0.0.1:3000


## Database

  ![Untitled](https://user-images.githubusercontent.com/63522369/122133307-6ede7680-ce0a-11eb-96ed-8c3c101d830e.png)

## Endpoints
  ### All Avatars
  - GET /api/v1/avatars
  ![Screen Shot 2021-06-15 at 6 11 35 PM](https://user-images.githubusercontent.com/63522369/122131073-a0edd980-ce06-11eb-9121-fce4a0715aa1.png)

  ### Get Single Avatar

  -GET /api/v1/avatars/:avatar_id

  ![Screen Shot 2021-06-15 at 6 36 50 PM](https://user-images.githubusercontent.com/63522369/122132358-ae0bc800-ce08-11eb-9e61-e553b1a742f3.png)

### Possible Team Mates
  - GET /api/v1/team_mates?count=10
  ![Screen Shot 2021-06-15 at 6 12 41 PM](https://user-images.githubusercontent.com/63522369/122131177-c7ac1000-ce06-11eb-8093-2dac28995f9e.png)

  ### Create User
  - POST /api/v1/users
  - JSON Payload

  ```
  {
    "email": "kevxo@gmail.com",
    "password": "Kevxo09",
    "password_confirmation": "Kevxo09"
  }
  ```

  ![Screen Shot 2021-06-15 at 6 13 27 PM](https://user-images.githubusercontent.com/63522369/122130440-9e3eb480-ce05-11eb-8101-7931dfd047d1.png)


  ### User Login
  - POST /api/v1/session
  - JSON Payload

  ```
  {
    "email": "kevxo@example.com",
    "password": "Kevxo09"
  }
  ```
![Screen Shot 2021-06-15 at 6 32 47 PM](https://user-images.githubusercontent.com/63522369/122132083-350c7080-ce08-11eb-8a4d-5ab4d3c962c0.png)


  ### Create Team
- POST /api/v1/avatar_team
- JSON Payload
    ```
    {
      "name": "Team Hero",
      "api_key": "45ce0978-123b-4bf0-b80c-b0adafa2ccef"
    }
    ```

![Screen Shot 2021-06-15 at 6 13 05 PM](https://user-images.githubusercontent.com/63522369/122130417-967f1000-ce05-11eb-8fb0-c46c241dd840.png)
