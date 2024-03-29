#This is practice project

# SQL-Doctor-Who

## **Before you start**

- Use SQL Server 2016 or above.
- Make sure to create a .sql file for each requirement below.
- Follow GIT best practices you learned to push your script files.

## Requirements

![https://s3-us-west-2.amazonaws.com/secure.notion-static.com/a3ef2ad0-a6f0-4a36-887e-7b7940bed7dd/Untitled.png](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/a3ef2ad0-a6f0-4a36-887e-7b7940bed7dd/Untitled.png)

1. Create a DB named `DoctorWho`.
2. Write scripts to create the above tables, keys, relationships and constraints.
3. Write scripts to insert at least 5 records in each table.
4. Write a script to update the the episode name to `{ORIGINAL_EPISODE_NAME}_CANCELLED` for only the episodes with zero doctor appearances.
5. Write a query to delete all companions who didn't appear on an episode.
6. Create a function called **`fnCompanions`** to printout the companions names for a given episode
    - **Input:** `EpisodeId`
    - **Output**: Companion 1 Name, Companion 2 Name, Companion 3 Name, etc.
7. Create a function called **`fnEnemies`** to printout the enemies names for a given episode
    - **Input**: `EpisodeId`
    - **Output**: Enemy 1 Name, Enemy 2 Name, Enemy 3 Name, etc.
8. Create a SQL view called **`viewEpisodes`** to list out all episodes, include:
    - Author Name
    - Doctor Name
    - Companions
    - Enemies
        
        **P.S.** Make use of the previous created functions
        
9. Create a stored procedure called **`spSummariseEpisodes`** to show:
    - The 3 most frequently-appearing companions; then separately
    - The 3 most frequently-appearing enemies.
