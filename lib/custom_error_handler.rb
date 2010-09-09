
# Where it should look for error templates
VALID_PATHS = ['layouts']

module ActionDispatch
  class ShowExceptions
    private
      def render_exception_with_template(env, exception)
        body = ErrorsController.action(rescue_responses[exception.class.name]).call(env)
        log_error(exception)
        body
      rescue
        render_exception_without_template(env, exception)
      end

      alias_method_chain :render_exception, :template
  end
end
