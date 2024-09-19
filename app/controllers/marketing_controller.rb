class MarketingController < ApplicationController
  layout "marketing"
  def index
    @title = "Marketing Title"
  end
end
