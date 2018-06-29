module ForwarderSchema
  class Start
    def self.call
      Db::Connect.()
    end
  end
end
