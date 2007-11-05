module Typeraker
  module Builder
    class Pdf < Base
      def initialize(*args)
        @build_name = 'pdf'
      end

      def build(base_ps_file, distribution_name)
        build_dir do
          dvips = Typeraker::Runner::Ps2Pdf.new(base_ps_file)
        end
        distribute_file(base_ps_file, distribution_name)
        notice "Build of #{@build_name} completed for: #{base_ps_file} " +
               "in #{Typeraker.options[:build_dir]}"
      end
    end
  end
end
