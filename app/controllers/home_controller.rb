class HomeController < ApplicationController
  def index
    @posts = SamplePost.all
  end
end
