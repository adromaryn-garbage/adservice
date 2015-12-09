Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, ENV["CLIENT_ID"], ENV["CLIENT_SECRET"],
    {
    :redirect_uri => 'https://adservice-adromaryn/users/auth/google_oauth2/callback',
    :prompt => "select_account",
    setup: (lambda do |env|
      request = Rack::Request.new(env)
      env['omniauth.strategy'].options['token_params'] = {:redirect_uri => 'https://adservice-adromaryn/users/auth/google_oauth2/callback'}
    end)
    }
end
