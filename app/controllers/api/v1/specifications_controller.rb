class Api::V1::SpecificationsController < ApplicationController
  def index
    specifications = Specification.all
    if specifications.any?
      render json: specifications, status: :ok
    else
      render json: { message: 'No specifications found' }, status: :ok
    end
  end

  def show
    specification = Specification.find(params[:id])
    render json: specification
  end

  def create
    specification = Specification.new(specification_params)
    if specification.save
      render json: specification, status: :created
    else
      render json: specification.errors, status: :unprocessable_entity
    end
  end

  private

  def specification_params
    params.require(:specification).permit(:name)
  end
end
