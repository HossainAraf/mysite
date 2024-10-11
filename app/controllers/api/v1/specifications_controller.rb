class Api::V1::SpecificationsController < ApplicationController
  def index 
    specifications = Specification.all
    render json: specifications
  end

end
