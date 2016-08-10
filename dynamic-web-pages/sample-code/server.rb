require "sinatra"

get "/tasks" do
  @tasks = File.readlines("tasks.txt")
  erb :index
end

get "/tasks/:task_name" do
  @tasks = params[:task_name]
  erb :show
end

post "/tasks" do
  task = params["task_name"]

  File.open("tasks.txt", "a") do |file|
    file.puts(task)
  end

  redirect "/tasks"
end
