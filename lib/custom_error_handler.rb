require 'action_dispatch/middleware/show_exceptions'
require 'custom_errors_handler_controller'

# Use our show exception dispatcher localized in errors_controller to handle showing/rendering exceptions
module ActionDispatch
  class ShowExceptions
    private
      def render_exception_with_template(env, exception)
        body = CustomErrorsHandlerController.action(rescue_responses[exception.class.name]).call(env)
        log_error(exception)
        body
      rescue
        render_exception_without_template(env, exception)
      end

      alias_method_chain :render_exception, :template
  end
end

