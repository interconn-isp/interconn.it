require 'rails_helper'

RSpec.describe ProjectsController do
  describe "GET 'index'" do
    it 'loads the projects' do
      projects = [Project.new]

      Project
        .expects(:all)
        .once
        .returns(projects)

      get :index
      expect(assigns(:projects)).to eq(projects)
    end
  end
end
