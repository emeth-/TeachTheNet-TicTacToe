== README
Project Odin Ruby on Rails project "Micro Reddit".  This is essentially a miniature command line Reddit-type interface.  Users can be created, those users can create posts, and each user can comment on any other post. 

This project was a test of Rails ActiveRecord associations.


Sample output:

Loading development environment (Rails 4.0.4)

2.0.0-p451 :001 > u2=User.find(2)
  User Load (2.9ms)  SELECT "users".* FROM "users" WHERE "users"."id" = ? LIMIT 1  [["id", 2]]
 => #<User id: 2, name: "User Number 2", email: "user2@number2.com", created_at: "2014-07-02 13:45:38", updated_at: "2014-07-02 13:45:38"> 

2.0.0-p451 :002 > c1=u2.comments.first
  Comment Load (0.2ms)  SELECT "comments".* FROM "comments" WHERE "comments"."user_id" = ? ORDER BY "comments"."id" ASC LIMIT 1  [["user_id", 2]]
 => #<Comment id: 2, content: "This is the second comment!", post_id: 1, user_id: 2, created_at: "2014-07-02 13:47:20", updated_at: "2014-07-02 13:47:20"> 

2.0.0-p451 :003 > c1.user
  User Load (1.2ms)  SELECT "users".* FROM "users" WHERE "users"."id" = ? LIMIT 1  [["id", 2]]
 => #<User id: 2, name: "User Number 2", email: "user2@number2.com", created_at: "2014-07-02 13:45:38", updated_at: "2014-07-02 13:45:38"> 

2.0.0-p451 :004 > p1=Post.first
  Post Load (0.2ms)  SELECT "posts".* FROM "posts" ORDER BY "posts"."id" ASC LIMIT 1
 => #<Post id: 1, content: "test user 1", user_id: 1, created_at: "2014-07-02 13:35:26", updated_at: "2014-07-02 13:35:26"> 

2.0.0-p451 :005 > p1.comments.first
  Comment Load (1.3ms)  SELECT "comments".* FROM "comments" WHERE "comments"."post_id" = ? ORDER BY "comments"."id" ASC LIMIT 1  [["post_id", 1]]
 => #<Comment id: 1, content: "Testing the first comment", post_id: 1, user_id: 1, created_at: "2014-07-02 13:44:10", updated_at: "2014-07-02 13:44:10"> 
 
2.0.0-p451 :006 > c1.post
  Post Load (1.2ms)  SELECT "posts".* FROM "posts" WHERE "posts"."id" = ? LIMIT 1  [["id", 1]]
 => #<Post id: 1, content: "test user 1", user_id: 1, created_at: "2014-07-02 13:35:26", updated_at: "2014-07-02 13:35:26"> 