Rails.application.routes.draw do
  resources :properties

# routes for user
post "/login", to:"session#login"
delete "/logout", to:"session#logout"
get "/current_user", to:"users#loggedin_user"
get "/user", to:"users#index"
get "/user/:id", to:"users#show"
post "/user", to:"users#create"
patch "/user/:id", to:"users#update"
delete "/user/:id", to:"users#destroy"


# routes for blogs
get "/blog", to:"blogs#index"
get "/blog/:id", to:"blogs#show"
post "/blog", to:"blogs#create"
patch "/blog/:id", to:"blogs#update"
delete "/blog/:id", to:"blogs#destroy"

# routes for properties
get "/property", to:"properties#index"
get "/property/:id", to:"properties#show"
post "/property", to:"properties#create"
patch "/property/:id", to:"properties#update"
delete "/property/:id", to:"properties#destroy"
get "/approvedproperties", to:"properties#approvedproperties"
patch "/properties/approve/:id", to:"properties#approve"
end
