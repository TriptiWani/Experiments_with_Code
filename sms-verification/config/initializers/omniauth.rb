Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, ENV["TWIITER_API_KEY"], ENV["TWITTER_SECRET"]
end
