Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, ENV["GOOGLE_CLIENT_ID"], ENV["GOOGLE_CLIENT_SECRET"],
    {
    :client_options => { :ssl => { :ca_file => 'C:\Ruby21\cacert.pem'}},
    :provider_ignores_state => true,
    :redirect_uri => 'https://.../users/auth/google_oauth2/callback',
    :prompt => "select_account",
    setup: (lambda do |env|
      request = Rack::Request.new(env)
      env['omniauth.strategy'].options['token_params'] = {:redirect_uri => 'https://.../users/auth/google_oauth2/callback'}
    end)
    }
end
