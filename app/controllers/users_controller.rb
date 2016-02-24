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
# This controller is for all the CRUD operations related to a User.