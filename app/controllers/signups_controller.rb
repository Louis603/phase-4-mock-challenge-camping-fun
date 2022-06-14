class SignupsController < ApplicationController
    rescue_from ActiveRecord::RecordInvalid, with: :unprocessable

    def create
        # singup = Singup.create(camper_id: params[:camper_id], activity_id: params[:activity_id], time: params:[:time])
        signup = Signup.create!(signup_params)
        render json: signup, includes: ['activity'], status: :created
    end

    private

    def signup_params
        params.permit(:camper_id, :activity_id, :time)
    end

    def unprocessable
        render json: { error: "validation errors" }, status: 422
    end
end
