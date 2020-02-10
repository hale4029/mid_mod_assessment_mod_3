class SearchController < ApplicationController
  def index
    conn = API.new(params[:house])
    members = conn.members
  end
end
