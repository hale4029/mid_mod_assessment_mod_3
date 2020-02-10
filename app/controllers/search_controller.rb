class SearchController < ApplicationController
  def index
    @service = API.new(params[:house])
  end
end
