module GoogleAlerts

  class Result < Struct.new(:link, :title, :source, :blurb)
    def to_s
      "#{title} #{link}"
    end
  end

end
