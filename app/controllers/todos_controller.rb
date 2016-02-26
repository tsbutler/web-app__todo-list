MyApp.before "/todo*" do
  @current_user = User.find_by_id(session["user_id"]) 
    if @current_user == nil
      redirect "/logins/new"
    end
end

MyApp.get "/todos/new" do
  @categories = Category.all
  erb :"todos/new"
end

MyApp.post "/todos/create_item" do
  @categories = Category.all
  @todo = Todo.new
  @todo.title = params["title"]
  @todo.description = params["description"]
  @todo.category_id = params["category_id"]
  @todo.user_id = params["user_id"]
  @todo.created_by = session["user_id"]
  @todo.completed = params["completed"]
  @todo.save
  redirect "/todos/index"
end

MyApp.get "/todos/index" do
  @todos = Todo.all
  erb :"todos/index"
end

MyApp.get "/todos/:id/edit" do
  @categories = Category.all
  @todo = Todo.find_by_id(params["id"])
  erb :"todos/edit"
end

MyApp.post "/todos/:id/update" do
  @categories = Category.all
  @todo = Todo.find_by_id(params["id"])
  @todo.title = params["title"]
  @todo.description = params["description"]
  @todo.category_id = params["category_id"]
  @todo.user_id = params["user_id"]
  @todo.created_by = session["user_id"]
  @todo.completed = params["completed"]
  @todo.save
  redirect "/todos/index"
end

MyApp.get "/todos/:id/form_to_delete_todo" do
  @todo = Todo.find_by_id(params["id"])
  erb :"todos/delete_todo"
end

MyApp.post "/todos/:id/deleted" do
  @todo = Todo.find_by_id(params["id"])
  @todo.delete
  redirect "/todos/index"
end

# This controller is for all the CRUD operations related to a Todo.

