ENV['RAILS_ENV'] ||= 'test'

class ActiveSupport::TestCase
  fixtures :all

  # Returns true if a test user is logged in.
  def is_logged_in?
    !session[:use_id].nil?
  end

  # Logs in a test user.
  def log_in_as(use, options = {})
    password    = options[:password]    || 'password'
    remember_me = options[:remember_me] || '1'
    if integration_test?
      post login_path, session: { email:       use.email,
                                  password:    password,
                                  remember_me: remember_me }
    else
      session[:use_id] = use.id
    end
  end

  private

    # Returns true inside an integration test.
    def integration_test?
      defined?(post_via_redirect)
    end
end