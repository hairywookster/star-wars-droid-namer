require "thor"
require_relative "star_wars_droid_namer"

module StarWarsDroidNamer

  # The command line app version of the StarWarsDroidNamer gem
  class Cli < Thor
    include Thor::Actions
    #class_option :verbose, :type => :boolean

    # Thor requires this to behave correctly when used from other scripts
    def self.exit_on_failure?
      true
    end

    # no_commands{
    #   def namer
    #     @namer ||= StarWarsDroidNamer::Api.new
    #   end
    # }

    desc "generate DROID_TYPE <options>", "generate a droid name"
    long_desc <<-LONGDESC
      star_wars_droid_namer generate R2
      will generate a droid name for the R2 family of droids that conforms to the R2-[alphanumeric][alphanumeric] pattern and includes the fuller droid serial number.

      star_wars_droid_namer generate LOM --treat_as_droid_manufacturer
      will generate a LOM droid name conforms to the [alphanumeric]-LOM pattern and includes the fuller droid serial number.

      star_wars_droid_namer generate LOM --treat_as_droid_manufacturer --number_to_generate=5
      will generate 5 LOM droid names

      star_wars_droid_namer generate R2 --use_pattern="XXXXXXXX-XXXXXXXX"
      will generate an R2 droid name R2-XXXXXXXX-XXXXXXXX-[alphanumeric][alphanumeric] pattern

      Example non manufacturer droid prefixes: R1, R2, R3, R4, R5, G8, C2, BB, K, HK, RA, C1, U9, M5

      Example manufacturer droid postfixes: 3PO (C-3PO) , LOM (4-LOM)  (use the --treat_as_droid_manufacturer flag)
    LONGDESC
    option :treat_as_droid_manufacturer, :type => :boolean, :default => false, :aliases => "-m"
    option :use_pattern, :type => :string, :aliases => "-p"
    option :number_to_generate, :type => :numeric, :default => 1, :aliases => "-n"
    # Generates one or more random droid names
    #
    # Arguments:
    #   droid_type: (String) the type of droid
    #   See command line for rest of related flags as handled by thor
    #
    # Emits:
    #  the name of the droid to stdout
    def generate(droid_type)
      api = StarWarsDroidNamer::Api.new
      (1..options[:number_to_generate]).each do
        puts api.generate_droid_name(droid_type, options )
      end
    end

  end

end
