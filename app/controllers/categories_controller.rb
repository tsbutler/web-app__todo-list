MyApp.get "/categories/new" do
  erb :"categories/new"
end

MyApp.post "/categories/create" do
  @category = Category.new
  @category.category = params["category"]
  @category.save
  
  redirect "/categories"
end

MyApp.get "/categories/:id/edit" do
  @category = Category.find_by_id(self.id)
  erb :"categories/edit"
end

MyApp.post "/categories/:id/update" do
  @category = Category.find_by_id(self.id)
  @category = params["category"]
  @category.save

  redirect "/categories"
end

MyApp.post "/categories/:id/delete" do
  @category = Category.find_by_id(self.id)
  




CRUD for User

- app
  - views
    - users
    - Name all folders in 'views' based on the CONTROLLER they deal with.

Lists all users           | GET  /users            | index.erb | @users = User.all
Shows one user            | GET  /users/:id        | show.erb  | @user = User.find_by_id(params[:id])

New User (Form)           | GET  /users/new        | new.erb   | 
Processes New User Form   | POST /users/create     | 

Edit User (Form)          | GET  /users/:id/edit   | edit.erb  | @user = User.find_by_id(params[:id])
Processes Edit User Form  | POST /users/:id/update |           | @user = User.find_by_id(params[:id])

Deletes a User            | POST /users/:id/delete |           | @user = User.find_by_id(params[:id])

------------------------

Searches for a user       | GET  /users/search
Toggles some user's value | POST /users/:id/toggle_admin_access