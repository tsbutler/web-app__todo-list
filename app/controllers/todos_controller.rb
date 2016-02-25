MyApp.get "/todos/new" do
  erb :"todos/new"
end

MyApp.get "/todos/list" do
  @todos = Todo.all
  erb :"todos/todo_list"
end
# This controller is for all the CRUD operations related to a Todo.