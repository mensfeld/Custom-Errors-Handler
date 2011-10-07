require 'rubygems'
require 'action_controller'

class CustomErrorsHandlerController < ActionController::Base
  # Where it should look for error templates
  VALID_ERRORS_DIR_PREFIX  = ['', 'layouts', 'shared']
  VALID_ERRORS_DIR_POSTFIX = ['', 'errors', 'shared']

  ERRORS = [
    :internal_server_error,
    :not_found,
    :unprocessable_entity
  ].freeze

  # Handle error by creating action corresponding to error type
  ERRORS.each do |e|
    define_method e do
      # Get path parts to check if error template exists
      path = request.path
      respond_to do |format|
        format.html { render error_layout(path, e), :status => e }
        format.any { head e }
      end
    end
  end

  private

  # Returns the file from which Rails should render error template
  def error_layout(path, e)
    e = translate_error(e)
    path = path.split('/')
    path.size.downto(0) do |i|
      VALID_ERRORS_DIR_POSTFIX.each do |lay_path|
        template_path = File.join(path[0,i], lay_path, e)
        return template_path if template?(template_path)
        template_path = File.join(path[0,i], 'errors',e)
        return template_path if template?(template_path)
      end
      template_path = File.join(path[0,i], e)
      return template_path if template?(template_path)
    end

    VALID_ERRORS_DIR_PREFIX.each do |lay_path|
      path.size.downto(0) do |i|
        template_path = File.join(lay_path, path[0,i], e)
        return template_path if template?(template_path)
        template_path = File.join(lay_path, path[0,i], 'errors',e)
        return template_path if template?(template_path)
      end
      template_path = File.join(path[0,i], e)
      return template_path if template?(template_path)
    end
    template_from_public(e)
  end

  def template?(template)
    exists = false
    ['erb', 'haml'].each do |ext|
      exists = true if FileTest.exist?(File.join(Rails.root, 'app', 'views', "#{template}.html.#{ext}"))
      exists = true if FileTest.exist?(File.join(Rails.root, 'app', 'views', "#{template}.#{ext}"))
    end
    exists
  end

  # Converts "name" of error into its number
  def translate_error(e)
    case e
    when :internal_server_error then '500'
    when :not_found then '404'
    when :unprocessable_entity then '422'
    else '500'
    end
  end

  def template_from_public(e)
    File.join("#{Rails.root}", 'public', "#{e}.html")
  end
end