# 📊 Netflix Data Analysis SQL Project

This project contains a comprehensive data analysis of Netflix content using PostgreSQL. The goal was to explore, clean, and extract meaningful insights from a dataset containing details about movies and TV shows available on Netflix.

---

## 🗂️ Project Structure

- **Database Creation**: Creating a PostgreSQL database and table structure.
- **Data Exploration**: Running SQL queries to analyze content trends, popular genres, top actors, and more.
- **Use Cases Covered**:
  - Type comparison between Movies and TV Shows
  - Popularity of ratings across content types
  - Year-wise content analysis
  - Country-wise content count
  - Keyword-based content classification
  - Actor-based content filtering
  - Duration-based TV Show filters

---

## 🛠️ Technologies Used

- **Database**: PostgreSQL
- **Language**: SQL

---

## 📌 Key SQL Queries

Here are some of the key analytical questions answered in the project:

1. Count the number of Movies vs TV Shows
2. Find the most common rating for movies and TV shows
3. List all movies released in a specific year (e.g., 2020)
4. Identify top 5 countries with the most content on Netflix
5. Find the longest movie available
6. Discover content added in the last 5 years
7. Fetch all titles by director 'Rajiv Chilaka'
8. List TV Shows with more than 5 seasons
9. Count of content items in each genre
10. Average number of content releases in India by year (Top 5)
11. Find all movies categorized as Documentaries
12. Identify content with and without a listed director
13. Count how many movies 'Salman Khan' appeared in over the last 10 years
14. Top 10 actors in Indian content based on appearances
15. Categorize content as "Good" or "Bad" based on keywords like *kill* and *violence*

---

## 📁 Dataset Details

This project assumes the dataset is already cleaned and imported into a PostgreSQL table called `netflix_`. It includes fields like `title`, `type`, `release_year`, `director`, `casts`, `country`, `rating`, `duration`, and `description`.

---

## ✅ How to Use

1. Clone this repository
2. Import the dataset into your PostgreSQL environment
3. Run the SQL queries provided in the file
