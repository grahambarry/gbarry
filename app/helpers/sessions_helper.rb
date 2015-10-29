module SessionsHelper

  # Logs in the given use.
  def log_in(use)
    session[:use_id] = use.id
  end

   # Remembers a user in a persistent session.
  def remember(use)
    use.remember
    cookies.permanent.signed[:use_id] = use.id
    cookies.permanent[:remember_token] = use.remember_token
  end
  # Returns the user corresponding to the remember token cookie.
  def current_use
    if (use_id = session[:use_id])
      @current_use ||= Use.find_by(id: use_id)
    elsif (use_id = cookies.signed[:use_id])
      use = Use.find_by(id: use_id)
      if use && use.authenticated?(:remember, cookies[:remember_token])
        log_in use
        @current_use = use
      end
    end
  end

  # Returns true if the use is logged in, false otherwise.
  def logged_in?
    !current_use.nil?
  end
  # Forgets a persistent session.
  def forget(use)
    use.forget
    cookies.delete(:use_id)
    cookies.delete(:remember_token)
  end

    def current_use?(use)
    use == current_use
  end

  # Logs out the current user.
  def log_out
    forget(current_use)
    session.delete(:use_id)
    @current_use = nil
  end
  # Redirects to stored location (or to the default).
  def redirect_back_or(default)
    redirect_to(session[:forwarding_url] || default)
    session.delete(:forwarding_url)
  end

  # Stores the URL trying to be accessed.
  def store_location
    session[:forwarding_url] = request.url if request.get?
  end
end