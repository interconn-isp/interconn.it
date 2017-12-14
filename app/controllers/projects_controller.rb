# frozen_string_literal: true

class ProjectsController < ApplicationController
  respond_to :html

  def index
    @projects = Project.all
    respond_with @projects
  end
end
