require 'custom_errors_handler_controller'

# Use our show exception dispatcher localized in errors_controller to handle showing/rendering exceptions
module MyActionDispatch
  # Basicly - we do same stuff as ActionDispatch::ShowExceptions - but we render different things
  class ShowExceptions < ActionDispatch::ShowExceptions
    
    private
  
    def render_exception_with_template(env, exception)
      log_error(exception)
      begin
        CustomErrorsHandlerController.action(rescue_responses[exception.class.name]).call(env)
      rescue
        render_exception_without_template(env, exception)
      end
    end

    alias_method_chain :render_exception, :template
  end

end

# Swap actiondispatcher
class Railtie < Rails::Railtie
  initializer "app.insert_my_errors_handler" do |app|
    app.config.middleware.swap ActionDispatch::ShowExceptions, MyActionDispatch::ShowExceptions
  end
end

