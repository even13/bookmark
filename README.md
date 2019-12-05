# Bookmark

In this project we will build a bookmark manager where we can maintain a collection of bookmarks.

# Requirements

# User stories

As a User  
So I can keep track of interesting stuff  
I want to be able to see a list of bookmarks  

As a User  
So I can add a bookmark for an interesting site  
I want to be able to add that bookmark to my list   

As a User  
So I can remove a bookmark I no longer find interesting  
I want to be able to delete that bookmark from my list  

LIST | BOOKMARK
----- | --------
-add_bookmark | -@url / -@name / -@description


# SQL Database Instructions

1. Connect to psql
2. Create the database using the psql command CREATE DATABASE bookmark_manager;
3. Connect to the database using the pqsl command \c bookmark_manager;
4. Run the query we have saved in the file 01_create_bookmarks_table.sql
