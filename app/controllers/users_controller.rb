MyApp.get "/users/new" do
  erb :"/users/new"
end

MyApp.post "/users/create" do
  @user = User.new
  @user.name = params["name"]
  @user.email = params["email"]
  @user.password = params["password"]
  @user.save
  erb :"users/create"
end

MyApp.get "/users/:id/profile" do
  @current_user = User.find_by_id(session["user_id"]) 
    if @current_user != nil
      @user = User.find_by_id(session["user_id"])
      erb :"users/profile"
    else
      erb :"users/log_in_first"
    end
end

MyApp.get "/users/edit" do
  @current_user = User.find_by_id(session["user_id"]) 
    if @current_user != nil
      @user = User.find_by_id(session["user_id"])
      erb :"users/edit"
    else
      erb :"users/log_in_first"
    end
end

MyApp.post "/users/update" do
  @current_user = User.find_by_id(session["user_id"]) 
    if @current_user != nil
      @user = User.find_by_id(session["user_id"])
      @user.name = params["name"]
      @user.email = params["email"]
      @user.password = params["password"]
      @user.save
      erb :"users/update"
    else
      erb :"users/log_in_first"
    end
end

MyApp.get "/users/form_to_delete_user" do
  @current_user = User.find_by_id(session["user_id"]) 
    if @current_user != nil
      @user = User.find_by_id(session["user_id"])
      erb :"users/delete_user"
    else
      erb :"users/log_in_first"
    end
end

MyApp.post "/users/deleted" do
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