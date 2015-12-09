Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, ENV["GOOGLE_CLIENT_ID"], ENV["GOOGLE_CLIENT_SECRET"],
    {
      :name => "google",
      :scope => "email, profile, plus.me, http://gdata.youtube.com",
      :prompt => "select_account",
      :image_aspect_ratio => "square",
      :image_size => 50
      setup: (lambda do |env|
        request = Rack::Request.new(env)
        env['omniauth.strategy'].options['token_params'] = {:redirect_uri => 'https://.../users/auth/google_oauth2/callback'}
      end)
    }
end
