class PagesController < ApplicationController
  skip_before_action :verify_authenticity_token

  def home
    @pets = Pet.all

  end
end
