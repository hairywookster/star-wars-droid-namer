module StarWarsDroidNamer
  # The DroidName class - a simple wrapper around the droid name and its fuller serial number
  class DroidName
    # name, like R2-D2
    attr_reader :name
    # serial_number
    attr_reader :serial_number

    # Initializes a new DroidName instance
    # Example:
    #  StarWarsDroidNamer::DroidName.new( 'R2-D2', 'R2-XXXXXXXXXXXXXXXXXXXXXX-D2' )
    #  new instance of droid name
    #
    # Arguments:
    #   name: (Symbol) the name of the droid
    #   serial_number: (String) the fuller droid name represented by a serial number
    def initialize( name, serial_number )
      @name = name
      @serial_number = serial_number
    end

    # Returns a string that can be used to render the droid name.
    # If you need a different format you can build your own using the attribute readers...
    # Example:
    #   droid_name = StarWarsDroidNamer::DroidName.new( 'R2-D2', 'R2-XXXXXXXXXXXXXXXXXXXXXX-D2' )
    #   droid_name._to_s    (R2-D2 serial: R2-XXXXXXXXXXXXXXXXXXXXXX-D2)
    #
    # Returns:
    #   (String) the textual version of the droid name ready for display
    def to_s
      (@serial_number.nil? || @serial_number.empty?) ? name : "#{@name} serial: #{@serial_number}"
    end
  end

end
