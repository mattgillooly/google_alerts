module GoogleAlerts

  def parse_email(html)
    GoogleAlerts::Email.new(html).results
  end

end

require 'google_alerts/email'
require 'google_alerts/result'

