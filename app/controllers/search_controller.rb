class SearchController < ApplicationController
  def index
    render locals: {
      facade: SearchFacade.new(params[:zip])
    }
  end
end
