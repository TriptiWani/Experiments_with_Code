class PhoneNumber < ActiveRecord::Base
  belongs_to :user
  def generate_pin
    self.pin = rand(0000..9999).to_s.rjust(4, "0")
    save
  end

  def verify(entered_pin)
    update(verified: true) if self.pin == entered_pin
  end


  def twilio_client
    # Twilio::REST::Client.new('AC12b98fe38a3011db528e2fa36b0db60c', '307c236df04fb3f7e4921d5a53cd290a')
    Twilio::REST::Client.new('AC4f3ebc3cabcbe69987e6cd5c9c6dd23e', '46a3e0a78e96c1c6dd4ffc0c9ad78d11')
    # Twilio::REST::Client.new(ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN'])
  end

  def send_pin
    twilio_client.messages.create(
      to: phone_number,
      from: '+61437784816',
      # from: '+61437901606',
      # from: ENV['TWILIO_PHONE_NUMBER'], +61437784816
      body: "Your PIN is #{pin}"
    )
  end
end
