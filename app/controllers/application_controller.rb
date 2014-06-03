class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  after_filter :set_online

  helper_method :all_who_are_in_touch

  def after_sign_in_path_for(resource)
  	news_feeds_path
	end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :name
    devise_parameter_sanitizer.for(:account_update) << :name
  end
  
  private

  def set_online
    if !!current_user
      # не нужно значение, нужен только ключ
        $redis_onlines.set( current_user.id, nil, ex: 10*60 )
      # `ex: 10*60` - устанавливаем время жизни ключа - 10 минут, через 10 мину ключ удалиться
    end
  end

  def all_who_are_in_touch
    $redis_onlines.keys.count
    # => [ "123", "234", "1", "23" ]
    # вернёт массив с id онлайн пользователей
  end

end
