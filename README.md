# README

I have hit a snag with my rails 7 hotwire forum.
A RequestForgeryProtection error that seems to be caused when combining an after_create_commit broadcast with a button_to in the partial.
Very similar to the error mentioned here:  https://issueexplorer.com/issue/hotwired/turbo-rails/243 

I created a basic rails new app to reproduce the error,  scaffolded some Posts and then only added two of my own lines of code,

`after_create_commit -{ broadcast_prepend_to 'posts' }` in the post model,  and,
`<%= button_to "Delete post", post, method: :delete %>` in the  _post.html.erb partial.


Now creating a new Post generates this error
```
ActionController::RequestForgeryProtection::DisabledSessionError in Posts#create

Showing /home/brycetelfer/code/hotwire-issue/app/views/posts/_post.html.erb where line #9 raised:

Request forgery protection requires a working session store but your application has sessions disabled. You need to either disable request forgery protection, or configure a working session store.

Extracted source (around line #9):
7
8
9
10
11
             
  <p>
    <%= link_to "Show this post", post %>
    <%= button_to "Delete post", post, method: :delete %>
  </p>
</div>
>
Rails.root: /home/brycetelfer/code/hotwire-issue

Application Trace | Framework Trace | Full Trace
app/views/posts/_post.html.erb:9
app/models/post.rb:3:in `block in <class:Post>'
app/controllers/posts_controller.rb:27:in `block in create'
app/controllers/posts_controller.rb:26:in `create'
```