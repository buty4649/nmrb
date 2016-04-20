module Nmrb
  class Cli < Hogun

    class SandBox
      class Nginx
        class Request
          attr_accessor :scheme, :content_type, :request_line, :uri, :unparsed_uri, :method,
                        :protocol, :args, :hostname, :authority
        end
      end

      def run(script)
        self.instance_eval {
          eval script
        }
      end
    end

    desc "version", "show version"
    def version()
      puts "v#{Nmrb::VERSION}"
    end

    desc "exec </path/to/mruby.rb> <URL>", "exec ngx_mruby scripts"
    def exec(filepath, request_url)
      uri = URI.parse(request_url)
      content_type = "text/plain"
      method = "GET"
      protocol = "HTTP/1.1"
      unparsed_uri = uri.path
      unparsed_uri << "?#{uri.query}" if uri.query
      unparsed_uri << uri.fragment if uri.fragment

      SandBox::Nginx::Request.class_eval do
        eval <<-EOS
          def initialize
            @scheme       = "#{uri.schema}"
            @content_type = "#{content_type}"
            @request_line = "#{method} #{unparsed_uri} #{method}"
            @uri          = "#{uri.path}"
            @unparsed_uri = "#{unparsed_uri}"
            @method       = "#{method}"
            @protocol     = "#{protocol}"
            @args         = "#{uri.query}"
            @hostname     = "#{uri.host}"
            @authority    = "#{uri.host}:#{uri.port}"
          end
        EOS
      end

      Object.remove_const(:MTest)
      script = File.read(filepath)
      puts SandBox.new.run(script)
    end
  end
end
