class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # Add your routes here
  get "/" do
    { message: "Good luck with your project!" }.to_json
  end

  get "/projects" do
    Project.all.order(
      created_at: :asc
    ).to_json
  end

  get "/users" do
    User.all.to_json
  end

  get "/project_members" do
    ProjectMember.all.to_json
  end

  post '/users' do
    user = User.create(
      username: params[:username],
      email: params[:email],
      password: params[:password]
    ).to_json
  end

  post '/projects' do
    project = Project.create(
      project_name: params[:project_name],
      project_description: params[:project_description],
      project_link: params[:project_link],
      status: params[:status]
    ).to_json
  end

  patch '/projects/:id' do
    project = Project.find(params[:id])
    project.update(
      status: params[:status]
    ).to_json
  end

  post '/project_members' do
    project = Project.find_by(project_name: "#{params[:project_name]}")
    member = User.find_by(email: "#{params[:email]}")
    project_member = ProjectMember.create(
      membername: params[:membername],
      email: params[:email],
      user_id: member === nil ? nil : member.id,
      project_id: project === nil ? nil : project.id
    ).to_json
  end
    
  delete '/projects/:id' do
    project = Project.find(
      params[:id]
    ).destroy.to_json
  end

end
