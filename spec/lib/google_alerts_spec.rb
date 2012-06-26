require 'spec_helper'

describe GoogleAlerts do

  it "parses search results out of an email" do
    html = stub(:html)
    results = stub(:results)

    alert = stub(:alert, results: results)
    GoogleAlerts::Email.stub(:new).with(html).and_return(alert)

    GoogleAlerts.parse_email(html).should == results
  end

end
