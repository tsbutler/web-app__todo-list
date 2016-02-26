MyApp.get "/user/new" do
  erb :"/users/new"
end

MyApp.post "/user/create" do
  @user = User.new
  @user.name = params["name"]
  @user.email = params["email"]
  @user.password = params["password"]
  @user.save
  redirect "/users/#{@user.id}/profile"
end

MyApp.before "/users*" do
  @current_user = User.find_by_id(session["user_id"]) 
    if @current_user == nil
      redirect "/logins/new"
    end
end

MyApp.get "/users/:id/profile" do
  @current_user = User.find_by_id(session["user_id"]) 
    if @current_user != nil
      @user = User.find_by_id(session["user_id"])
      erb :"users/profile"
    else
      redirect "/logins/new"
    end
end

MyApp.get "/users/:id/edit" do
  @current_user = User.find_by_id(session["user_id"]) 
    if @current_user != nil
      @user = User.find_by_id(session["user_id"])
      erb :"users/edit"
    else
      redirect "/logins/new"
    end
end

MyApp.post "/users/:id/update" do
  @current_user = User.find_by_id(session["user_id"]) 
    if @current_user != nil
      @user = User.find_by_id(session["user_id"])
      @user.name = params["name"]
      @user.email = params["email"]
      @user.password = params["password"]
      @user.save
      erb :"users/update"
    else
      redirect "/logins/new"
    end
end

MyApp.get "/users/:id/form_to_delete_user" do
  @current_user = User.find_by_id(session["user_id"]) 
    if @current_user != nil
      @user = User.find_by_id(session["user_id"])
      erb :"users/delete_user"
    else
      redirect "/logins/new"
    end
end

MyApp.post "/users/:id/deleted" do
  @current_user = User.find_by_id(session["user_id"]) 
    if @current_user != nil
      @user = User.find_by_id(session["user_id"])
      @user.delete
      erb :"users/deleted"
    else
      redirect "/logins/new"
    end  
end


# This controller is for all the CRUD operations related to a User.