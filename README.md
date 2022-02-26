# BefriendRails

The app is in development stage. To report a bug or suggest a feature please feel free to [create an issue(s)](https://github.com/UD-Designs-Lab/befriend-rails/issues/new)

# Getting Started

To start testing this web service, you need to have `ruby 2.6.3`, `MySQL` and `Rails 6.0` installed on your Mac or PC.
It's also important noting that I preferred using `jbuilder` to `Active Model Serializers` for json handling.

- Clone this repository
- `cd` into the folder
- Run `bundle install`
- Run `rails db:create && rails db:migrate`
- Run `rails server`

## Register/Login

- Register -`POST /users/`
- Login - `POST /sessions/`
  ```json
  {
    "user": {
      "email": "johndore@some_email.com",
      "username": "johndore",
      "password": "somepassword"
    }
  }
  ```

2. Get the current user:

   ` GET /sessions/current_user/`

3. Get all the users of the App:

   `GET /users/`

## Posts/Stories

1. Create a post

   `POST /posts/`

   ```json
   {
     "body": "some amazing story you ever want to share with your connections",
     "image": "image url",
     "reply_status": "everyone"
   }
   ```

   **NOTE**: `reply_status` is defaulted to `everyone` so it MUST be included on every Json input. What `everyone` does is it makes the post commentable by anybody. To restrict who can comment on your post use `people_you_know` instead. It is also worth noting that, the "image" option when creating a post(s) is OPTIONAL and integrating `Cloudinary` into the app for image storage and stuff is a work in progress.

2. UPDATE a Post

   `PUT /posts/${post_id}/`

   ```json
   {
     "body": "Make some changes",
     "image": "image url",
     "reply_status": "everyone"
   }
   ```

3. DELETE a post/

   `DELETE /posts/${post_id}/`

4. SHOW a post by an individual user (including all reactions and comments on the post).

   `GET /posts/${uuid}/`

   **NOTE**: To get uuid execute `GET /users/$username}/` and extract the same under your desired post block.

5. SHOW all the app user’s posts, reposts, comments and reactions by individual user

   `GET /users/${username}/`

## Reposts

1. Create a repost of a story
   `POST /reposts/${repost_id}/reposts`

   ```json
   {
     "repost": {
       "body": "Some quote/comment why you want to reshare story"
     }
   }
   ```

2. Create a repost on a repost
   `POST /reposts/${repost_id}/reposts`

   ```json
   {
     "repost": {
       "body": "Some quote/comment why you want to reshare story"
     }
   }
   ```

3. Get all reposts
   `GET reposts/`

4. Delete a repost
   `DELETE /reposts/${id}/`

## Comments

1.  Comment on a post

    `POST /posts/${post_id}/comments/`

    ```json
    {
      "comment": {
        "content": "some content"
      }
    }
    ```

2.  Comment on a comment

    `POST /comments/${comment_id}/comments/`

    ```json
    {
      "comment": {
        "content": "some content"
      }
    }
    ```

3.  Update a comment

    `PUT /posts/${post_id}/comments/$comment_id}/`

    ```json
    {
      "comment": {
        "content": "some new content"
      }
    }
    ```

4.  Delete a Comment

    `DESTROY /comments/${comment_id}/`

5.  Comment on a Re-post

    `POST /comments/${comment_id}/reposts`

    ```json
    {
      "repost": {
        "body": "Quote something that caught your attention that bad that you had to re-post the story/post"
      }
    }
    ```

## Reactions

You can react with a `LIKE`, `THUMBS UP` and/or `SMILE`. Below is an example of liking/unliking posts and comments.

1. Shows a post

   `GET /posts/${uuid}/`

2. Like/Unlike a post

   `POST /posts/${post_id}/vote_like/`

3. Like/Unlike a comment

   `POST /comments/${comment_id}/vote_like/`

**NOTE**: To react on a post/comment with a THUMBS UP or SMILE, substitute `vote_like` with `vote_thumbs_up` and `vote_smile` respectively.

## Favourites

1. Favourite a post/story
   `POST /posts/${post_id}/favourites`

2. Favourite a comment on a post/story
   `POST comments/${comment_id}/favourites`

3. Favourite a re-post
   `POST /reposts/${repost_id}/favourites`

4. Get all your favourited posts/stories
   `GET /users/${user_id}/favourites`

5. Delete a favourited post
   `DELETE /favourites/${favourite_id}`

## Follow & Unfollow

1. Follow a user
   `POST /relationships/`

   ```json
   {
     "id": "Enter id"
   }
   ```

2. Unfollow user
`DELETE /relationships/id/`
<!--
3. Get all followers for a given user
   `GET /users/${user_id}/following/`

4. Get all users a user is following
   `GET /users/${user_id}/followers` -->

## To do

1. Auth (Google/Twitter)
2. Following - Get followers and following
