require "json"

module Merja::Pathname
  # JSONファイルを読み込んで返すだけ
  class Json < Pathname
    def to_hash
      File.open(self.to_s) do |io|
        JSON.load(io)
      end
    end
  end
end
