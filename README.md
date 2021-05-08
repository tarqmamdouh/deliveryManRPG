<div align="center">
  <img src="https://github.com/tarqmamdouh/tarqmamdouh.github.io/blob/master/imgs/icon.png" width="110" height="110"/>
</div>
<br/>

# Delivery Man In The Era of Invasion 

<p align="center">
  <strong>Welcome to Delivery Man. An offline, 2D RPG game using pure ruby code with activerecord and sqllite3.</strong>
  <br/>
  <br/>
  <img width="704" alt="Game screenshot" src="https://github.com/tarqmamdouh/deliveryManRPG/blob/main/imgs/demo.gif">
</p>

<br/>

## Before you start

Before you start installation you need to make sure that you have the following prerequisites installed:-

1 - **ruby -v 3.0.0**

2 - **sqllite3 >= 1.4.2** 

3 - **bundler >= 2.2.3**


## Getting Started

1 - Clone this repo 

```git clone https://github.com/tarqmamdouh/deliveryManRPG```

2 - Navigate to repo folder

```cd deliveryManRPG```

3 - Install libraries 

```bundle install```

4 - Setup required database
  ```
    # create database 
    rake db:create
    
    # migrate database
    rake db:migrate
    
    # Seed All game data inside database
    rake db:seed
  ```


## Run the game

The game starting file is `delivery_man.rb` you should run ```ruby delivery_man.rb```.

Please make your console in full screen for better playing experience

## Run Tests

* To run all tests 

    ```rspec```

* To run certain test 

    ```rspec spec/path/to/<FILE NAME>.rb```

## Feedback 

  Any questions or suggestions?

  You are welcome to discuss it
