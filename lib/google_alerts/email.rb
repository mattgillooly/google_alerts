require 'nokogiri'

module GoogleAlerts

  class Email

    attr_reader :results

    def initialize(html)
      @results = []

      doc = Nokogiri::HTML(html)

      styled_links = doc.css('a').select{|l| l['style']}

      alert_links = styled_links.select{|l| l['style'].match(/color:\s?#?1111[cC][cC]/) }

      alert_links.each do |link|
        desc = link.parent.at_css('font')

        if source_link = desc.at_css('a')
          source = source_link.content
        end

        desc.css('a').each(&:remove)
        blurb = desc.content

        @results << GoogleAlerts::Result.new(link[:href], link.content, source, blurb)
      end
    end

  end

end
