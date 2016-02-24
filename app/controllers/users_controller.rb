MyApp.get "/register_user" do
  erb :"/users/register_user"
end

MyApp.post "/registered" do
  @user = User.new
  @user.name = params["name"]
  @user.email = params["email"]
  @user.password = params["password"]
  @user.save
  erb :"users/registered"
end

MyApp.get "/form_to_edit_user" do
  @user = User.find_by_id(session["user_id"])
  erb :"users/edit_user"
end

MyApp.post "/processed" do
  @user = User.find_by_id(session["user_id"])
  @user.name = params["name"]
  @user.email = params["email"]
  @user.password = params["password"]
  @user.save
  erb :"users/processed"
end

MyApp.get "/form_to_delete_user" do
  @user = User.find_by_id(session["user_id"])
  erb :"users/delete_user"
end

MyApp.post "/deleted" do
  @user = User.find_by_id(session["user_id"])
  @user.delete
  erb :"users/deleted"
end


# This controller is for all the CRUD operations related to a User.