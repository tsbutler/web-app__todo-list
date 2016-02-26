MyApp.get "/categories" do
  @categories = Category.all
  erb :"categories/index"
end

MyApp.get "/categories/new" do
  erb :"categories/new"
end

MyApp.post "/categories/create" do
  @category = Category.new
  @category.category = params["category"]
  @category.save
  
  redirect "/categories"
end

MyApp.get "/categories/:id" do 
  @category = Category.find_by_id(params["id"])
  erb :"categories/show"
end

MyApp.get "/categories/:id/edit" do
  @category = Category.find_by_id(params["id"])
  erb :"categories/edit"
end

MyApp.post "/categories/:id/update" do
  @category = Category.find_by_id(params["id"])
  @category = params["category"]
  @category.save

  redirect "/categories"
end

MyApp.post "/categories/:id/delete" do
  @category = Category.find_by_id(params["id"])

  redirect "/categories"
end
