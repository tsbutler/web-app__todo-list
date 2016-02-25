MyApp.get "/logins/new" do
    # Show form that lets a person create a new login
    erb :"logins/new"
end

MyApp.post "/logins/create" do
    # Process the form to log a person in.
    @user = User.find_by_email(params["email"])
    if @user.password == params["password"]
      session["user_id"] = @user.id
      
      redirect "/users/#{session["user_id"]}/profile"
    else
      erb :"logins/failed"
    end
end

MyApp.get "/logins/log_out" do
  @current_user = User.find_by_id(session["user_id"]) 
    if @current_user != nil
      session["user_id"] = nil
      erb :"/logins/log_out"
    else
      erb :"users/log_in_first"
    end  
end

# This controller is for all the CRUD operations related to a Login.

# Note that "logins" are not stored in the database. But there is still
# a reasonable way to think about a "login" as a resource which is created
# and deleted (i.e. 'logging out').
# 
# Reading and Updating a login, however, make a little less sense.
