require 'net/http'

module Doneyo
  class Yo
    ENDPOINT = 'http://doneyo.herokuapp.com'
    CONFIG_FILE_NAME = '.yorc'

    class << self
      def send
        begin
          puts new(username).send
        rescue
          $stderr.puts $!.to_s
          abort
        end
      end


      private

      def config_file
        File.join(ENV['HOME'], CONFIG_FILE_NAME)
      end

      def username
        ask_user unless File.exists?(config_file)

        hash = parse_into_hash(File.read(config_file))
        hash['[user]'] =~ /name\s*=\s(\S+)/
        $1
      end

      def ask_user
        print 'Your Yo username? : '
        create_config_file gets
      end

      def create_config_file(user)
        user = user.to_s.strip
        raise 'Username required' if user == ''

        open(config_file, 'w') do |f|
          f.write "[user]\nname = #{user}"
        end
      end

      def parse_into_hash(string)
        Hash[
          string.split(/(\[[^\[\]]+\])/)[1..-1].each_slice(2).to_a
        ]
      end
    end


    def initialize(user)
      @user = user
    end

    def send
      response = Net::HTTP.post_form(URI.parse(ENDPOINT), user: @user)
      response.body
    end
  end
end
