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

MyApp.get "/current_user" do
  @current_user = User.find_by_id(session["user_id"]) 
    if @current_user != nil
      @user = User.find_by_id(session["user_id"])
      erb :"users/current_user"
    else
      erb :"users/log_in_first"
    end
end

MyApp.get "/form_to_edit_user" do
  @current_user = User.find_by_id(session["user_id"]) 
    if @current_user != nil
      @user = User.find_by_id(session["user_id"])
      erb :"users/edit_user"
    else
      erb :"users/log_in_first"
    end
end

MyApp.post "/processed" do
  @current_user = User.find_by_id(session["user_id"]) 
    if @current_user != nil
      @user = User.find_by_id(session["user_id"])
      @user.name = params["name"]
      @user.email = params["email"]
      @user.password = params["password"]
      @user.save
      erb :"users/processed"
    else
      erb :"users/log_in_first"
    end
end

MyApp.get "/form_to_delete_user" do
  @current_user = User.find_by_id(session["user_id"]) 
    if @current_user != nil
      @user = User.find_by_id(session["user_id"])
      erb :"users/delete_user"
    else
      erb :"users/log_in_first"
    end
end

MyApp.post "/deleted" do
  @current_user = User.find_by_id(session["user_id"]) 
    if @current_user != nil
      @user = User.find_by_id(session["user_id"])
      @user.delete
      erb :"users/deleted"
    else
      erb :"users/log_in_first"
    end  
end


# This controller is for all the CRUD operations related to a User.