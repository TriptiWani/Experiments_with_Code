class PhoneNumbersController < ApplicationController

  def new
    @phone_number = PhoneNumber.new
  end

  def create
    @phone_number = PhoneNumber.find_or_create_by(phone_number: params[:phone_number][:phone_number])
    @phone_number.generate_pin
    @phone_number.send_pin
    respond_to do |format|
      format.js # render app/views/phone_numbers/create.js.erb
    end
  end

  def verify
    @phone_number = PhoneNumber.find_by(phone_number: params[:hidden_phone_number])
    @phone_number.verify(params[:pin])
    # binding.pry
    user = User.create(name: params[:name], email: params[:email])

    # user.name = params[:name]
    # user.email =  params[:email]
    user.save
    # binding.pry
    @phone_number.user = user
    @phone_number.save

    respond_to do |format|
      format.js
    end
  end

  private
  def user_params

  end

end
