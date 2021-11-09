# Fitness Trainer

## Table of Contents
1. [Overview](#Overview)
1. [Product Spec](#Product-Spec)
1. [Wireframes](#Wireframes)
2. [Schema](#Schema)

## Overview
### Description
A calendar type app that will keep track of your workouts for the week. It works kind of like a planner. For example, tomorrow I am doing a Push workout, so I would add to my Fitness Trainer that I am doing Bench Press, Dumbbell Bench Press, Incline Dumbbell Press, etc. 

### App Evaluation

- **Category:** Health and Fitness
- **Mobile:** This app is being developed fo rprimarily IOS devices.
- **Story:** [Will come back to it]
- **Market:** Fitness industry
- **Habit:** This app can be sued whenever the user worksout. They can do it before they start a workout and after they finish the workout as well. 
- **Scope:** The user will be able to create an account and start logging and scheduling their workouts. They will also be able to log their sets as they are working out. Some optional stories we are thinking we will be implementing a rest timer and also a macro calculator. 

## Product Spec

### 1. User Stories (Required and Optional)

**Required Must-have Stories**

* - [x] Create a "Login"
* - [x] Create a "Create Account"
* Schedule: Show your schedule that you have already created for yourself
    * Ability to modify or delete
    * Button for redirecting to main
* Create: Create the schedule for the day/week
    * Add sets/reps
    * Add excercise
    * Button for redirecting to main
    

**Optional Nice-to-have Stories**

* Notification if you hit a PR
* Ringtone: Notify your workout for the day with a nice tune, it can be your personal record song
* Add a timer for in between sets; resting period
* Calorie Checker



### 2. Screen Archetypes

* Login
* Create Account
* Main Page
* Schedule
* Create



### 3. Navigation

**Tab Navigation**

* User
* Schedule
* Workouts

**Flow Navigation** (Screen to Screen)

* [list first screen here]
   * [list screen navigation here]
   * ...
* [list second screen here]
   * [list screen navigation here]
   * ...

## Wireframes
<img src="https://i.imgur.com/VD9J5qx.jpg" width=600>

## Schema 
### Models
#### User

   | Property      | Type     | Description                            |
   | ------------- | -------- | ---------------------------------------|
   | objectId      | String   | unique id for the user (default field) |
   | Username      | String   | Name the user wants to go by           |
   | Age           | Int      | The users current age                  |
   | Sex           | String   | The users sex/gender                   |
   | Height        | Int      | How tall the user is in inches         |
   | Weight        | Int      | How much the user weighs in lbs        |
   
#### Workout

   | Property      | Type             | Description                            |
   | ------------- | ---------------- | ---------------------------------------|
   | bodyPart      | String           | what body part the excercise works out |
   | User          | Pointer to User  | The user who is doing this workout     |
   | Name          | String           | Name of the workout                    |
   
### Networking
#### List of network requests by screen
   - Profile Screen
      - (Read/GET) Query logged in user object
      - (Delete) User deletes workout
      - (Update) User adds workout


![](https://i.imgur.com/M8pzZRi.gif)
