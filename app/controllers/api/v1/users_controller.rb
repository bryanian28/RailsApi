class Api::V1::UsersController < ApplicationController
  def create
    input = User.new(params.permit(:username, :password))

    if input.save
        render json: {status: 'SUCCESS', message:'Loaded Users', data:input},status: :ok
    else
        render json: {status: 'ERROR', message:'Users not saved', data:input.errors},status: :unprocessable_entity
    end
end
end
