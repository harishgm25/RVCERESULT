class WelcomeController < ApplicationController
  def index

  	redirect_to :controller => 'results', :action => 'getresult'
  end
end
