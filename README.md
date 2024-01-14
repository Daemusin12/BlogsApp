# BlogsApp

This web application provides a platform for users to share their thoughts and ideas through blog posts. my application allows you to create, view, and manage blog content effortlessly.

Features:

User Authentication:
Users can create accounts, log in, and log out.
Authentication is required for actions such as creating and deleting blog posts.

Blog Listing:
The homepage displays a paginated list of blog posts.
Each blog post includes the title, body, author details, and user feedback.

Individual Blog Post View:
Clicking on a blog post title leads to a dedicated page displaying the full content of the post.
User feedback on the blog post is visible, including the user who provided the feedback.

Blog Creation:
Authenticated users can create new blog posts.
The blog creation form includes fields for the title and body of the post.

Email Notification:
Enhances user engagement by notifying them when new feedback is received. This promotes a sense of community and encourages continued participation.

Blog Deletion:
Admin users have the privilege to delete blog posts.
Non-admin users attempting to delete a post receive an authorization alert.

Technical Details:
The application is built using the Ruby on Rails framework, ensuring a robust and maintainable codebase. Key technical features include:

User Authentication:
Utilizes Rails' built-in authentication mechanism to secure specific actions.

Database Interactions:
Uses PostgreSQL as the database engine.
Implements ActiveRecord for seamless database interactions.

Pagination:
Implements pagination for both the list of blogs and the feedback section of individual blog posts.

Authorization:
Admin user are granted special privileges, such as the ability to delete blog posts.


These instructions will guide you on how to set up and run the project on your local machine for development and testing purposes.

### Prerequisites

Make sure you have the following installed:

- [Ruby](https://www.ruby-lang.org/en/documentation/installation/)
- [Ruby on Rails](https://guides.rubyonrails.org/getting_started.html#installing-rails)
- [PostgreSQL](https://www.postgresql.org/download/)

### Clone the Repository

git clone https://github.com/Daemusin12/BlogsApp.git

### Config Database

Edit config/database.yml to configure your database settings

bundle install
rails db:create
rails db:migrate 

rails db:seed (to create the admin user, see seed file)

### Configure SMTP for Email Sending

development:
  SMTP_USERNAME: your_smtp_username
  SMTP_PASSWORD: your_smtp_password
  SMTP_ADDRESS: smtp.your-email-provider.com
  SMTP_DOMAIN: your-email-provider.com
  SMTP_PORT: 587
  SMTP_AUTHENTICATION: login
  SMTP_ENABLE_STARTTLS_AUTO: true

### Run the Application

rails server

### For testing

rails test