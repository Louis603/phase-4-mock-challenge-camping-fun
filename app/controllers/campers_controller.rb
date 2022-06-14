class CampersController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :not_found
    rescue_from ActiveRecord::RecordInvalid, with: :unprocessable

    def index
        campers = Camper.all 
        render json: campers, status: :ok
    end

    def show
        camper = Camper.find(params[:id])
        render json: camper, status: :ok 
    end

    def create
        camper = Camper.create!(name: params[:name], age: params[:age])
        render json: camper, status: :created
    end


    private

    def not_found
        render json: { error: "Camper not found" }, status: :not_found
    end

    def unprocessable
        render json: { error: "Age must be less than or equal to 18" }, status: :unprocessable_entity
    end
end
