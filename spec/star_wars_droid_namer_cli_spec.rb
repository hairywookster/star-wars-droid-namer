require 'star_wars_droid_namer_cli'

describe "Star Wars Droid Namer Cmd Line App" do

  describe "Cmd line naming functionality" do

    it "can generate an r2 model droid name" do
      expect{ StarWarsDroidNamer::Cli.new.invoke(
        :generate, ["R2"], {treat_as_droid_manufacturer: false} ) }.to(
        output( /^R2-[A-Z0-9][A-Z0-9] serial: R2-[A-Z0-9]{8}-[A-Z0-9]{2}-[A-Z0-9]{2}-[A-Z0-9]{4}-[A-Z0-9]{8}-[A-Z0-9]{2}-[A-Z0-9]{4}-[A-Z0-9]{2}-[A-Z0-9]{8}-[A-Z0-9]{2}-[A-Z0-9]{2}-[A-Z0-9]{4}-[A-Z0-9]{2}$/ ).to_stdout )
    end

    it "can generate an r2 model droid name with custom pattern" do
      expect{ StarWarsDroidNamer::Cli.new.invoke(
        :generate, ["R2"], {treat_as_droid_manufacturer: false, :use_pattern => "XXX-XXX-XXX-XXX"} ) }.to(
        output( /^R2-[A-Z0-9][A-Z0-9] serial: R2-[A-Z0-9]{3}-[A-Z0-9]{3}-[A-Z0-9]{3}-[A-Z0-9]{3}-[A-Z0-9]{2}$/ ).to_stdout )
    end

    it "can generate an r2 model droid name with custom lowercase.mixed case pattern" do
      expect{ StarWarsDroidNamer::Cli.new.invoke(
        :generate, ["R2"], {treat_as_droid_manufacturer: false, :use_pattern => "xxx-XXX-xxx-XXX"} ) }.to(
        output( /^R2-[A-Z0-9][A-Z0-9] serial: R2-[A-Z0-9]{3}-[A-Z0-9]{3}-[A-Z0-9]{3}-[A-Z0-9]{3}-[A-Z0-9]{2}$/ ).to_stdout )
    end

    it "can generate an 3P0 model droid name" do
      expect{ StarWarsDroidNamer::Cli.new.invoke(
        :generate, ["3PO"], {treat_as_droid_manufacturer: true} ) }.to(
        output( /^[A-Z0-9]-3PO serial: [A-Z0-9]-3PO-[A-Z0-9]{8}-[A-Z0-9]{2}-[A-Z0-9]{2}-[A-Z0-9]{4}-[A-Z0-9]{8}-[A-Z0-9]{2}-[A-Z0-9]{4}-[A-Z0-9]{2}-[A-Z0-9]{8}-[A-Z0-9]{2}-[A-Z0-9]{2}-[A-Z0-9]{4}-[A-Z0-9]{2}$/ ).to_stdout )
    end

    it "can generate an 3P0 model droid name with custom pattern" do
      expect{ StarWarsDroidNamer::Cli.new.invoke(
        :generate, ["3PO"], {treat_as_droid_manufacturer: true, :use_pattern => "XXX-XXX-XXX-XXX"} ) }.to(
        output( /^[A-Z0-9]-3PO serial: [A-Z0-9]-3PO-[A-Z0-9]{3}-[A-Z0-9]{3}-[A-Z0-9]{3}-[A-Z0-9]{3}-[A-Z0-9]{2}$/ ).to_stdout )
    end

    it "is marked to exit on failure for better script integration" do
      expect( StarWarsDroidNamer::Cli.exit_on_failure? ).to be true
    end

  end

end
