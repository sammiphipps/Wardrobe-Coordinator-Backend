# Wardrobe Coordinator Backend

This is the backend API for the frontend of the Wardrobe Coordinator. The frontend is an application that allows users to keep track of the current clothing items and their favorite outfits. As such, the backend keeps track of the different users, clothing categories, clothing items and favorite outfits.  

## Routes Available: 
Below is a list of the different routes that are available. Due to the way that the frontend is setup, some of the routes may only allow a specific HTTP Verb.

* Login
* Users 
* Clothing Items 
* User Clothing Items 
* Clothing Categories 
* Outfits 
* User Outfits
* Outfit Items 
* Multiple Outfit Items


## Instruction 
1. Download the repo by forking it and then using git clone in the folder you wish to put it
2. Install all of the dependencies that are required by bundle installing
3. Create the database on your computer by running rails db:create
4. Migrate all of the tables by using rails db:migrate
5. (Optional) Run rails db:seed if you would just like to view and use the current database information
6. Run the server by typing in rails s
7. Follow the instructions for downloading and running the frontend section at https://github.com/sammiphipps/Wardrobe-Coordinator-Frontend. 
8. Enjoy
