require 'spec_helper'

describe GoogleAlerts::Email do

  it "parses a directly sent Google Alerts HTML email" do
    email_html = File.open(fixture_path('direct_google_alert.html')).read

    alert = GoogleAlerts::Email.new(email_html)

    alert.should have(20).results

    r = alert.results.first

    r.link.should == "http://www.google.com/url?sa=X&q=http://online.wsj.com/article/SB10001424052702303753904577454780835071746.html&ct=ga&cad=CAcQAhgAIAAoATAAOABA_ZLN_gRIAVAAWABiBWVuLVVT&cd=CdqxpRMOlqU&usg=AFQjCNF8QeEc3FjZ0HH_kmyftTW_s236Eg"

    r.title.should == "Where Dogs Rule the Roost"

    r.source.should == "Wall Street Journal"

    r.blurb.should == %{By SOPHIA HOLLANDER Counselor Julia Blair entertains a group of dogs at Wag Club, a dog spa and day-care center in Brooklyn. Luxury buildings in New York City have created an ever-lengthening check list in their amenities arm race. Child's playroom?}

  end

  it "parses a forwarded Google Alerts HTML email" do
    email_html = File.open(fixture_path('forwarded_google_alert.html')).read

    alert = GoogleAlerts::Email.new(email_html)

    alert.should have(17).results

    r = alert.results.first

    r.link.should == "http://www.google.com/url?sa=X&q=http://www.denverpost.com/news/ci_20789574/food-trucks-return-civic-center-eats&ct=ga&cad=CAcQAhgAIAAoATAAOABAlZG7_gRIAVAAWABiBWVuLVVT&cd=rZSXwm2IACg&usg=AFQjCNE3qLvKs77NAMarRsJvychLhygQ4w"

    r.title.should == "Food trucks return for Civic Center EATS"

    r.source.should == "Denver Post"

    r.blurb.should == %{"We were both kind of tired of our jobs, and my sister said, 'well, why don't you guys start a food truck," Mandel, 27, said. For Cunningham, 30, "food truck" was no foreign concept. In fact, 1976 his parents started RollinGreens, a Boulder-based ...}

  end

end
