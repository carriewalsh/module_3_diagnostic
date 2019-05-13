class SearchController < ApplicationController
  def index
    binding.pry
    render locals: {
      facade: SearchFacade.new(params[:zip])
    }
  end
end
