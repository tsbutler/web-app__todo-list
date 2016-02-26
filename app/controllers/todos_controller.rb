MyApp.get "/todos/new" do
  @current_user = User.find_by_id(session["user_id"]) 
    if @current_user != nil
      @categories = Category.all
      erb :"todos/new"
    else
      erb :"users/log_in_first"
    end
end

MyApp.post "/todos/create_item" do
  @current_user = User.find_by_id(session["user_id"]) 
    if @current_user != nil
      @categories = Category.all
      @todos = Todo.new
      @todos.title = params["title"]
      @todos.description = params["description"]
      @todos.category_id = params["category_id"]
      @todos.user_id = params["user_id"]
      @todos.created_by = session["user_id"]
      @todos.completed = params["completed"]
      @todos.save
      erb :"todos/list_item_created"
    else
      erb :"users/log_in_first"
    end
end

MyApp.get "/todos/list" do
  @current_user = User.find_by_id(session["user_id"]) 
    if @current_user != nil
      @todos = Todo.all
      erb :"todos/todo_list"
    else
      erb :"users/log_in_first"
    end
end

MyApp.get "/todos/:id/edit_todo" do
  @current_user = User.find_by_id(session["user_id"]) 
    if @current_user != nil
      @todo = Todo.find_by_id(params["id"])
      erb :"todos/edit_todo"
    else
      erb :"users/log_in_first"
    end
end

MyApp.post "/todos/:id/processed" do
  @current_user = User.find_by_id(session["user_id"]) 
    if @current_user != nil
      @todos = Todo.find_by_id(params["id"])
      @todos.title = params["title"]
      @todos.description = params["description"]
      @todos.completed = params["completed"]
      @todos.user_id = params["user_id"]
      @todos.save
      erb :"todos/processed"
    else
      erb :"users/log_in_first"
    end
end

MyApp.get "/todos/:id/form_to_delete_todo" do
  @current_user = User.find_by_id(session["user_id"]) 
    if @current_user != nil
      @todo = Todo.find_by_id(params["id"])
      erb :"todos/delete_todo"
    else
      erb :"users/log_in_first"
    end
end

MyApp.post "/todos/:id/deleted" do
  @current_user = User.find_by_id(session["user_id"]) 
    if @current_user != nil
      @todo = Todo.find_by_id(params["id"])
      @todo.delete
      erb :"todos/deleted"
    else
      erb :"users/log_in_first"
    end  
end
# This controller is for all the CRUD operations related to a Todo.

