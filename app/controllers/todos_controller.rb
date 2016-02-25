MyApp.get "/todos/new" do
  @todos = Todo.new
  @todos.title = params["title"]
  @todos.description = params["description"]
  @todos.completed = params["completed"]
  @todos.user_id = params["user_id"]
  @todos.save
  erb :"todos/new"
end

MyApp.get "/todos/list" do
  @todos = Todo.all
  erb :"todos/todo_list"
end

MyApp.get "/todos/edit_todo" do
  @todo = Todo.find_by_id(session["user_id"])
  erb :"todos/edit_todo"
end

MyApp.post "/todos/processed" do
  @todos = Todo.find_by_id(session["user_id"])
  @todos.title = params["title"]
  @todos.description = params["description"]
  @todos.completed = params["completed"]
  @todos.user_id = params["user_id"]
  @todos.save
  erb :"todos/new"
end

# This controller is for all the CRUD operations related to a Todo.

