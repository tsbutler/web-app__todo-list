MyApp.post "/register_user" do
  @user = User.new
  @user.name = params["name"]
  @user.email = params["email"]
  @user.password = params["password"]
  @user.save
end
# This controller is for all the CRUD operations related to a User.