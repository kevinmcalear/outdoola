class Api::V1::ApiController < ApplicationController

  before_filter :set_current_user

  skip_before_action :verify_authenticity_token

  rescue_from Exception, :with => :render_500 if Rails.env.production?

  # this only renders in production to give a message to the user, I still need to figure out how to log the Error.
  def render_500(exception)
    render json: { messages:
      [{ text: "Sorry, we are currently experiencing a problem.", severity:"error" }]
    }, :status => 500
  end

  # Send 'em back where they came from with a slap on the wrist
  def authority_forbidden(error)
    render json: { messages:
      [{ text: "Sorry, you aren't allowed to do that.", severity:"error" }]
    }, :status => 403
  end

  private

  def admin
    unauthorized if !@current_user.admin?
  end

  def ufields( user )
    {
      id: user.id,
      first_name: user.first_name,
      last_name: user.last_name,
      picture: user.avatar.url
    }
  end

  def date_format
    "%m/%d/%Y"
  end

  def parseDate( *f )
    Date.strptime( f[0] || date, date_format)
  end

  def date
    params.require(:date)
  end

  def lowerBound
    1.send( %w[year month day].include?(get_period) ? get_period : 'week' ).ago
  end

  def upperBound
    1.second.ago
  end

  def get_period
    !params[:period].nil? ? params[:period].downcase : nil
  end

  def unauthorized
    return render json: {}, :status => :unauthorized
  end

  def set_current_user

    key = request.headers['HTTP__AUTH_TOKEN']
    if key.nil?
      render json: {}, :status => :unauthorized
    end

    @current_user = User.find_by_api_key(key)
    if !@current_user || ( @current_user && !@current_user.has_feature?(:new_app) )
      unauthorized
    end
  end

end
