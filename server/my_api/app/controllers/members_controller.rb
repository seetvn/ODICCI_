require_relative "klaviyo_api"
class MembersController < ApplicationController
  def index
    render json: params[:member]
   
  end

  def handle_options
    # Set the appropriate CORS headers
    headers['Access-Control-Allow-Origin'] = '*' # Replace '*' with your desired origin
    headers['Access-Control-Allow-Methods'] = 'GET, POST, PUT, PATCH, DELETE, OPTIONS'
    headers['Access-Control-Allow-Headers'] = 'Origin, X-Requested-With, Content-Type, Accept, Authorization'

    # Return an empty response with a 200 status code
    head :ok
  end

  def show
    # Implementation for the 'show' action
    render json: params[:members]
  end

  def create
    # Implementation for the 'create' action
    email= params[:member]["email"]
    phone_number=params[:member]["phoneNumber"]
    first_name=params[:member]["firstName"]
    last_name=params[:member]["lastName"]
    date_of_birth=params[:member]["DateOfBirth"]
    
    if check(email,phone_number)==true
      #def create (first_name,last_name,phone_number,email,date_of_birth)
      status_, detail=add_members(first_name,last_name,phone_number,email,date_of_birth)
      render detail, status: status_
    else
      render json: { error: 'Resource already exists' }, status: :conflict

    end
    

  end

  def update
    # Implementation for the 'update' action
  end

  def destroy
    # Implementation for the 'destroy' action
  end
end
