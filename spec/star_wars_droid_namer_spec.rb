require './lib/star_wars_droid_namer'

describe StarWarsDroidNamer do
  #let(:swdn) { StarWarsDroidNamer.new }
  subject { StarWarsDroidNamer::Api.new }

  describe "naming functionality" do

    it "can generate an R2 droid name conforming to R2-[alphanumeric][alphanumeric] with longer serial name" do
      expect(subject.generate_droid_name("R2", {:treat_as_droid_manufacturer => false}).to_s).to match(/^R2-[A-Z0-9][A-Z0-9] serial: R2-[A-Z0-9]{8}-[A-Z0-9]{2}-[A-Z0-9]{2}-[A-Z0-9]{4}-[A-Z0-9]{8}-[A-Z0-9]{2}-[A-Z0-9]{4}-[A-Z0-9]{2}-[A-Z0-9]{8}-[A-Z0-9]{2}-[A-Z0-9]{2}-[A-Z0-9]{4}-[A-Z0-9]{2}$/)
    end

    it "can generate an R2 droid name conforming to R2-[supplied-pattern]-[alphanumeric][alphanumeric]" do
      expect(subject.generate_droid_name("R2", {:treat_as_droid_manufacturer => false, :use_pattern => "XXX-XXX-XXX-XXX"}).to_s).to match(/^R2-[A-Z0-9][A-Z0-9] serial: R2-[A-Z0-9]{3}-[A-Z0-9]{3}-[A-Z0-9]{3}-[A-Z0-9]{3}-[A-Z0-9]{2}$/)
    end

    it "can generate a LOM manufacturer droid name conforming to [alphanumeric]-LOM with longer serial name" do
      expect(subject.generate_droid_name("LOM", {:treat_as_droid_manufacturer => true}).to_s).to match(/^[A-Z0-9]-LOM serial: [A-Z0-9]-LOM-[A-Z0-9]{8}-[A-Z0-9]{2}-[A-Z0-9]{2}-[A-Z0-9]{4}-[A-Z0-9]{8}-[A-Z0-9]{2}-[A-Z0-9]{4}-[A-Z0-9]{2}-[A-Z0-9]{8}-[A-Z0-9]{2}-[A-Z0-9]{2}-[A-Z0-9]{4}-[A-Z0-9]{2}$/)
    end

    it "can generate a LOM manufacturer droid name conforming to [alphanumeric]-LOM-[supplied-pattern]-[alphanumeric][alphanumeric]" do
      expect(subject.generate_droid_name("LOM", {:treat_as_droid_manufacturer => true, :use_pattern => "XXX-XXX-XXX-XXX"}).to_s).to match(/^[A-Z0-9]-LOM serial: [A-Z0-9]-LOM-[A-Z0-9]{3}-[A-Z0-9]{3}-[A-Z0-9]{3}-[A-Z0-9]{3}-[A-Z0-9]{2}$/)
    end

  end

end
