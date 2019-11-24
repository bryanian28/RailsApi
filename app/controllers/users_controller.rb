class UsersController < ApplicationController
    before_action :set_headers

        # THIS
        def set_headers
            headers['Access-Control-Allow-Origin'] = '*'
            headers['Access-Control-Allow-Methods'] = 'POST, PUT, DELETE, GET, PATCH, OPTIONS'
            headers['Access-Control-Request-Method'] = '*'
            headers['Access-Control-Allow-Headers'] = 'Origin, X-Requested-With, Content-Type, Accept, Authorization'
          end
    # GET /users
    def index
      @users = User.all
      render json: @users, status: :ok
    end

    # GET /users/{username}
    def show
      render json: @user, status: :ok
    end

    # POST /users
    def create
      @user = User.new(user_params)
      if @user.save
        render json: @user, status: :created
      else
        render json: { errors: @user.errors.full_messages },
               status: :unprocessable_entity
      end
    end

    # PUT /users/{username}
    def update
      unless @user.update(user_params)
        render json: { errors: @user.errors.full_messages },
               status: :unprocessable_entity
      end
    end

    # DELETE /users/{username}
    def destroy
      @user.destroy
    end

    private

    def find_user
      @user = User.find_by_username!(params[:_username])
      rescue ActiveRecord::RecordNotFound
        render json: { errors: 'User not found' }, status: :not_found
    end

    def user_params
      params.permit(
       :username, :password
      )
    end
  end