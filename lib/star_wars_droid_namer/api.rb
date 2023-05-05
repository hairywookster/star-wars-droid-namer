module StarWarsDroidNamer

  # The Api class - a simple process to geenrate a droid name and its fuller serial number
  class Api

    # Generates a random droid name based on the supplied inputs
    #
    # Example:
    #  api = StarWarsDroidNamer::Api.new
    #  droid_name = api.generate_droid_name( "R2", {:treat_as_droid_manufacturer => false}  )
    #
    # Returns:
    #   (StarWarsDroidNamer::DroidName) the randomly generated droid name
    def generate_droid_name( droid_type, options )
      pattern = pick_pattern( options[:use_pattern], options[:treat_as_droid_manufacturer], droid_type )
      full_name = generate_full_name( pattern )
      short_name = retrieve_short_name( full_name, options[:treat_as_droid_manufacturer], droid_type )
      StarWarsDroidNamer::DroidName.new( short_name, full_name )
    end

    private
    # Simple list of alphanumerics to use as substitutions in the droid name pattern
    ALPHANUMERICS = ( ('A'..'Z').to_a + (0..9).to_a.map{|x| x.to_s } )

    def pick_pattern( manual_pattern, treat_as_droid_manufacturer, droid_type )
      if manual_pattern
        if treat_as_droid_manufacturer
          pattern = "X-#{droid_type}-#{manual_pattern.upcase}-XX"
        else
          pattern = "#{droid_type}-#{manual_pattern.upcase}-XX"
        end
      else
        if treat_as_droid_manufacturer
          pattern = "X-#{droid_type}-XXXXXXXX-XX-XX-XXXX-XXXXXXXX-XX-XXXX-XX-XXXXXXXX-XX-XX-XXXX-XX"
        else
          pattern = "#{droid_type}-XXXXXXXX-XX-XX-XXXX-XXXXXXXX-XX-XXXX-XX-XXXXXXXX-XX-XX-XXXX-XX"
        end
      end
      pattern
    end

    def generate_full_name( pattern )
      full_name = ''
      pattern.each_char do |x|
        if x.eql?('X')
          full_name << random_alphanumeric
        else
          full_name << x
        end
      end
      full_name
    end

    def retrieve_short_name( full_name, treat_as_droid_manufacturer, droid_type )
      if treat_as_droid_manufacturer
        short_name = "#{full_name[0..(full_name.index("-", 3)-1)]}"
      else
        short_name = "#{droid_type}-#{full_name[-2..-1]}"
      end
      short_name
    end

    def random_alphanumeric
      ALPHANUMERICS.sample
    end

  end

end
