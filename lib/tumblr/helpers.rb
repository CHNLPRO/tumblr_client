module Tumblr
  class Client
    module Helper
      
      def valid_options(valid_opts, opts)
        bad_opts = opts.select { |key, _| !valid_opts.include?(key) }
        if !bad_opts.empty?
          raise Exception, "Invalid options passed, Only #{valid_opts.join(', ')} allowed."
        end
        true
      end
    end
  end
end
